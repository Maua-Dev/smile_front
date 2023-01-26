// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adm_dashboard_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AdmDashboardController on AdmDashboardControllerBase, Store {
  late final _$isLoadingCsvAtom =
      Atom(name: 'AdmDashboardControllerBase.isLoadingCsv', context: context);

  @override
  bool get isLoadingCsv {
    _$isLoadingCsvAtom.reportRead();
    return super.isLoadingCsv;
  }

  @override
  set isLoadingCsv(bool value) {
    _$isLoadingCsvAtom.reportWrite(value, super.isLoadingCsv, () {
      super.isLoadingCsv = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'AdmDashboardControllerBase.isLoading', context: context);

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

  late final _$isFloatActionButtonOpenAtom = Atom(
      name: 'AdmDashboardControllerBase.isFloatActionButtonOpen',
      context: context);

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

  late final _$filterActivityChipIndexSelectedAtom = Atom(
      name: 'AdmDashboardControllerBase.filterActivityChipIndexSelected',
      context: context);

  @override
  int? get filterActivityChipIndexSelected {
    _$filterActivityChipIndexSelectedAtom.reportRead();
    return super.filterActivityChipIndexSelected;
  }

  @override
  set filterActivityChipIndexSelected(int? value) {
    _$filterActivityChipIndexSelectedAtom
        .reportWrite(value, super.filterActivityChipIndexSelected, () {
      super.filterActivityChipIndexSelected = value;
    });
  }

  late final _$activitiesListAtom =
      Atom(name: 'AdmDashboardControllerBase.activitiesList', context: context);

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

  late final _$allActivitiesListAtom = Atom(
      name: 'AdmDashboardControllerBase.allActivitiesList', context: context);

  @override
  List<ActivityModel> get allActivitiesList {
    _$allActivitiesListAtom.reportRead();
    return super.allActivitiesList;
  }

  @override
  set allActivitiesList(List<ActivityModel> value) {
    _$allActivitiesListAtom.reportWrite(value, super.allActivitiesList, () {
      super.allActivitiesList = value;
    });
  }

  late final _$setIsLoadingCsvAsyncAction = AsyncAction(
      'AdmDashboardControllerBase.setIsLoadingCsv',
      context: context);

  @override
  Future<void> setIsLoadingCsv(bool value) {
    return _$setIsLoadingCsvAsyncAction.run(() => super.setIsLoadingCsv(value));
  }

  late final _$setIsLoadingAsyncAction =
      AsyncAction('AdmDashboardControllerBase.setIsLoading', context: context);

  @override
  Future<void> setIsLoading(bool value) {
    return _$setIsLoadingAsyncAction.run(() => super.setIsLoading(value));
  }

  late final _$filterActivitiesByTypeAsyncAction = AsyncAction(
      'AdmDashboardControllerBase.filterActivitiesByType',
      context: context);

  @override
  Future<dynamic> filterActivitiesByType(ActivityEnum type) {
    return _$filterActivitiesByTypeAsyncAction
        .run(() => super.filterActivitiesByType(type));
  }

  late final _$filterActivitiesByDateAsyncAction = AsyncAction(
      'AdmDashboardControllerBase.filterActivitiesByDate',
      context: context);

  @override
  Future<dynamic> filterActivitiesByDate(DateTime date) {
    return _$filterActivitiesByDateAsyncAction
        .run(() => super.filterActivitiesByDate(date));
  }

  late final _$filterActivitiesByHourAsyncAction = AsyncAction(
      'AdmDashboardControllerBase.filterActivitiesByHour',
      context: context);

  @override
  Future<dynamic> filterActivitiesByHour(DateTime date) {
    return _$filterActivitiesByHourAsyncAction
        .run(() => super.filterActivitiesByHour(date));
  }

  late final _$getAllActivitiesAsyncAction = AsyncAction(
      'AdmDashboardControllerBase.getAllActivities',
      context: context);

  @override
  Future<dynamic> getAllActivities() {
    return _$getAllActivitiesAsyncAction.run(() => super.getAllActivities());
  }

  late final _$logoutAsyncAction =
      AsyncAction('AdmDashboardControllerBase.logout', context: context);

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  late final _$deleteUserActivityAsyncAction = AsyncAction(
      'AdmDashboardControllerBase.deleteUserActivity',
      context: context);

  @override
  Future<dynamic> deleteUserActivity(String id) {
    return _$deleteUserActivityAsyncAction
        .run(() => super.deleteUserActivity(id));
  }

  late final _$AdmDashboardControllerBaseActionController =
      ActionController(name: 'AdmDashboardControllerBase', context: context);

  @override
  void toggleFloatActionButton() {
    final _$actionInfo =
        _$AdmDashboardControllerBaseActionController.startAction(
            name: 'AdmDashboardControllerBase.toggleFloatActionButton');
    try {
      return super.toggleFloatActionButton();
    } finally {
      _$AdmDashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoadingCsv: ${isLoadingCsv},
isLoading: ${isLoading},
isFloatActionButtonOpen: ${isFloatActionButtonOpen},
filterActivityChipIndexSelected: ${filterActivityChipIndexSelected},
activitiesList: ${activitiesList},
allActivitiesList: ${allActivitiesList}
    ''';
  }
}
