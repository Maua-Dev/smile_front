// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterController on RegisterControllerBase, Store {
  final _$nameAtom = Atom(name: 'RegisterControllerBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$cpfAtom = Atom(name: 'RegisterControllerBase.cpf');

  @override
  String get cpf {
    _$cpfAtom.reportRead();
    return super.cpf;
  }

  @override
  set cpf(String value) {
    _$cpfAtom.reportWrite(value, super.cpf, () {
      super.cpf = value;
    });
  }

  final _$emailAtom = Atom(name: 'RegisterControllerBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$isMauaStudentAtom =
      Atom(name: 'RegisterControllerBase.isMauaStudent');

  @override
  bool get isMauaStudent {
    _$isMauaStudentAtom.reportRead();
    return super.isMauaStudent;
  }

  @override
  set isMauaStudent(bool value) {
    _$isMauaStudentAtom.reportWrite(value, super.isMauaStudent, () {
      super.isMauaStudent = value;
    });
  }

  final _$raAtom = Atom(name: 'RegisterControllerBase.ra');

  @override
  String get ra {
    _$raAtom.reportRead();
    return super.ra;
  }

  @override
  set ra(String value) {
    _$raAtom.reportWrite(value, super.ra, () {
      super.ra = value;
    });
  }

  final _$passwordAtom = Atom(name: 'RegisterControllerBase.password');

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
      Atom(name: 'RegisterControllerBase.verifyPassword');

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

  final _$aceptEmailNotificationsAtom =
      Atom(name: 'RegisterControllerBase.aceptEmailNotifications');

  @override
  bool get aceptEmailNotifications {
    _$aceptEmailNotificationsAtom.reportRead();
    return super.aceptEmailNotifications;
  }

  @override
  set aceptEmailNotifications(bool value) {
    _$aceptEmailNotificationsAtom
        .reportWrite(value, super.aceptEmailNotifications, () {
      super.aceptEmailNotifications = value;
    });
  }

  final _$setNameAsyncAction = AsyncAction('RegisterControllerBase.setName');

  @override
  Future<void> setName(String value) {
    return _$setNameAsyncAction.run(() => super.setName(value));
  }

  final _$setCpfAsyncAction = AsyncAction('RegisterControllerBase.setCpf');

  @override
  Future<void> setCpf(String value) {
    return _$setCpfAsyncAction.run(() => super.setCpf(value));
  }

  final _$setEmailAsyncAction = AsyncAction('RegisterControllerBase.setEmail');

  @override
  Future<void> setEmail(String value) {
    return _$setEmailAsyncAction.run(() => super.setEmail(value));
  }

  final _$setIsMauaStudentAsyncAction =
      AsyncAction('RegisterControllerBase.setIsMauaStudent');

  @override
  Future<void> setIsMauaStudent(bool value) {
    return _$setIsMauaStudentAsyncAction
        .run(() => super.setIsMauaStudent(value));
  }

  final _$setRaAsyncAction = AsyncAction('RegisterControllerBase.setRa');

  @override
  Future<void> setRa(String value) {
    return _$setRaAsyncAction.run(() => super.setRa(value));
  }

  final _$setPasswordAsyncAction =
      AsyncAction('RegisterControllerBase.setPassword');

  @override
  Future<void> setPassword(String value) {
    return _$setPasswordAsyncAction.run(() => super.setPassword(value));
  }

  final _$setVerifyPasswordAsyncAction =
      AsyncAction('RegisterControllerBase.setVerifyPassword');

  @override
  Future<void> setVerifyPassword(String value) {
    return _$setVerifyPasswordAsyncAction
        .run(() => super.setVerifyPassword(value));
  }

  final _$setAceptEmailNotificationAsyncAction =
      AsyncAction('RegisterControllerBase.setAceptEmailNotification');

  @override
  Future<void> setAceptEmailNotification(bool value) {
    return _$setAceptEmailNotificationAsyncAction
        .run(() => super.setAceptEmailNotification(value));
  }

  final _$registerAsyncAction = AsyncAction('RegisterControllerBase.register');

  @override
  Future<void> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  final _$RegisterControllerBaseActionController =
      ActionController(name: 'RegisterControllerBase');

  @override
  String? validateName(String value) {
    final _$actionInfo = _$RegisterControllerBaseActionController.startAction(
        name: 'RegisterControllerBase.validateName');
    try {
      return super.validateName(value);
    } finally {
      _$RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateCpf(String value) {
    final _$actionInfo = _$RegisterControllerBaseActionController.startAction(
        name: 'RegisterControllerBase.validateCpf');
    try {
      return super.validateCpf(value);
    } finally {
      _$RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateEmail(String value) {
    final _$actionInfo = _$RegisterControllerBaseActionController.startAction(
        name: 'RegisterControllerBase.validateEmail');
    try {
      return super.validateEmail(value);
    } finally {
      _$RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateRa(String value) {
    final _$actionInfo = _$RegisterControllerBaseActionController.startAction(
        name: 'RegisterControllerBase.validateRa');
    try {
      return super.validateRa(value);
    } finally {
      _$RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateVerifyPassword(String value) {
    final _$actionInfo = _$RegisterControllerBaseActionController.startAction(
        name: 'RegisterControllerBase.validateVerifyPassword');
    try {
      return super.validateVerifyPassword(value);
    } finally {
      _$RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
cpf: ${cpf},
email: ${email},
isMauaStudent: ${isMauaStudent},
ra: ${ra},
password: ${password},
verifyPassword: ${verifyPassword},
aceptEmailNotifications: ${aceptEmailNotifications}
    ''';
  }
}
