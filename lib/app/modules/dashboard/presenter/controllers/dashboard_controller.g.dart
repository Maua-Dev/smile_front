// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DashboardController on _DashboardControllerBase, Store {
  final _$activitiesListAtom =
      Atom(name: '_DashboardControllerBase.activitiesList');

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

  final _$getActivitiesByTypeAsyncAction =
      AsyncAction('_DashboardControllerBase.getActivitiesByType');

  @override
  Future<dynamic> getActivitiesByType() {
    return _$getActivitiesByTypeAsyncAction
        .run(() => super.getActivitiesByType());
  }

  final _$getAllActivitiesAsyncAction =
      AsyncAction('_DashboardControllerBase.getAllActivities');

  @override
  Future<dynamic> getAllActivities() {
    return _$getAllActivitiesAsyncAction.run(() => super.getAllActivities());
  }

  final _$editActivityAsyncAction =
      AsyncAction('_DashboardControllerBase.editActivity');

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

  final _$_DashboardControllerBaseActionController =
      ActionController(name: '_DashboardControllerBase');

  @override
  void searchActivityByName(String search) {
    final _$actionInfo = _$_DashboardControllerBaseActionController.startAction(
        name: '_DashboardControllerBase.searchActivityByName');
    try {
      return super.searchActivityByName(search);
    } finally {
      _$_DashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void orderByDate() {
    final _$actionInfo = _$_DashboardControllerBaseActionController.startAction(
        name: '_DashboardControllerBase.orderByDate');
    try {
      return super.orderByDate();
    } finally {
      _$_DashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
activitiesList: ${activitiesList}
    ''';
  }
}
