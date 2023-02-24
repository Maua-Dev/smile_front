// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterController on RegisterControllerBase, Store {
  Computed<String?>? _$raIntComputed;

  @override
  String? get raInt => (_$raIntComputed ??= Computed<String?>(() => super.raInt,
          name: 'RegisterControllerBase.raInt'))
      .value;
  Computed<UserRegistration>? _$registerInformationsComputed;

  @override
  UserRegistration get registerInformations =>
      (_$registerInformationsComputed ??= Computed<UserRegistration>(
              () => super.registerInformations,
              name: 'RegisterControllerBase.registerInformations'))
          .value;

  late final _$errorsAtom =
      Atom(name: 'RegisterControllerBase.errors', context: context);

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
      Atom(name: 'RegisterControllerBase.isLoading', context: context);

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
      Atom(name: 'RegisterControllerBase.showPwd', context: context);

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
      Atom(name: 'RegisterControllerBase.showConfirmPwd', context: context);

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

  late final _$successRegistrationAtom = Atom(
      name: 'RegisterControllerBase.successRegistration', context: context);

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
      Atom(name: 'RegisterControllerBase.name', context: context);

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
      Atom(name: 'RegisterControllerBase.socialName', context: context);

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
      Atom(name: 'RegisterControllerBase.hasSocialName', context: context);

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

  late final _$emailAtom =
      Atom(name: 'RegisterControllerBase.email', context: context);

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
      Atom(name: 'RegisterControllerBase.verifyEmail', context: context);

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

  late final _$phoneAtom =
      Atom(name: 'RegisterControllerBase.phone', context: context);

  @override
  String get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  late final _$roleAtom =
      Atom(name: 'RegisterControllerBase.role', context: context);

  @override
  UserRolesEnum get role {
    _$roleAtom.reportRead();
    return super.role;
  }

  @override
  set role(UserRolesEnum value) {
    _$roleAtom.reportWrite(value, super.role, () {
      super.role = value;
    });
  }

  late final _$raAtom =
      Atom(name: 'RegisterControllerBase.ra', context: context);

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
      Atom(name: 'RegisterControllerBase.password', context: context);

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
      Atom(name: 'RegisterControllerBase.verifyPassword', context: context);

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

  late final _$acceptTermsOfUseAtom =
      Atom(name: 'RegisterControllerBase.acceptTermsOfUse', context: context);

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
      Atom(name: 'RegisterControllerBase.acceptImage', context: context);

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

  late final _$acceptEmailNotificationsAtom = Atom(
      name: 'RegisterControllerBase.acceptEmailNotifications',
      context: context);

  @override
  bool get acceptEmailNotifications {
    _$acceptEmailNotificationsAtom.reportRead();
    return super.acceptEmailNotifications;
  }

  @override
  set acceptEmailNotifications(bool value) {
    _$acceptEmailNotificationsAtom
        .reportWrite(value, super.acceptEmailNotifications, () {
      super.acceptEmailNotifications = value;
    });
  }

  late final _$acceptSMSNotificationsAtom = Atom(
      name: 'RegisterControllerBase.acceptSMSNotifications', context: context);

  @override
  bool get acceptSMSNotifications {
    _$acceptSMSNotificationsAtom.reportRead();
    return super.acceptSMSNotifications;
  }

  @override
  set acceptSMSNotifications(bool value) {
    _$acceptSMSNotificationsAtom
        .reportWrite(value, super.acceptSMSNotifications, () {
      super.acceptSMSNotifications = value;
    });
  }

  late final _$setEmailNotificationsAsyncAction = AsyncAction(
      'RegisterControllerBase.setEmailNotifications',
      context: context);

  @override
  Future<void> setEmailNotifications(bool? value) {
    return _$setEmailNotificationsAsyncAction
        .run(() => super.setEmailNotifications(value));
  }

  late final _$setSMSNotificationsAsyncAction = AsyncAction(
      'RegisterControllerBase.setSMSNotifications',
      context: context);

  @override
  Future<void> setSMSNotifications(bool? value) {
    return _$setSMSNotificationsAsyncAction
        .run(() => super.setSMSNotifications(value));
  }

  late final _$setAcceptImageAsyncAction =
      AsyncAction('RegisterControllerBase.setAcceptImage', context: context);

  @override
  Future<void> setAcceptImage(bool? value) {
    return _$setAcceptImageAsyncAction.run(() => super.setAcceptImage(value));
  }

  late final _$setNameAsyncAction =
      AsyncAction('RegisterControllerBase.setName', context: context);

  @override
  Future<void> setName(String value) {
    return _$setNameAsyncAction.run(() => super.setName(value));
  }

  late final _$setSocialNameAsyncAction =
      AsyncAction('RegisterControllerBase.setSocialName', context: context);

  @override
  Future<void> setSocialName(String value) {
    return _$setSocialNameAsyncAction.run(() => super.setSocialName(value));
  }

  late final _$setEmailAsyncAction =
      AsyncAction('RegisterControllerBase.setEmail', context: context);

  @override
  Future<void> setEmail(String value) {
    return _$setEmailAsyncAction.run(() => super.setEmail(value));
  }

  late final _$setVerifyEmailAsyncAction =
      AsyncAction('RegisterControllerBase.setVerifyEmail', context: context);

  @override
  Future<void> setVerifyEmail(String value) {
    return _$setVerifyEmailAsyncAction.run(() => super.setVerifyEmail(value));
  }

  late final _$setPhoneAsyncAction =
      AsyncAction('RegisterControllerBase.setPhone', context: context);

  @override
  Future<void> setPhone(String value) {
    return _$setPhoneAsyncAction.run(() => super.setPhone(value));
  }

  late final _$setRoleAsyncAction =
      AsyncAction('RegisterControllerBase.setRole', context: context);

  @override
  Future<void> setRole(UserRolesEnum? value) {
    return _$setRoleAsyncAction.run(() => super.setRole(value));
  }

  late final _$setHasSocialNameAsyncAction =
      AsyncAction('RegisterControllerBase.setHasSocialName', context: context);

  @override
  Future<void> setHasSocialName(bool? value) {
    return _$setHasSocialNameAsyncAction
        .run(() => super.setHasSocialName(value));
  }

  late final _$setRaAsyncAction =
      AsyncAction('RegisterControllerBase.setRa', context: context);

  @override
  Future<void> setRa(String value) {
    return _$setRaAsyncAction.run(() => super.setRa(value));
  }

  late final _$setPasswordAsyncAction =
      AsyncAction('RegisterControllerBase.setPassword', context: context);

  @override
  Future<void> setPassword(String value) {
    return _$setPasswordAsyncAction.run(() => super.setPassword(value));
  }

  late final _$setVerifyPasswordAsyncAction =
      AsyncAction('RegisterControllerBase.setVerifyPassword', context: context);

  @override
  Future<void> setVerifyPassword(String value) {
    return _$setVerifyPasswordAsyncAction
        .run(() => super.setVerifyPassword(value));
  }

  late final _$registerAsyncAction =
      AsyncAction('RegisterControllerBase.register', context: context);

  @override
  Future<void> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  late final _$setIsLoadingAsyncAction =
      AsyncAction('RegisterControllerBase.setIsLoading', context: context);

  @override
  Future<void> setIsLoading(bool value) {
    return _$setIsLoadingAsyncAction.run(() => super.setIsLoading(value));
  }

  late final _$setSuccessRegistrationAsyncAction = AsyncAction(
      'RegisterControllerBase.setSuccessRegistration',
      context: context);

  @override
  Future<void> setSuccessRegistration(bool value) {
    return _$setSuccessRegistrationAsyncAction
        .run(() => super.setSuccessRegistration(value));
  }

  late final _$setAcceptEmailNotificationsAsyncAction = AsyncAction(
      'RegisterControllerBase.setAcceptEmailNotifications',
      context: context);

  @override
  Future<void> setAcceptEmailNotifications(bool? value) {
    return _$setAcceptEmailNotificationsAsyncAction
        .run(() => super.setAcceptEmailNotifications(value));
  }

  late final _$setAcceptTermsOfUseAsyncAction = AsyncAction(
      'RegisterControllerBase.setAcceptTermsOfUse',
      context: context);

  @override
  Future<void> setAcceptTermsOfUse(bool? value) {
    return _$setAcceptTermsOfUseAsyncAction
        .run(() => super.setAcceptTermsOfUse(value));
  }

  late final _$RegisterControllerBaseActionController =
      ActionController(name: 'RegisterControllerBase', context: context);

  @override
  String? validateName(String? value) {
    final _$actionInfo = _$RegisterControllerBaseActionController.startAction(
        name: 'RegisterControllerBase.validateName');
    try {
      return super.validateName(value);
    } finally {
      _$RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateSocialName(String? value) {
    final _$actionInfo = _$RegisterControllerBaseActionController.startAction(
        name: 'RegisterControllerBase.validateSocialName');
    try {
      return super.validateSocialName(value);
    } finally {
      _$RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validatePhone(String? value) {
    final _$actionInfo = _$RegisterControllerBaseActionController.startAction(
        name: 'RegisterControllerBase.validatePhone');
    try {
      return super.validatePhone(value);
    } finally {
      _$RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateEmail(String? value) {
    final _$actionInfo = _$RegisterControllerBaseActionController.startAction(
        name: 'RegisterControllerBase.validateEmail');
    try {
      return super.validateEmail(value);
    } finally {
      _$RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateVerifyEmail(String? value) {
    final _$actionInfo = _$RegisterControllerBaseActionController.startAction(
        name: 'RegisterControllerBase.validateVerifyEmail');
    try {
      return super.validateVerifyEmail(value);
    } finally {
      _$RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateRa(String? value) {
    final _$actionInfo = _$RegisterControllerBaseActionController.startAction(
        name: 'RegisterControllerBase.validateRa');
    try {
      return super.validateRa(value);
    } finally {
      _$RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validatePassword(String? value) {
    final _$actionInfo = _$RegisterControllerBaseActionController.startAction(
        name: 'RegisterControllerBase.validatePassword');
    try {
      return super.validatePassword(value);
    } finally {
      _$RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateVerifyPassword(String? value) {
    final _$actionInfo = _$RegisterControllerBaseActionController.startAction(
        name: 'RegisterControllerBase.validateVerifyPassword');
    try {
      return super.validateVerifyPassword(value);
    } finally {
      _$RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleVisibilityPwd(bool value) {
    final _$actionInfo = _$RegisterControllerBaseActionController.startAction(
        name: 'RegisterControllerBase.toggleVisibilityPwd');
    try {
      return super.toggleVisibilityPwd(value);
    } finally {
      _$RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleVisibilityConfirmPwd(bool value) {
    final _$actionInfo = _$RegisterControllerBaseActionController.startAction(
        name: 'RegisterControllerBase.toggleVisibilityConfirmPwd');
    try {
      return super.toggleVisibilityConfirmPwd(value);
    } finally {
      _$RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
errors: ${errors},
isLoading: ${isLoading},
showPwd: ${showPwd},
showConfirmPwd: ${showConfirmPwd},
successRegistration: ${successRegistration},
name: ${name},
socialName: ${socialName},
hasSocialName: ${hasSocialName},
email: ${email},
verifyEmail: ${verifyEmail},
phone: ${phone},
role: ${role},
ra: ${ra},
password: ${password},
verifyPassword: ${verifyPassword},
acceptTermsOfUse: ${acceptTermsOfUse},
acceptImage: ${acceptImage},
acceptEmailNotifications: ${acceptEmailNotifications},
acceptSMSNotifications: ${acceptSMSNotifications},
raInt: ${raInt},
registerInformations: ${registerInformations}
    ''';
  }
}
