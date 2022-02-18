import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/auth/errors/errors.dart';
import 'package:smile_front/app/modules/logged-user-home/domain/repositories/user_repository_interface.dart';

import '../../../auth/auth_controller.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  final AuthController authController;
  final UserRepositoryInteface repository;

  _LoginController({required this.authController, required this.repository});

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
      await authController.loginWithEmail(cpfRne, password, keepConected);
      if (authController.isLogged) {
        if (authController.accessLevel == 0) {
          Modular.to.navigate('/adm-home', arguments: cpfRne);
        } else if (authController.accessLevel == 1) {
          Modular.to.navigate('/speaker-home');
        } else {
          Modular.to.navigate('/user-home', arguments: cpfRne);
        }
      }
    } on Failure catch (e) {
      errors = e.message;
    }
  }
}
