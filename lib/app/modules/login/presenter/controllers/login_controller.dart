import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/auth/errors/errors.dart';

import '../../../auth/auth_controller.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  final AuthController authController;

  _LoginController(this.authController);

  @observable
  String username = '';

  @observable
  String password = '';

  @observable
  bool keepConected = false;

  @observable
  String errors = '';

  @action
  Future<void> setUsername(String value) async {
    username = value;
  }

  @action
  Future<void> setPassword(String value) async {
    password = value;
  }

  @action
  Future<void> login() async {
    try {
      await authController.loginWithEmail(username, password, keepConected);
      if (authController.isLogged) {
        if (authController.accessLevel == 0) {
          Modular.to.navigate('/adm-home');
        } else if (authController.accessLevel == 1) {
          Modular.to.navigate('/speaker-home');
        } else {
          Modular.to.navigate('/user-home');
        }
      }
    } on Failure catch (e) {
      errors = e.message;
    }
  }
}
