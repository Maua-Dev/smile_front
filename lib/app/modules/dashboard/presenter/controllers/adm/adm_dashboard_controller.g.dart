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

  late final _$typeAtom =
      Atom(name: 'AdmDashboardControllerBase.type', context: context);

  @override
  ActivityEnum? get type {
    _$typeAtom.reportRead();
    return super.type;
  }

  @override
  set type(ActivityEnum? value) {
    _$typeAtom.reportWrite(value, super.type, () {
      super.type = value;
    });
  }

  late final _$dateAtom =
      Atom(name: 'AdmDashboardControllerBase.date', context: context);

  @override
  DateTime? get date {
    _$dateAtom.reportRead();
    return super.date;
  }

  @override
  set date(DateTime? value) {
    _$dateAtom.reportWrite(value, super.date, () {
      super.date = value;
    });
  }

  late final _$hourAtom =
      Atom(name: 'AdmDashboardControllerBase.hour', context: context);

  @override
  DateTime? get hour {
    _$hourAtom.reportRead();
    return super.hour;
  }

  @override
  set hour(DateTime? value) {
    _$hourAtom.reportWrite(value, super.hour, () {
      super.hour = value;
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
  void setFilterType(ActivityEnum value) {
    final _$actionInfo = _$AdmDashboardControllerBaseActionController
        .startAction(name: 'AdmDashboardControllerBase.setFilterType');
    try {
      return super.setFilterType(value);
    } finally {
      _$AdmDashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFilterDate(DateTime value) {
    final _$actionInfo = _$AdmDashboardControllerBaseActionController
        .startAction(name: 'AdmDashboardControllerBase.setFilterDate');
    try {
      return super.setFilterDate(value);
    } finally {
      _$AdmDashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFilterHour(DateTime value) {
    final _$actionInfo = _$AdmDashboardControllerBaseActionController
        .startAction(name: 'AdmDashboardControllerBase.setFilterHour');
    try {
      return super.setFilterHour(value);
    } finally {
      _$AdmDashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void allFilters() {
    final _$actionInfo = _$AdmDashboardControllerBaseActionController
        .startAction(name: 'AdmDashboardControllerBase.allFilters');
    try {
      return super.allFilters();
    } finally {
      _$AdmDashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<ActivityModel> filterActivitiesByType(
      ActivityEnum type, List<ActivityModel> activitiesToFilter) {
    final _$actionInfo = _$AdmDashboardControllerBaseActionController
        .startAction(name: 'AdmDashboardControllerBase.filterActivitiesByType');
    try {
      return super.filterActivitiesByType(type, activitiesToFilter);
    } finally {
      _$AdmDashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<ActivityModel> filterActivitiesByDate(
      DateTime date, List<ActivityModel> activitiesToFilter) {
    final _$actionInfo = _$AdmDashboardControllerBaseActionController
        .startAction(name: 'AdmDashboardControllerBase.filterActivitiesByDate');
    try {
      return super.filterActivitiesByDate(date, activitiesToFilter);
    } finally {
      _$AdmDashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<ActivityModel> filterActivitiesByHour(
      DateTime hour, List<ActivityModel> activitiesToFilter) {
    final _$actionInfo = _$AdmDashboardControllerBaseActionController
        .startAction(name: 'AdmDashboardControllerBase.filterActivitiesByHour');
    try {
      return super.filterActivitiesByHour(hour, activitiesToFilter);
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
allActivitiesList: ${allActivitiesList},
type: ${type},
date: ${date},
hour: ${hour}
    ''';
  }
}
