// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home2_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Home2Controller on Home2ControllerBase, Store {
  final _$speakersAtom = Atom(name: 'Home2ControllerBase.speakers');

  @override
  List<Speaker> get speakers {
    _$speakersAtom.reportRead();
    return super.speakers;
  }

  @override
  set speakers(List<Speaker> value) {
    _$speakersAtom.reportWrite(value, super.speakers, () {
      super.speakers = value;
    });
  }

  final _$indexToShowAtom = Atom(name: 'Home2ControllerBase.indexToShow');

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

  final _$getSpeakersAsyncAction =
      AsyncAction('Home2ControllerBase.getSpeakers');

  @override
  Future<void> getSpeakers() {
    return _$getSpeakersAsyncAction.run(() => super.getSpeakers());
  }

  final _$toggleIndexAsyncAction =
      AsyncAction('Home2ControllerBase.toggleIndex');

  @override
  Future<void> toggleIndex(dynamic index) {
    return _$toggleIndexAsyncAction.run(() => super.toggleIndex(index));
  }

  @override
  String toString() {
    return '''
speakers: ${speakers},
indexToShow: ${indexToShow}
    ''';
  }
}
