import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/auth/errors/errors.dart';

import '../../../auth/presenter/controllers/auth_controller.dart';
import '../../../logged-home/domain/repositories/user_repository_interface.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  final AuthController authController;
  final UserRepositoryInterface repository;

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
      await authController.loginWithCpfRne(cpfRne, password, keepConected);
      if (authController.isLogged) {
        if (authController.accessLevel == 'ADMIN') {
          Modular.to.navigate('/logged-home/adm-home',
              arguments: [cpfRne, authController.accessLevel]);
        } else if (authController.accessLevel == 'SPEAKER') {
          Modular.to.navigate('/speaker-home');
        } else {
          Modular.to.navigate('/logged-home/user-home',
              arguments: [cpfRne, authController.accessLevel]);
        }
      }
    } on Failure catch (e) {
      errors = e.message;
    }
  }
}
