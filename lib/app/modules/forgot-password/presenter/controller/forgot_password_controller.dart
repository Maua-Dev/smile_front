import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:smile_front/app/app_widget.dart';
import 'package:smile_front/app/shared/services/firebase-analytics/firebase_analytics_service.dart';
import '../../../../../generated/l10n.dart';
import '../../../../shared/error/error_snackbar.dart';
import '../../../../shared/themes/app_colors.dart';
import '../../domain/usecases/change_password.dart';
import '../../domain/usecases/forgot_password.dart';
import '../../external/errors.dart';

part 'forgot_password_controller.g.dart';

class ForgotPasswordController = ForgotPasswordControllerBase
    with _$ForgotPasswordController;

abstract class ForgotPasswordControllerBase with Store {
  final ForgotPasswordInterface forgotPassword;
  final ChangePasswordInterface changePassword;
  final FirebaseAnalyticsService analytics;

  ForgotPasswordControllerBase(
      {required this.analytics,
      required this.forgotPassword,
      required this.changePassword});

  @observable
  bool isLoading = false;

  @observable
  String errors = '';

  @observable
  bool emailSent = false;

  @observable
  bool showPwd = false;

  @observable
  bool showConfirmPwd = false;

  @observable
  String username = '';

  @observable
  String password = '';

  @observable
  String verifyPassword = '';

  @observable
  String code = '';

  @observable
  bool successRegistration = false;

  @action
  Future<void> setError(String value) async {
    errors = value;
  }

  @action
  Future<void> setCode(String value) async {
    code = value;
  }

  @action
  Future<void> setEmail(String value) async {
    username = value;
    if (!value.contains('@')) {
      username = username.replaceAll('.', '').replaceAll('-', '');
    }
  }

  @action
  String? validateEmail(String? value) {
    if (!value!.contains('@')) {
      value = value.replaceAll('.', '');
      value = value.replaceAll('-', '');
      if (value.isEmpty) {
        return S.current.fieldRequired;
      } else if (!CPFValidator.isValid(value) || value.isEmpty) {
        return "E-mail inválido";
      }
    }
    return null;
  }

  @action
  Future<void> setIsLoading(bool value) async {
    isLoading = value;
  }

  @action
  Future<void> forgotUserPassword() async {
    setIsLoading(true);
    try {
      await forgotPassword(username);
      emailSent = true;
    } on Failure catch (e) {
      if (scaffold.context.size!.width <= 1024) {
        showErrorSnackBar(errorMessage: e.message, color: AppColors.redButton);
      } else {
        errors = e.message;
      }
    }
    setIsLoading(false);
  }

  @action
  Future<void> changeUserPassword() async {
    setIsLoading(true);
    try {
      String? myurl = Uri.base.toString();
      var params = myurl.split('?')[1];
      var code = params.split("&")[0].split('=')[1];
      var email = params.split("&")[1].split('=')[1];
      var emailProvider = params.split("&")[2].split('=')[1];
      var finalEmail = "$email@$emailProvider";
      await changePassword(finalEmail, password, code);
      setSuccessRegistration(true);
      await Future.delayed(const Duration(seconds: 5));
      Modular.to.navigate('/login');
    } on Failure catch (e) {
      if (scaffold.context.size!.width <= 1024) {
        showErrorSnackBar(errorMessage: e.message, color: AppColors.redButton);
      } else {
        errors = e.message;
      }
    }
    setIsLoading(false);
  }

  @action
  Future<void> setPassword(String value) async {
    password = value;
  }

  @action
  Future<void> setVerifyPassword(String value) async {
    verifyPassword = value;
  }

  @action
  Future<void> setSuccessRegistration(bool value) async {
    successRegistration = value;
  }

  @action
  String? validateVerifyPassword(String? value) {
    if (value!.isEmpty) {
      return S.current.fieldRequired;
    }
    if (password != verifyPassword) {
      return S.current.fieldPasswordEqualsRequired;
    }
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return S.current.fieldPasswordRequisits;
    }
    return null;
  }

  @action
  void toggleVisibilityPwd(bool value) {
    showPwd = !value;
  }

  @action
  void toggleVisibilityConfirmPwd(bool value) {
    showConfirmPwd = !value;
  }
}
