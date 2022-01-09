// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterController on _RegisterController, Store {
  Computed<RegisterInformations>? _$registerInformationsComputed;

  @override
  RegisterInformations get registerInformations =>
      (_$registerInformationsComputed ??= Computed<RegisterInformations>(
              () => super.registerInformations,
              name: '_RegisterController.registerInformations'))
          .value;

  final _$nameAtom = Atom(name: '_RegisterController.name');

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

  final _$cpfAtom = Atom(name: '_RegisterController.cpf');

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

  final _$emailAtom = Atom(name: '_RegisterController.email');

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

  final _$isMauaStudentAtom = Atom(name: '_RegisterController.isMauaStudent');

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

  final _$raAtom = Atom(name: '_RegisterController.ra');

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

  final _$passwordAtom = Atom(name: '_RegisterController.password');

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

  final _$verifyPasswordAtom = Atom(name: '_RegisterController.verifyPassword');

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
      Atom(name: '_RegisterController.aceptEmailNotifications');

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

  final _$setNameAsyncAction = AsyncAction('_RegisterController.setName');

  @override
  Future<void> setName(String value) {
    return _$setNameAsyncAction.run(() => super.setName(value));
  }

  final _$setCpfAsyncAction = AsyncAction('_RegisterController.setCpf');

  @override
  Future<void> setCpf(String value) {
    return _$setCpfAsyncAction.run(() => super.setCpf(value));
  }

  final _$setEmailAsyncAction = AsyncAction('_RegisterController.setEmail');

  @override
  Future<void> setEmail(String value) {
    return _$setEmailAsyncAction.run(() => super.setEmail(value));
  }

  final _$setIsMauaStudentAsyncAction =
      AsyncAction('_RegisterController.setIsMauaStudent');

  @override
  Future<void> setIsMauaStudent(bool value) {
    return _$setIsMauaStudentAsyncAction
        .run(() => super.setIsMauaStudent(value));
  }

  final _$setRaAsyncAction = AsyncAction('_RegisterController.setRa');

  @override
  Future<void> setRa(String value) {
    return _$setRaAsyncAction.run(() => super.setRa(value));
  }

  final _$setPasswordAsyncAction =
      AsyncAction('_RegisterController.setPassword');

  @override
  Future<void> setPassword(String value) {
    return _$setPasswordAsyncAction.run(() => super.setPassword(value));
  }

  final _$setVerifyPasswordAsyncAction =
      AsyncAction('_RegisterController.setVerifyPassword');

  @override
  Future<void> setVerifyPassword(String value) {
    return _$setVerifyPasswordAsyncAction
        .run(() => super.setVerifyPassword(value));
  }

  final _$setAceptEmailNotificationAsyncAction =
      AsyncAction('_RegisterController.setAceptEmailNotification');

  @override
  Future<void> setAceptEmailNotification(bool value) {
    return _$setAceptEmailNotificationAsyncAction
        .run(() => super.setAceptEmailNotification(value));
  }

  final _$registerAsyncAction = AsyncAction('_RegisterController.register');

  @override
  Future<void> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  final _$_RegisterControllerActionController =
      ActionController(name: '_RegisterController');

  @override
  String? validateName(String value) {
    final _$actionInfo = _$_RegisterControllerActionController.startAction(
        name: '_RegisterController.validateName');
    try {
      return super.validateName(value);
    } finally {
      _$_RegisterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateCpf(String value) {
    final _$actionInfo = _$_RegisterControllerActionController.startAction(
        name: '_RegisterController.validateCpf');
    try {
      return super.validateCpf(value);
    } finally {
      _$_RegisterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateEmail(String value) {
    final _$actionInfo = _$_RegisterControllerActionController.startAction(
        name: '_RegisterController.validateEmail');
    try {
      return super.validateEmail(value);
    } finally {
      _$_RegisterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateRa(String value) {
    final _$actionInfo = _$_RegisterControllerActionController.startAction(
        name: '_RegisterController.validateRa');
    try {
      return super.validateRa(value);
    } finally {
      _$_RegisterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateVerifyPassword(String value) {
    final _$actionInfo = _$_RegisterControllerActionController.startAction(
        name: '_RegisterController.validateVerifyPassword');
    try {
      return super.validateVerifyPassword(value);
    } finally {
      _$_RegisterControllerActionController.endAction(_$actionInfo);
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
aceptEmailNotifications: ${aceptEmailNotifications},
registerInformations: ${registerInformations}
    ''';
  }
}
