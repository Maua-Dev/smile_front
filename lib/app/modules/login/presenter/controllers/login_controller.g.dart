// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginController, Store {
  final _$usernameAtom = Atom(name: '_LoginController.username');

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

  @override
  String toString() {
    return '''
username: ${username},
password: ${password},
keepConected: ${keepConected},
errors: ${errors}
    ''';
  }
}
