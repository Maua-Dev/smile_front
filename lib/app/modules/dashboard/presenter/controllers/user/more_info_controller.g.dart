// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'more_info_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MoreInfoController on MoreInfoControllerBase, Store {
  late final _$isVisibleAtom =
      Atom(name: 'MoreInfoControllerBase.isVisible', context: context);

  @override
  bool get isVisible {
    _$isVisibleAtom.reportRead();
    return super.isVisible;
  }

  @override
  set isVisible(bool value) {
    _$isVisibleAtom.reportWrite(value, super.isVisible, () {
      super.isVisible = value;
    });
  }

  late final _$isRegisteredAtom =
      Atom(name: 'MoreInfoControllerBase.isRegistered', context: context);

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

  late final _$isLoadingAtom =
      Atom(name: 'MoreInfoControllerBase.isLoading', context: context);

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

  late final _$setIsRegisteredAsyncAction =
      AsyncAction('MoreInfoControllerBase.setIsRegistered', context: context);

  @override
  Future<void> setIsRegistered(bool value) {
    return _$setIsRegisteredAsyncAction.run(() => super.setIsRegistered(value));
  }

  late final _$setIsLoadingAsyncAction =
      AsyncAction('MoreInfoControllerBase.setIsLoading', context: context);

  @override
  Future<void> setIsLoading(bool value) {
    return _$setIsLoadingAsyncAction.run(() => super.setIsLoading(value));
  }

  late final _$MoreInfoControllerBaseActionController =
      ActionController(name: 'MoreInfoControllerBase', context: context);

  @override
  void showContainer() {
    final _$actionInfo = _$MoreInfoControllerBaseActionController.startAction(
        name: 'MoreInfoControllerBase.showContainer');
    try {
      return super.showContainer();
    } finally {
      _$MoreInfoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool checkIsOkForSubscribe() {
    final _$actionInfo = _$MoreInfoControllerBaseActionController.startAction(
        name: 'MoreInfoControllerBase.checkIsOkForSubscribe');
    try {
      return super.checkIsOkForSubscribe();
    } finally {
      _$MoreInfoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isVisible: ${isVisible},
isRegistered: ${isRegistered},
isLoading: ${isLoading}
    ''';
  }
}
