import 'package:email_validator/email_validator.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/auth/errors/errors.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';

import '../../../../../generated/l10n.dart';
import '../../../../app_widget.dart';
import '../../../../shared/error/error_snackbar.dart';
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
  String email = '';

  @observable
  String password = '';

  @observable
  String errors = '';

  @action
  Future<void> setUsername(String value) async {
    if (value.contains("@")) {
      value = value.toLowerCase();
    }
    email = value;
  }

  @action
  Future<void> setPassword(String value) async {
    password = value;
  }

  @action
  Future<void> login() async {
    errors = '';
    setIsLoading(true);
    try {
      await authController.loginWithUserEmail(email, password);
      if (authController.isLogged) {
        if (authController.role == 'ADMIN') {
          Modular.to.navigate('/adm', arguments: [null, authController.role]);
        } else {
          Modular.to
              .navigate('/user/home', arguments: [email, authController.role]);
        }
      }
    } on Failure catch (e) {
      if (scaffold.context.size!.width <= 1024) {
        showErrorSnackBar(
          errorMessage: e.message,
          color: AppColors.redButton,
        );
      } else {
        errors = e.message;
      }
    }
    setIsLoading(false);
  }

  @action
  Future<void> setIsLoading(bool value) async {
    isLoading = value;
  }

  @action
  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return S.current.fieldRequired;
    } else if (!EmailValidator.validate(value)) {
      return S.current.fieldEmailInvalid;
    }
    return null;
  }

  @action
  String? validateField(String? value) {
    return value!.isEmpty ? S.current.fieldRequired : null;
  }

  @action
  void toggleVisibilityPwd(bool value) {
    showPwd = !value;
  }
}
