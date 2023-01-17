// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ActivityHomeController on ActivityHomeControllerBase, Store {
  late final _$speakersAtom =
      Atom(name: 'ActivityHomeControllerBase.speakers', context: context);

  @override
  List<HomeSpeakerModel> get speakers {
    _$speakersAtom.reportRead();
    return super.speakers;
  }

  @override
  set speakers(List<HomeSpeakerModel> value) {
    _$speakersAtom.reportWrite(value, super.speakers, () {
      super.speakers = value;
    });
  }

  late final _$getUserSpeakersAsyncAction = AsyncAction(
      'ActivityHomeControllerBase.getUserSpeakers',
      context: context);

  @override
  Future<void> getUserSpeakers() {
    return _$getUserSpeakersAsyncAction.run(() => super.getUserSpeakers());
  }

  @override
  String toString() {
    return '''
speakers: ${speakers}
    ''';
  }
}
