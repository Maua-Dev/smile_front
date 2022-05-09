import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/auth/errors/errors.dart';

import '../../../../shared/services/firebase-analytics/firebase_analytics_service.dart';
import '../../../auth/presenter/controllers/auth_controller.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  final AuthController authController;
  final FirebaseAnalyticsService analytics =
      Modular.get<FirebaseAnalyticsService>();

  _LoginController({required this.authController});

  @observable
  bool isLoading = false;

  @observable
  bool showPwd = false;

  @observable
  String cpfRne = '';

  @observable
  String password = '';

  @observable
  String errors = '';

  @action
  Future<void> setUsername(String value) async {
    if (value.contains("@")) {
      value = value.toLowerCase();
    } else {
      value = value.replaceAll('.', '');
      value = value.replaceAll('-', '');
    }
    cpfRne = value;
  }

  @action
  Future<void> setPassword(String value) async {
    password = value;
  }

  @action
  Future<void> login() async {
    setIsLoading(true);
    try {
      await authController.loginWithCpfRne(cpfRne, password);
      if (authController.isLogged) {
        if (authController.accessLevel == 'ADMIN') {
          Modular.to
              .navigate('/adm', arguments: [null, authController.accessLevel]);
        } else if (authController.accessLevel == 'SPEAKER') {
          Modular.to.navigate('/speaker-home');
        } else {
          Modular.to.navigate('/user/home',
              arguments: [cpfRne, authController.accessLevel]);
        }
      }
      analytics.logLogin();
    } on Failure catch (e) {
      errors = e.message;
    }
    setIsLoading(false);
  }

  @action
  Future<void> setError(String value) async {
    errors = value;
  }

  @action
  Future<void> setIsLoading(bool value) async {
    isLoading = value;
  }

  @action
  String? validateCpf(String value) {
    if (!value.contains('@')) {
      value = value.replaceAll('.', '');
      value = value.replaceAll('-', '');
      if (value.isEmpty) {
        return "         Campo obrigatório";
      } else if (!CPFValidator.isValid(value)) {
        return "         CPF inválido";
      }
    } else {
      if (value.isEmpty) {
        return "         Campo obrigatório";
      }
    }
    return null;
  }

  @action
  String? validateField(String value) {
    if (value.isEmpty) {
      return "         Campo obrigatório";
    }
    return null;
  }

  @action
  void toggleVisibilityPwd(bool value) {
    showPwd = !value;
  }
}
