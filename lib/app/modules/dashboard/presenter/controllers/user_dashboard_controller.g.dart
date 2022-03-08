// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dashboard_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserDashboardController on _UserDashboardControllerBase, Store {
  final _$activitiesListAtom =
      Atom(name: '_UserDashboardControllerBase.activitiesList');

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
      AsyncAction('_UserDashboardControllerBase.getActivitiesByType');

  @override
  Future<dynamic> getActivitiesByType() {
    return _$getActivitiesByTypeAsyncAction
        .run(() => super.getActivitiesByType());
  }

  final _$getAllActivitiesAsyncAction =
      AsyncAction('_UserDashboardControllerBase.getAllActivities');

  @override
  Future<dynamic> getAllActivities() {
    return _$getAllActivitiesAsyncAction.run(() => super.getAllActivities());
  }

  final _$editActivityAsyncAction =
      AsyncAction('_UserDashboardControllerBase.editActivity');

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

  final _$_UserDashboardControllerBaseActionController =
      ActionController(name: '_UserDashboardControllerBase');

  @override
  void searchActivityByName(String search) {
    final _$actionInfo = _$_UserDashboardControllerBaseActionController
        .startAction(name: '_UserDashboardControllerBase.searchActivityByName');
    try {
      return super.searchActivityByName(search);
    } finally {
      _$_UserDashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void orderByDate() {
    final _$actionInfo = _$_UserDashboardControllerBaseActionController
        .startAction(name: '_UserDashboardControllerBase.orderByDate');
    try {
      return super.orderByDate();
    } finally {
      _$_UserDashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
activitiesList: ${activitiesList}
    ''';
  }
}
