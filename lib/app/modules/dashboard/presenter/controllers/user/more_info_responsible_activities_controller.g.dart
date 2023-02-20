// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'more_info_responsible_activities_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MoreInfoResponsibleActivitiesController
    on MoreInfoResponsibleActivitiesControllerBase, Store {
  late final _$isVisibleAtom = Atom(
      name: 'MoreInfoResponsibleActivitiesControllerBase.isVisible',
      context: context);

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

  late final _$isIconSelectedAtom = Atom(
      name: 'MoreInfoResponsibleActivitiesControllerBase.isIconSelected',
      context: context);

  @override
  bool get isIconSelected {
    _$isIconSelectedAtom.reportRead();
    return super.isIconSelected;
  }

  @override
  set isIconSelected(bool value) {
    _$isIconSelectedAtom.reportWrite(value, super.isIconSelected, () {
      super.isIconSelected = value;
    });
  }

  late final _$isSwitchedAtom = Atom(
      name: 'MoreInfoResponsibleActivitiesControllerBase.isSwitched',
      context: context);

  @override
  bool get isSwitched {
    _$isSwitchedAtom.reportRead();
    return super.isSwitched;
  }

  @override
  set isSwitched(bool value) {
    _$isSwitchedAtom.reportWrite(value, super.isSwitched, () {
      super.isSwitched = value;
    });
  }

  late final _$MoreInfoResponsibleActivitiesControllerBaseActionController =
      ActionController(
          name: 'MoreInfoResponsibleActivitiesControllerBase',
          context: context);

  @override
  void showSubscribedList() {
    final _$actionInfo =
        _$MoreInfoResponsibleActivitiesControllerBaseActionController.startAction(
            name:
                'MoreInfoResponsibleActivitiesControllerBase.showSubscribedList');
    try {
      return super.showSubscribedList();
    } finally {
      _$MoreInfoResponsibleActivitiesControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void toggleIconSelection() {
    final _$actionInfo =
        _$MoreInfoResponsibleActivitiesControllerBaseActionController.startAction(
            name:
                'MoreInfoResponsibleActivitiesControllerBase.toggleIconSelection');
    try {
      return super.toggleIconSelection();
    } finally {
      _$MoreInfoResponsibleActivitiesControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void toggleSwitch() {
    final _$actionInfo =
        _$MoreInfoResponsibleActivitiesControllerBaseActionController
            .startAction(
                name:
                    'MoreInfoResponsibleActivitiesControllerBase.toggleSwitch');
    try {
      return super.toggleSwitch();
    } finally {
      _$MoreInfoResponsibleActivitiesControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isVisible: ${isVisible},
isIconSelected: ${isIconSelected},
isSwitched: ${isSwitched}
    ''';
  }
}
