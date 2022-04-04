// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speakers_home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SpeakersHomeController on _SpeakersHomeControllerBase, Store {
  final _$isLoadingAtom = Atom(name: '_SpeakersHomeControllerBase.isLoading');

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

  final _$listSpeakersAtom =
      Atom(name: '_SpeakersHomeControllerBase.listSpeakers');

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

  final _$setIsLoadingAsyncAction =
      AsyncAction('_SpeakersHomeControllerBase.setIsLoading');

  @override
  Future<void> setIsLoading(bool value) {
    return _$setIsLoadingAsyncAction.run(() => super.setIsLoading(value));
  }

  final _$getSpeakersAsyncAction =
      AsyncAction('_SpeakersHomeControllerBase.getSpeakers');

  @override
  Future<dynamic> getSpeakers() {
    return _$getSpeakersAsyncAction.run(() => super.getSpeakers());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
listSpeakers: ${listSpeakers}
    ''';
  }
}
