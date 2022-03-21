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

  final _$setErrorAsyncAction =
      AsyncAction('_ForgotPasswordController.setError');

  @override
  Future<void> setError(String value) {
    return _$setErrorAsyncAction.run(() => super.setError(value));
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
  String toString() {
    return '''
isLoading: ${isLoading},
username: ${username},
password: ${password},
verifyPassword: ${verifyPassword},
errors: ${errors}
    ''';
  }
}
