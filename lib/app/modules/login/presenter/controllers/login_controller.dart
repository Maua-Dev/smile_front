import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/auth/errors/errors.dart';

import '../../../auth/presenter/controllers/auth_controller.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  final AuthController authController;

  _LoginController({required this.authController});

  @observable
  String cpfRne = '';

  @observable
  String password = '';

  @observable
  bool keepConected = false;

  @observable
  String errors = '';

  @action
  Future<void> setUsername(String value) async {
    cpfRne = value;
  }

  @action
  Future<void> setPassword(String value) async {
    password = value;
  }

  @action
  Future<void> login() async {
    try {
      await authController.loginWithCpfRne(cpfRne, password, keepConected);
      if (authController.isLogged) {
        if (authController.accessLevel == 'ADMIN') {
          Modular.to
              .navigate('/adm', arguments: [null, authController.accessLevel]);
        } else if (authController.accessLevel == 'SPEAKER') {
          Modular.to.navigate('/speaker-home');
        } else {
          Modular.to.navigate('/user',
              arguments: [cpfRne, authController.accessLevel]);
        }
      }
    } on Failure catch (e) {
      errors = e.message;
    }
  }
}
