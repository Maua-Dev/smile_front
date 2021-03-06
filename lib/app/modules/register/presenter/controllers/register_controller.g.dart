// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterController on _RegisterController, Store {
  Computed<int?>? _$raIntComputed;

  @override
  int? get raInt => (_$raIntComputed ??=
          Computed<int?>(() => super.raInt, name: '_RegisterController.raInt'))
      .value;
  Computed<UserRegistration>? _$registerInformationsComputed;

  @override
  UserRegistration get registerInformations =>
      (_$registerInformationsComputed ??= Computed<UserRegistration>(
              () => super.registerInformations,
              name: '_RegisterController.registerInformations'))
          .value;

  late final _$errorsListAtom =
      Atom(name: '_RegisterController.errorsList', context: context);

  @override
  List<String> get errorsList {
    _$errorsListAtom.reportRead();
    return super.errorsList;
  }

  @override
  set errorsList(List<String> value) {
    _$errorsListAtom.reportWrite(value, super.errorsList, () {
      super.errorsList = value;
    });
  }

  late final _$errorsAtom =
      Atom(name: '_RegisterController.errors', context: context);

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

  late final _$isLoadingAtom =
      Atom(name: '_RegisterController.isLoading', context: context);

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

  late final _$showDialogToConfirmEmailAtom = Atom(
      name: '_RegisterController.showDialogToConfirmEmail', context: context);

  @override
  bool get showDialogToConfirmEmail {
    _$showDialogToConfirmEmailAtom.reportRead();
    return super.showDialogToConfirmEmail;
  }

  @override
  set showDialogToConfirmEmail(bool value) {
    _$showDialogToConfirmEmailAtom
        .reportWrite(value, super.showDialogToConfirmEmail, () {
      super.showDialogToConfirmEmail = value;
    });
  }

  late final _$showPwdAtom =
      Atom(name: '_RegisterController.showPwd', context: context);

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
      Atom(name: '_RegisterController.showConfirmPwd', context: context);

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

  late final _$successRegistrationAtom =
      Atom(name: '_RegisterController.successRegistration', context: context);

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

  late final _$nameAtom =
      Atom(name: '_RegisterController.name', context: context);

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

  late final _$socialNameAtom =
      Atom(name: '_RegisterController.socialName', context: context);

  @override
  String get socialName {
    _$socialNameAtom.reportRead();
    return super.socialName;
  }

  @override
  set socialName(String value) {
    _$socialNameAtom.reportWrite(value, super.socialName, () {
      super.socialName = value;
    });
  }

  late final _$hasSocialNameAtom =
      Atom(name: '_RegisterController.hasSocialName', context: context);

  @override
  bool get hasSocialName {
    _$hasSocialNameAtom.reportRead();
    return super.hasSocialName;
  }

  @override
  set hasSocialName(bool value) {
    _$hasSocialNameAtom.reportWrite(value, super.hasSocialName, () {
      super.hasSocialName = value;
    });
  }

  late final _$cpfAtom =
      Atom(name: '_RegisterController.cpf', context: context);

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

  late final _$emailAtom =
      Atom(name: '_RegisterController.email', context: context);

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

  late final _$verifyEmailAtom =
      Atom(name: '_RegisterController.verifyEmail', context: context);

  @override
  String get verifyEmail {
    _$verifyEmailAtom.reportRead();
    return super.verifyEmail;
  }

  @override
  set verifyEmail(String value) {
    _$verifyEmailAtom.reportWrite(value, super.verifyEmail, () {
      super.verifyEmail = value;
    });
  }

  late final _$isMauaStudentAtom =
      Atom(name: '_RegisterController.isMauaStudent', context: context);

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

  late final _$raAtom = Atom(name: '_RegisterController.ra', context: context);

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

  late final _$passwordAtom =
      Atom(name: '_RegisterController.password', context: context);

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
      Atom(name: '_RegisterController.verifyPassword', context: context);

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

  late final _$canSendEmailsAtom =
      Atom(name: '_RegisterController.canSendEmails', context: context);

  @override
  bool get canSendEmails {
    _$canSendEmailsAtom.reportRead();
    return super.canSendEmails;
  }

  @override
  set canSendEmails(bool value) {
    _$canSendEmailsAtom.reportWrite(value, super.canSendEmails, () {
      super.canSendEmails = value;
    });
  }

  late final _$acceptTermsOfUseAtom =
      Atom(name: '_RegisterController.acceptTermsOfUse', context: context);

  @override
  bool get acceptTermsOfUse {
    _$acceptTermsOfUseAtom.reportRead();
    return super.acceptTermsOfUse;
  }

  @override
  set acceptTermsOfUse(bool value) {
    _$acceptTermsOfUseAtom.reportWrite(value, super.acceptTermsOfUse, () {
      super.acceptTermsOfUse = value;
    });
  }

  late final _$acceptImageAtom =
      Atom(name: '_RegisterController.acceptImage', context: context);

  @override
  bool get acceptImage {
    _$acceptImageAtom.reportRead();
    return super.acceptImage;
  }

  @override
  set acceptImage(bool value) {
    _$acceptImageAtom.reportWrite(value, super.acceptImage, () {
      super.acceptImage = value;
    });
  }

  late final _$setAcceptImageAsyncAction =
      AsyncAction('_RegisterController.setAcceptImage', context: context);

  @override
  Future<void> setAcceptImage(bool? value) {
    return _$setAcceptImageAsyncAction.run(() => super.setAcceptImage(value));
  }

  late final _$addErrorAsyncAction =
      AsyncAction('_RegisterController.addError', context: context);

  @override
  Future<void> addError(String value) {
    return _$addErrorAsyncAction.run(() => super.addError(value));
  }

  late final _$joinErrorsAsyncAction =
      AsyncAction('_RegisterController.joinErrors', context: context);

  @override
  Future<void> joinErrors() {
    return _$joinErrorsAsyncAction.run(() => super.joinErrors());
  }

  late final _$resetErrorsAsyncAction =
      AsyncAction('_RegisterController.resetErrors', context: context);

  @override
  Future<void> resetErrors() {
    return _$resetErrorsAsyncAction.run(() => super.resetErrors());
  }

  late final _$setNameAsyncAction =
      AsyncAction('_RegisterController.setName', context: context);

  @override
  Future<void> setName(String value) {
    return _$setNameAsyncAction.run(() => super.setName(value));
  }

  late final _$setSocialNameAsyncAction =
      AsyncAction('_RegisterController.setSocialName', context: context);

  @override
  Future<void> setSocialName(String value) {
    return _$setSocialNameAsyncAction.run(() => super.setSocialName(value));
  }

  late final _$setCpfAsyncAction =
      AsyncAction('_RegisterController.setCpf', context: context);

  @override
  Future<void> setCpf(String value) {
    return _$setCpfAsyncAction.run(() => super.setCpf(value));
  }

  late final _$setEmailAsyncAction =
      AsyncAction('_RegisterController.setEmail', context: context);

  @override
  Future<void> setEmail(String value) {
    return _$setEmailAsyncAction.run(() => super.setEmail(value));
  }

  late final _$setVerifyEmailAsyncAction =
      AsyncAction('_RegisterController.setVerifyEmail', context: context);

  @override
  Future<void> setVerifyEmail(String value) {
    return _$setVerifyEmailAsyncAction.run(() => super.setVerifyEmail(value));
  }

  late final _$setIsMauaStudentAsyncAction =
      AsyncAction('_RegisterController.setIsMauaStudent', context: context);

  @override
  Future<void> setIsMauaStudent(bool? value) {
    return _$setIsMauaStudentAsyncAction
        .run(() => super.setIsMauaStudent(value));
  }

  late final _$setHasSocialNameAsyncAction =
      AsyncAction('_RegisterController.setHasSocialName', context: context);

  @override
  Future<void> setHasSocialName(bool? value) {
    return _$setHasSocialNameAsyncAction
        .run(() => super.setHasSocialName(value));
  }

  late final _$setRaAsyncAction =
      AsyncAction('_RegisterController.setRa', context: context);

  @override
  Future<void> setRa(String value) {
    return _$setRaAsyncAction.run(() => super.setRa(value));
  }

  late final _$setPasswordAsyncAction =
      AsyncAction('_RegisterController.setPassword', context: context);

  @override
  Future<void> setPassword(String value) {
    return _$setPasswordAsyncAction.run(() => super.setPassword(value));
  }

  late final _$setVerifyPasswordAsyncAction =
      AsyncAction('_RegisterController.setVerifyPassword', context: context);

  @override
  Future<void> setVerifyPassword(String value) {
    return _$setVerifyPasswordAsyncAction
        .run(() => super.setVerifyPassword(value));
  }

  late final _$registerAsyncAction =
      AsyncAction('_RegisterController.register', context: context);

  @override
  Future<void> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  late final _$setIsLoadingAsyncAction =
      AsyncAction('_RegisterController.setIsLoading', context: context);

  @override
  Future<void> setIsLoading(bool value) {
    return _$setIsLoadingAsyncAction.run(() => super.setIsLoading(value));
  }

  late final _$setSuccessRegistrationAsyncAction = AsyncAction(
      '_RegisterController.setSuccessRegistration',
      context: context);

  @override
  Future<void> setSuccessRegistration(bool value) {
    return _$setSuccessRegistrationAsyncAction
        .run(() => super.setSuccessRegistration(value));
  }

  late final _$setCanSendEmailsAsyncAction =
      AsyncAction('_RegisterController.setCanSendEmails', context: context);

  @override
  Future<void> setCanSendEmails(bool? value) {
    return _$setCanSendEmailsAsyncAction
        .run(() => super.setCanSendEmails(value));
  }

  late final _$setAcceptTermsOfUseAsyncAction =
      AsyncAction('_RegisterController.setAcceptTermsOfUse', context: context);

  @override
  Future<void> setAcceptTermsOfUse(bool? value) {
    return _$setAcceptTermsOfUseAsyncAction
        .run(() => super.setAcceptTermsOfUse(value));
  }

  late final _$_RegisterControllerActionController =
      ActionController(name: '_RegisterController', context: context);

  @override
  bool validateName(String value) {
    final _$actionInfo = _$_RegisterControllerActionController.startAction(
        name: '_RegisterController.validateName');
    try {
      return super.validateName(value);
    } finally {
      _$_RegisterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validateSocialName(String value) {
    final _$actionInfo = _$_RegisterControllerActionController.startAction(
        name: '_RegisterController.validateSocialName');
    try {
      return super.validateSocialName(value);
    } finally {
      _$_RegisterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validateCpf(String value) {
    final _$actionInfo = _$_RegisterControllerActionController.startAction(
        name: '_RegisterController.validateCpf');
    try {
      return super.validateCpf(value);
    } finally {
      _$_RegisterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validateEmail(String value) {
    final _$actionInfo = _$_RegisterControllerActionController.startAction(
        name: '_RegisterController.validateEmail');
    try {
      return super.validateEmail(value);
    } finally {
      _$_RegisterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validateVerifyEmail(String value) {
    final _$actionInfo = _$_RegisterControllerActionController.startAction(
        name: '_RegisterController.validateVerifyEmail');
    try {
      return super.validateVerifyEmail(value);
    } finally {
      _$_RegisterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validateRa(String value) {
    final _$actionInfo = _$_RegisterControllerActionController.startAction(
        name: '_RegisterController.validateRa');
    try {
      return super.validateRa(value);
    } finally {
      _$_RegisterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validateVerifyPassword(String value) {
    final _$actionInfo = _$_RegisterControllerActionController.startAction(
        name: '_RegisterController.validateVerifyPassword');
    try {
      return super.validateVerifyPassword(value);
    } finally {
      _$_RegisterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleVisibilityPwd(bool value) {
    final _$actionInfo = _$_RegisterControllerActionController.startAction(
        name: '_RegisterController.toggleVisibilityPwd');
    try {
      return super.toggleVisibilityPwd(value);
    } finally {
      _$_RegisterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleVisibilityConfirmPwd(bool value) {
    final _$actionInfo = _$_RegisterControllerActionController.startAction(
        name: '_RegisterController.toggleVisibilityConfirmPwd');
    try {
      return super.toggleVisibilityConfirmPwd(value);
    } finally {
      _$_RegisterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setShowDialogToConfirmEmail(bool value) {
    final _$actionInfo = _$_RegisterControllerActionController.startAction(
        name: '_RegisterController.setShowDialogToConfirmEmail');
    try {
      return super.setShowDialogToConfirmEmail(value);
    } finally {
      _$_RegisterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validateForm() {
    final _$actionInfo = _$_RegisterControllerActionController.startAction(
        name: '_RegisterController.validateForm');
    try {
      return super.validateForm();
    } finally {
      _$_RegisterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
errorsList: ${errorsList},
errors: ${errors},
isLoading: ${isLoading},
showDialogToConfirmEmail: ${showDialogToConfirmEmail},
showPwd: ${showPwd},
showConfirmPwd: ${showConfirmPwd},
successRegistration: ${successRegistration},
name: ${name},
socialName: ${socialName},
hasSocialName: ${hasSocialName},
cpf: ${cpf},
email: ${email},
verifyEmail: ${verifyEmail},
isMauaStudent: ${isMauaStudent},
ra: ${ra},
password: ${password},
verifyPassword: ${verifyPassword},
canSendEmails: ${canSendEmails},
acceptTermsOfUse: ${acceptTermsOfUse},
acceptImage: ${acceptImage},
raInt: ${raInt},
registerInformations: ${registerInformations}
    ''';
  }
}
