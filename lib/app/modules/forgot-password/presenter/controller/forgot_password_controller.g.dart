// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ForgotPasswordController on _ForgotPasswordController, Store {
  final _$isLoadingAtom = Atom(name: '_ForgotPasswordController.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$emailSentAtom = Atom(name: '_ForgotPasswordController.emailSent');

  @override
  bool get emailSent {
    _$emailSentAtom.reportRead();
    return super.emailSent;
  }

  @override
  set emailSent(bool value) {
    _$emailSentAtom.reportWrite(value, super.emailSent, () {
      super.emailSent = value;
    });
  }

  final _$showPwdAtom = Atom(name: '_ForgotPasswordController.showPwd');

  @override
  bool get showPwd {
    _$showPwdAtom.reportRead();
    return super.showPwd;
  }

  @override
  set showPwd(bool value) {
    _$showPwdAtom.reportWrite(value, super.showPwd, () {
      super.showPwd = value;
    });
  }

  final _$showConfirmPwdAtom =
      Atom(name: '_ForgotPasswordController.showConfirmPwd');

  @override
  bool get showConfirmPwd {
    _$showConfirmPwdAtom.reportRead();
    return super.showConfirmPwd;
  }

  @override
  set showConfirmPwd(bool value) {
    _$showConfirmPwdAtom.reportWrite(value, super.showConfirmPwd, () {
      super.showConfirmPwd = value;
    });
  }

  final _$usernameAtom = Atom(name: '_ForgotPasswordController.username');

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  final _$passwordAtom = Atom(name: '_ForgotPasswordController.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$verifyPasswordAtom =
      Atom(name: '_ForgotPasswordController.verifyPassword');

  @override
  String get verifyPassword {
    _$verifyPasswordAtom.reportRead();
    return super.verifyPassword;
  }

  @override
  set verifyPassword(String value) {
    _$verifyPasswordAtom.reportWrite(value, super.verifyPassword, () {
      super.verifyPassword = value;
    });
  }

  final _$codeAtom = Atom(name: '_ForgotPasswordController.code');

  @override
  String get code {
    _$codeAtom.reportRead();
    return super.code;
  }

  @override
  set code(String value) {
    _$codeAtom.reportWrite(value, super.code, () {
      super.code = value;
    });
  }

  final _$errorsAtom = Atom(name: '_ForgotPasswordController.errors');

  @override
  String get errors {
    _$errorsAtom.reportRead();
    return super.errors;
  }

  @override
  set errors(String value) {
    _$errorsAtom.reportWrite(value, super.errors, () {
      super.errors = value;
    });
  }

  final _$successRegistrationAtom =
      Atom(name: '_ForgotPasswordController.successRegistration');

  @override
  bool get successRegistration {
    _$successRegistrationAtom.reportRead();
    return super.successRegistration;
  }

  @override
  set successRegistration(bool value) {
    _$successRegistrationAtom.reportWrite(value, super.successRegistration, () {
      super.successRegistration = value;
    });
  }

  final _$setErrorAsyncAction =
      AsyncAction('_ForgotPasswordController.setError');

  @override
  Future<void> setError(String value) {
    return _$setErrorAsyncAction.run(() => super.setError(value));
  }

  final _$setCodeAsyncAction = AsyncAction('_ForgotPasswordController.setCode');

  @override
  Future<void> setCode(String value) {
    return _$setCodeAsyncAction.run(() => super.setCode(value));
  }

  final _$setUsernameAsyncAction =
      AsyncAction('_ForgotPasswordController.setUsername');

  @override
  Future<void> setUsername(String value) {
    return _$setUsernameAsyncAction.run(() => super.setUsername(value));
  }

  final _$setIsLoadingAsyncAction =
      AsyncAction('_ForgotPasswordController.setIsLoading');

  @override
  Future<void> setIsLoading(bool value) {
    return _$setIsLoadingAsyncAction.run(() => super.setIsLoading(value));
  }

  final _$forgotPasswordAsyncAction =
      AsyncAction('_ForgotPasswordController.forgotPassword');

  @override
  Future<void> forgotPassword() {
    return _$forgotPasswordAsyncAction.run(() => super.forgotPassword());
  }

  final _$changePasswordAsyncAction =
      AsyncAction('_ForgotPasswordController.changePassword');

  @override
  Future<void> changePassword() {
    return _$changePasswordAsyncAction.run(() => super.changePassword());
  }

  final _$setPasswordAsyncAction =
      AsyncAction('_ForgotPasswordController.setPassword');

  @override
  Future<void> setPassword(String value) {
    return _$setPasswordAsyncAction.run(() => super.setPassword(value));
  }

  final _$setVerifyPasswordAsyncAction =
      AsyncAction('_ForgotPasswordController.setVerifyPassword');

  @override
  Future<void> setVerifyPassword(String value) {
    return _$setVerifyPasswordAsyncAction
        .run(() => super.setVerifyPassword(value));
  }

  final _$setSuccessRegistrationAsyncAction =
      AsyncAction('_ForgotPasswordController.setSuccessRegistration');

  @override
  Future<void> setSuccessRegistration(bool value) {
    return _$setSuccessRegistrationAsyncAction
        .run(() => super.setSuccessRegistration(value));
  }

  final _$_ForgotPasswordControllerActionController =
      ActionController(name: '_ForgotPasswordController');

  @override
  String? validateUsername(String value) {
    final _$actionInfo = _$_ForgotPasswordControllerActionController
        .startAction(name: '_ForgotPasswordController.validateUsername');
    try {
      return super.validateUsername(value);
    } finally {
      _$_ForgotPasswordControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateVerifyPassword(String value) {
    final _$actionInfo = _$_ForgotPasswordControllerActionController
        .startAction(name: '_ForgotPasswordController.validateVerifyPassword');
    try {
      return super.validateVerifyPassword(value);
    } finally {
      _$_ForgotPasswordControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleVisibilityPwd(bool value) {
    final _$actionInfo = _$_ForgotPasswordControllerActionController
        .startAction(name: '_ForgotPasswordController.toggleVisibilityPwd');
    try {
      return super.toggleVisibilityPwd(value);
    } finally {
      _$_ForgotPasswordControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleVisibilityConfirmPwd(bool value) {
    final _$actionInfo =
        _$_ForgotPasswordControllerActionController.startAction(
            name: '_ForgotPasswordController.toggleVisibilityConfirmPwd');
    try {
      return super.toggleVisibilityConfirmPwd(value);
    } finally {
      _$_ForgotPasswordControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
emailSent: ${emailSent},
showPwd: ${showPwd},
showConfirmPwd: ${showConfirmPwd},
username: ${username},
password: ${password},
verifyPassword: ${verifyPassword},
code: ${code},
errors: ${errors},
successRegistration: ${successRegistration}
    ''';
  }
}
