// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ForgotPasswordController on _ForgotPasswordController, Store {
  late final _$isLoadingAtom =
      Atom(name: '_ForgotPasswordController.isLoading', context: context);

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

  late final _$emailSentAtom =
      Atom(name: '_ForgotPasswordController.emailSent', context: context);

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

  late final _$showPwdAtom =
      Atom(name: '_ForgotPasswordController.showPwd', context: context);

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

  late final _$showConfirmPwdAtom =
      Atom(name: '_ForgotPasswordController.showConfirmPwd', context: context);

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

  late final _$usernameAtom =
      Atom(name: '_ForgotPasswordController.username', context: context);

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

  late final _$passwordAtom =
      Atom(name: '_ForgotPasswordController.password', context: context);

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

  late final _$verifyPasswordAtom =
      Atom(name: '_ForgotPasswordController.verifyPassword', context: context);

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

  late final _$codeAtom =
      Atom(name: '_ForgotPasswordController.code', context: context);

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

  late final _$successRegistrationAtom = Atom(
      name: '_ForgotPasswordController.successRegistration', context: context);

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

  late final _$setCodeAsyncAction =
      AsyncAction('_ForgotPasswordController.setCode', context: context);

  @override
  Future<void> setCode(String value) {
    return _$setCodeAsyncAction.run(() => super.setCode(value));
  }

  late final _$setEmailAsyncAction =
      AsyncAction('_ForgotPasswordController.setEmail', context: context);

  @override
  Future<void> setEmail(String value) {
    return _$setEmailAsyncAction.run(() => super.setEmail(value));
  }

  late final _$setIsLoadingAsyncAction =
      AsyncAction('_ForgotPasswordController.setIsLoading', context: context);

  @override
  Future<void> setIsLoading(bool value) {
    return _$setIsLoadingAsyncAction.run(() => super.setIsLoading(value));
  }

  late final _$forgotPasswordAsyncAction =
      AsyncAction('_ForgotPasswordController.forgotPassword', context: context);

  @override
  Future<void> forgotPassword() {
    return _$forgotPasswordAsyncAction.run(() => super.forgotPassword());
  }

  late final _$changePasswordAsyncAction =
      AsyncAction('_ForgotPasswordController.changePassword', context: context);

  @override
  Future<void> changePassword() {
    return _$changePasswordAsyncAction.run(() => super.changePassword());
  }

  late final _$setPasswordAsyncAction =
      AsyncAction('_ForgotPasswordController.setPassword', context: context);

  @override
  Future<void> setPassword(String value) {
    return _$setPasswordAsyncAction.run(() => super.setPassword(value));
  }

  late final _$setVerifyPasswordAsyncAction = AsyncAction(
      '_ForgotPasswordController.setVerifyPassword',
      context: context);

  @override
  Future<void> setVerifyPassword(String value) {
    return _$setVerifyPasswordAsyncAction
        .run(() => super.setVerifyPassword(value));
  }

  late final _$setSuccessRegistrationAsyncAction = AsyncAction(
      '_ForgotPasswordController.setSuccessRegistration',
      context: context);

  @override
  Future<void> setSuccessRegistration(bool value) {
    return _$setSuccessRegistrationAsyncAction
        .run(() => super.setSuccessRegistration(value));
  }

  late final _$_ForgotPasswordControllerActionController =
      ActionController(name: '_ForgotPasswordController', context: context);

  @override
  String? validateEmail(String value) {
    final _$actionInfo = _$_ForgotPasswordControllerActionController
        .startAction(name: '_ForgotPasswordController.validateEmail');
    try {
      return super.validateEmail(value);
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
successRegistration: ${successRegistration}
    ''';
  }
}
