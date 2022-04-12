// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_weekday_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserWeekdayController on UserWeekdayControllerBase, Store {
  final _$indexToShowAtom = Atom(name: 'UserWeekdayControllerBase.indexToShow');

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

  final _$toggleIndexAsyncAction =
      AsyncAction('UserWeekdayControllerBase.toggleIndex');

  @override
  Future<void> toggleIndex(dynamic index) {
    return _$toggleIndexAsyncAction.run(() => super.toggleIndex(index));
  }

  @override
  String toString() {
    return '''
indexToShow: ${indexToShow}
    ''';
  }
}
