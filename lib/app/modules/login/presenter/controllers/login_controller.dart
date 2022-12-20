import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/auth/errors/errors.dart';

// import '../../../../app_widget.dart';
// import '../../../../shared/error/error_snackbar.dart';

import '../../../auth/presenter/controllers/auth_controller.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  final AuthController authController;

  LoginControllerBase({
    required this.authController,
  });

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
    } on Failure {
      // if (scaffold.context.size!.width <= 1024) {
      //   showErrorSnackBar(errorMessage: e.message, color: AppColors.redButton);
      // } else {
      //   errors = e.message;
      // }
    }
    setIsLoading(false);
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
