// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginController, Store {
  late final _$isLoadingAtom =
      Atom(name: '_LoginController.isLoading', context: context);

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

  late final _$showPwdAtom =
      Atom(name: '_LoginController.showPwd', context: context);

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

  late final _$cpfRneAtom =
      Atom(name: '_LoginController.cpfRne', context: context);

  @override
  String get cpfRne {
    _$cpfRneAtom.reportRead();
    return super.cpfRne;
  }

  @override
  set cpfRne(String value) {
    _$cpfRneAtom.reportWrite(value, super.cpfRne, () {
      super.cpfRne = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_LoginController.password', context: context);

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

  late final _$errorsAtom =
      Atom(name: '_LoginController.errors', context: context);

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

  late final _$setUsernameAsyncAction =
      AsyncAction('_LoginController.setUsername', context: context);

  @override
  Future<void> setUsername(String value) {
    return _$setUsernameAsyncAction.run(() => super.setUsername(value));
  }

  late final _$setPasswordAsyncAction =
      AsyncAction('_LoginController.setPassword', context: context);

  @override
  Future<void> setPassword(String value) {
    return _$setPasswordAsyncAction.run(() => super.setPassword(value));
  }

  late final _$loginAsyncAction =
      AsyncAction('_LoginController.login', context: context);

  @override
  Future<void> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  late final _$setIsLoadingAsyncAction =
      AsyncAction('_LoginController.setIsLoading', context: context);

  @override
  Future<void> setIsLoading(bool value) {
    return _$setIsLoadingAsyncAction.run(() => super.setIsLoading(value));
  }

  late final _$_LoginControllerActionController =
      ActionController(name: '_LoginController', context: context);

  @override
  String? validateCpf(String value) {
    final _$actionInfo = _$_LoginControllerActionController.startAction(
        name: '_LoginController.validateCpf');
    try {
      return super.validateCpf(value);
    } finally {
      _$_LoginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateField(String value) {
    final _$actionInfo = _$_LoginControllerActionController.startAction(
        name: '_LoginController.validateField');
    try {
      return super.validateField(value);
    } finally {
      _$_LoginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleVisibilityPwd(bool value) {
    final _$actionInfo = _$_LoginControllerActionController.startAction(
        name: '_LoginController.toggleVisibilityPwd');
    try {
      return super.toggleVisibilityPwd(value);
    } finally {
      _$_LoginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
showPwd: ${showPwd},
cpfRne: ${cpfRne},
password: ${password},
errors: ${errors}
    ''';
  }
}
