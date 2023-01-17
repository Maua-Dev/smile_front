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

  late final _$listSpeakersAtom =
      Atom(name: 'SpeakersHomeControllerBase.listSpeakers', context: context);

  @override
  List<HomeSpeakerModel> get listSpeakers {
    _$listSpeakersAtom.reportRead();
    return super.listSpeakers;
  }

  @override
  set listSpeakers(List<HomeSpeakerModel> value) {
    _$listSpeakersAtom.reportWrite(value, super.listSpeakers, () {
      super.listSpeakers = value;
    });
  }

  late final _$indexToShowAtom =
      Atom(name: 'SpeakersHomeControllerBase.indexToShow', context: context);

  @override
  int get indexToShow {
    _$indexToShowAtom.reportRead();
    return super.indexToShow;
  }

  @override
  set indexToShow(int value) {
    _$indexToShowAtom.reportWrite(value, super.indexToShow, () {
      super.indexToShow = value;
    });
  }

  late final _$setIsLoadingAsyncAction =
      AsyncAction('SpeakersHomeControllerBase.setIsLoading', context: context);

  @override
  Future<void> setIsLoading(bool value) {
    return _$setIsLoadingAsyncAction.run(() => super.setIsLoading(value));
  }

  late final _$getUserSpeakersAsyncAction = AsyncAction(
      'SpeakersHomeControllerBase.getUserSpeakers',
      context: context);

  @override
  Future<dynamic> getSpeakers() {
    return _$getUserSpeakersAsyncAction.run(() => super.getAllSpeakers());
  }

  late final _$toggleIndexAsyncAction =
      AsyncAction('SpeakersHomeControllerBase.toggleIndex', context: context);

  @override
  Future<void> toggleIndex(dynamic index) {
    return _$toggleIndexAsyncAction.run(() => super.toggleIndex(index));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
listSpeakers: ${listSpeakers},
indexToShow: ${indexToShow}
    ''';
  }
}
