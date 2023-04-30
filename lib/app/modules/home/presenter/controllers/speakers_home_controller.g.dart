// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speakers_home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SpeakersHomeController on SpeakersHomeControllerBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'SpeakersHomeControllerBase.isLoading', context: context);

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

  late final _$indexToShowPanel1Atom = Atom(
      name: 'SpeakersHomeControllerBase.indexToShowPanel1', context: context);

  @override
  int get indexToShowPanel1 {
    _$indexToShowPanel1Atom.reportRead();
    return super.indexToShowPanel1;
  }

  @override
  set indexToShowPanel1(int value) {
    _$indexToShowPanel1Atom.reportWrite(value, super.indexToShowPanel1, () {
      super.indexToShowPanel1 = value;
    });
  }

  late final _$indexToShowPanel2Atom = Atom(
      name: 'SpeakersHomeControllerBase.indexToShowPanel2', context: context);

  @override
  int get indexToShowPanel2 {
    _$indexToShowPanel2Atom.reportRead();
    return super.indexToShowPanel2;
  }

  @override
  set indexToShowPanel2(int value) {
    _$indexToShowPanel2Atom.reportWrite(value, super.indexToShowPanel2, () {
      super.indexToShowPanel2 = value;
    });
  }

  late final _$indexToShowPanel3Atom = Atom(
      name: 'SpeakersHomeControllerBase.indexToShowPanel3', context: context);

  @override
  int get indexToShowPanel3 {
    _$indexToShowPanel3Atom.reportRead();
    return super.indexToShowPanel3;
  }

  @override
  set indexToShowPanel3(int value) {
    _$indexToShowPanel3Atom.reportWrite(value, super.indexToShowPanel3, () {
      super.indexToShowPanel3 = value;
    });
  }

  late final _$setIsLoadingAsyncAction =
      AsyncAction('SpeakersHomeControllerBase.setIsLoading', context: context);

  @override
  Future<void> setIsLoading(bool value) {
    return _$setIsLoadingAsyncAction.run(() => super.setIsLoading(value));
  }

  late final _$toggleIndexPanel1AsyncAction = AsyncAction(
      'SpeakersHomeControllerBase.toggleIndexPanel1',
      context: context);

  @override
  Future<void> toggleIndexPanel1(dynamic index) {
    return _$toggleIndexPanel1AsyncAction
        .run(() => super.toggleIndexPanel1(index));
  }

  late final _$toggleIndexPanel2AsyncAction = AsyncAction(
      'SpeakersHomeControllerBase.toggleIndexPanel2',
      context: context);

  @override
  Future<void> toggleIndexPanel2(dynamic index) {
    return _$toggleIndexPanel2AsyncAction
        .run(() => super.toggleIndexPanel2(index));
  }

  late final _$toggleIndexPanel3AsyncAction = AsyncAction(
      'SpeakersHomeControllerBase.toggleIndexPanel3',
      context: context);

  @override
  Future<void> toggleIndexPanel3(dynamic index) {
    return _$toggleIndexPanel3AsyncAction
        .run(() => super.toggleIndexPanel3(index));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
indexToShowPanel1: ${indexToShowPanel1},
indexToShowPanel2: ${indexToShowPanel2},
indexToShowPanel3: ${indexToShowPanel3}
    ''';
  }
}
