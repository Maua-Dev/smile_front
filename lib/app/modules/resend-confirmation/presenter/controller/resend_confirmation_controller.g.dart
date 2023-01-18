// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resend_confirmation_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ResendConfirmationController
    on ResendConfirmationControllerBase, Store {
  late final _$isLoadingAtom = Atom(
      name: 'ResendConfirmationControllerBase.isLoading', context: context);

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

  late final _$emailSentAtom = Atom(
      name: 'ResendConfirmationControllerBase.emailSent', context: context);

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

  late final _$errorsAtom =
      Atom(name: 'ResendConfirmationControllerBase.errors', context: context);

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

  late final _$cpfAtom =
      Atom(name: 'ResendConfirmationControllerBase.cpf', context: context);

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

  late final _$successRegistrationAtom = Atom(
      name: 'ResendConfirmationControllerBase.successRegistration',
      context: context);

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

  late final _$setErrorAsyncAction = AsyncAction(
      'ResendConfirmationControllerBase.setError',
      context: context);

  @override
  Future<void> setError(String value) {
    return _$setErrorAsyncAction.run(() => super.setError(value));
  }

  late final _$setCpfAsyncAction =
      AsyncAction('ResendConfirmationControllerBase.setCpf', context: context);

  @override
  Future<void> setCpf(String value) {
    return _$setCpfAsyncAction.run(() => super.setCpf(value));
  }

  late final _$setIsLoadingAsyncAction = AsyncAction(
      'ResendConfirmationControllerBase.setIsLoading',
      context: context);

  @override
  Future<void> setIsLoading(bool value) {
    return _$setIsLoadingAsyncAction.run(() => super.setIsLoading(value));
  }

  late final _$resendConfirmationAsyncAction = AsyncAction(
      'ResendConfirmationControllerBase.resendConfirmation',
      context: context);

  @override
  Future<void> resendConfirmation() {
    return _$resendConfirmationAsyncAction
        .run(() => super.resendConfirmation());
  }

  late final _$setSuccessRegistrationAsyncAction = AsyncAction(
      'ResendConfirmationControllerBase.setSuccessRegistration',
      context: context);

  @override
  Future<void> setSuccessRegistration(bool value) {
    return _$setSuccessRegistrationAsyncAction
        .run(() => super.setSuccessRegistration(value));
  }

  late final _$ResendConfirmationControllerBaseActionController =
      ActionController(
          name: 'ResendConfirmationControllerBase', context: context);

  @override
  String? validateCpf(String? value) {
    final _$actionInfo = _$ResendConfirmationControllerBaseActionController
        .startAction(name: 'ResendConfirmationControllerBase.validateCpf');
    try {
      return super.validateCpf(value);
    } finally {
      _$ResendConfirmationControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
emailSent: ${emailSent},
errors: ${errors},
cpf: ${cpf},
successRegistration: ${successRegistration}
    ''';
  }
}
