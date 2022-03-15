// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginController, Store {
  final _$isLoadingAtom = Atom(name: '_LoginController.isLoading');

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

  final _$cpfRneAtom = Atom(name: '_LoginController.cpfRne');

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

  final _$passwordAtom = Atom(name: '_LoginController.password');

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

  final _$keepConectedAtom = Atom(name: '_LoginController.keepConected');

  @override
  bool get keepConected {
    _$keepConectedAtom.reportRead();
    return super.keepConected;
  }

  @override
  set keepConected(bool value) {
    _$keepConectedAtom.reportWrite(value, super.keepConected, () {
      super.keepConected = value;
    });
  }

  final _$errorsAtom = Atom(name: '_LoginController.errors');

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

  final _$setUsernameAsyncAction = AsyncAction('_LoginController.setUsername');

  @override
  Future<void> setUsername(String value) {
    return _$setUsernameAsyncAction.run(() => super.setUsername(value));
  }

  final _$setPasswordAsyncAction = AsyncAction('_LoginController.setPassword');

  @override
  Future<void> setPassword(String value) {
    return _$setPasswordAsyncAction.run(() => super.setPassword(value));
  }

  final _$loginAsyncAction = AsyncAction('_LoginController.login');

  @override
  Future<void> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  final _$setErrorAsyncAction = AsyncAction('_LoginController.setError');

  @override
  Future<void> setError(String value) {
    return _$setErrorAsyncAction.run(() => super.setError(value));
  }

  final _$setIsLoadingAsyncAction =
      AsyncAction('_LoginController.setIsLoading');

  @override
  Future<void> setIsLoading(bool value) {
    return _$setIsLoadingAsyncAction.run(() => super.setIsLoading(value));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
cpfRne: ${cpfRne},
password: ${password},
keepConected: ${keepConected},
errors: ${errors}
    ''';
  }
}
