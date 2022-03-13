// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adm_dashboard_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AdmDashboardController on _AdmDashboardControllerBase, Store {
  final _$isFloatActionButtonOpenAtom =
      Atom(name: '_AdmDashboardControllerBase.isFloatActionButtonOpen');

  @override
  bool get isFloatActionButtonOpen {
    _$isFloatActionButtonOpenAtom.reportRead();
    return super.isFloatActionButtonOpen;
  }

  @override
  set isFloatActionButtonOpen(bool value) {
    _$isFloatActionButtonOpenAtom
        .reportWrite(value, super.isFloatActionButtonOpen, () {
      super.isFloatActionButtonOpen = value;
    });
  }

  final _$activitiesListAtom =
      Atom(name: '_AdmDashboardControllerBase.activitiesList');

  @override
  List<ActivityModel> get activitiesList {
    _$activitiesListAtom.reportRead();
    return super.activitiesList;
  }

  @override
  set activitiesList(List<ActivityModel> value) {
    _$activitiesListAtom.reportWrite(value, super.activitiesList, () {
      super.activitiesList = value;
    });
  }

  final _$getAllActivitiesAsyncAction =
      AsyncAction('_AdmDashboardControllerBase.getAllActivities');

  @override
  Future<dynamic> getAllActivities() {
    return _$getAllActivitiesAsyncAction.run(() => super.getAllActivities());
  }

  final _$_AdmDashboardControllerBaseActionController =
      ActionController(name: '_AdmDashboardControllerBase');

  @override
  void toggleFloatActionButton() {
    final _$actionInfo =
        _$_AdmDashboardControllerBaseActionController.startAction(
            name: '_AdmDashboardControllerBase.toggleFloatActionButton');
    try {
      return super.toggleFloatActionButton();
    } finally {
      _$_AdmDashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void searchActivityByName(String search) {
    final _$actionInfo = _$_AdmDashboardControllerBaseActionController
        .startAction(name: '_AdmDashboardControllerBase.searchActivityByName');
    try {
      return super.searchActivityByName(search);
    } finally {
      _$_AdmDashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isFloatActionButtonOpen: ${isFloatActionButtonOpen},
activitiesList: ${activitiesList}
    ''';
  }
}
