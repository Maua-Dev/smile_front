// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'more_info_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MoreInfoController on _MoreInfoControllerBase, Store {
  final _$isRegisteredAtom = Atom(name: '_MoreInfoControllerBase.isRegistered');

  @override
  bool get isRegistered {
    _$isRegisteredAtom.reportRead();
    return super.isRegistered;
  }

  @override
  set isRegistered(bool value) {
    _$isRegisteredAtom.reportWrite(value, super.isRegistered, () {
      super.isRegistered = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_MoreInfoControllerBase.isLoading');

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

  final _$setIsRegisteredAsyncAction =
      AsyncAction('_MoreInfoControllerBase.setIsRegistered');

  @override
  Future<void> setIsRegistered(bool value) {
    return _$setIsRegisteredAsyncAction.run(() => super.setIsRegistered(value));
  }

  final _$setIsLoadingAsyncAction =
      AsyncAction('_MoreInfoControllerBase.setIsLoading');

  @override
  Future<void> setIsLoading(bool value) {
    return _$setIsLoadingAsyncAction.run(() => super.setIsLoading(value));
  }

  final _$_MoreInfoControllerBaseActionController =
      ActionController(name: '_MoreInfoControllerBase');

  @override
  bool checkIsOkForSubscribe() {
    final _$actionInfo = _$_MoreInfoControllerBaseActionController.startAction(
        name: '_MoreInfoControllerBase.checkIsOkForSubscribe');
    try {
      return super.checkIsOkForSubscribe();
    } finally {
      _$_MoreInfoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isRegistered: ${isRegistered},
isLoading: ${isLoading}
    ''';
  }
}
