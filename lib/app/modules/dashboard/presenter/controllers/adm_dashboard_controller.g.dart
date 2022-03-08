// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adm_dashboard_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AdmDashboardController on _AdmDashboardControllerBase, Store {
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

  final _$editActivityAsyncAction =
      AsyncAction('_AdmDashboardControllerBase.editActivity');

  @override
  Future<dynamic> editActivity(
      String id,
      String description,
      String link,
      int totalPlaces,
      String location,
      String name,
      DateTime date,
      ActivityEnum type,
      int workload) {
    return _$editActivityAsyncAction.run(() => super.editActivity(id,
        description, link, totalPlaces, location, name, date, type, workload));
  }

  final _$_AdmDashboardControllerBaseActionController =
      ActionController(name: '_AdmDashboardControllerBase');

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
  void orderByDate() {
    final _$actionInfo = _$_AdmDashboardControllerBaseActionController
        .startAction(name: '_AdmDashboardControllerBase.orderByDate');
    try {
      return super.orderByDate();
    } finally {
      _$_AdmDashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
activitiesList: ${activitiesList}
    ''';
  }
}
