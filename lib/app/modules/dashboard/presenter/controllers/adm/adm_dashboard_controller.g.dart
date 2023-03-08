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

  late final _$isManualDropLoadingAtom = Atom(
      name: 'AdmDashboardControllerBase.isManualDropLoading', context: context);

  @override
  bool get isManualDropLoading {
    _$isManualDropLoadingAtom.reportRead();
    return super.isManualDropLoading;
  }

  @override
  set isManualDropLoading(bool value) {
    _$isManualDropLoadingAtom.reportWrite(value, super.isManualDropLoading, () {
      super.isManualDropLoading = value;
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
  List<AdminActivityModel> get activitiesList {
    _$activitiesListAtom.reportRead();
    return super.activitiesList;
  }

  @override
  set activitiesList(List<AdminActivityModel> value) {
    _$activitiesListAtom.reportWrite(value, super.activitiesList, () {
      super.activitiesList = value;
    });
  }

  late final _$allActivitiesListAtom = Atom(
      name: 'AdmDashboardControllerBase.allActivitiesList', context: context);

  @override
  List<AdminActivityModel> get allActivitiesList {
    _$allActivitiesListAtom.reportRead();
    return super.allActivitiesList;
  }

  @override
  set allActivitiesList(List<AdminActivityModel> value) {
    _$allActivitiesListAtom.reportWrite(value, super.allActivitiesList, () {
      super.allActivitiesList = value;
    });
  }

  late final _$typeFilterAtom =
      Atom(name: 'AdmDashboardControllerBase.typeFilter', context: context);

  @override
  ActivityEnum? get typeFilter {
    _$typeFilterAtom.reportRead();
    return super.typeFilter;
  }

  @override
  set typeFilter(ActivityEnum? value) {
    _$typeFilterAtom.reportWrite(value, super.typeFilter, () {
      super.typeFilter = value;
    });
  }

  late final _$typeOnScreenAtom =
      Atom(name: 'AdmDashboardControllerBase.typeOnScreen', context: context);

  @override
  String? get typeOnScreen {
    _$typeOnScreenAtom.reportRead();
    return super.typeOnScreen;
  }

  @override
  set typeOnScreen(String? value) {
    _$typeOnScreenAtom.reportWrite(value, super.typeOnScreen, () {
      super.typeOnScreen = value;
    });
  }

  late final _$dateFilterAtom =
      Atom(name: 'AdmDashboardControllerBase.dateFilter', context: context);

  @override
  DateTime? get dateFilter {
    _$dateFilterAtom.reportRead();
    return super.dateFilter;
  }

  @override
  set dateFilter(DateTime? value) {
    _$dateFilterAtom.reportWrite(value, super.dateFilter, () {
      super.dateFilter = value;
    });
  }

  late final _$hourFilterAtom =
      Atom(name: 'AdmDashboardControllerBase.hourFilter', context: context);

  @override
  DateTime? get hourFilter {
    _$hourFilterAtom.reportRead();
    return super.hourFilter;
  }

  @override
  set hourFilter(DateTime? value) {
    _$hourFilterAtom.reportWrite(value, super.hourFilter, () {
      super.hourFilter = value;
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

  late final _$setManualDropIsLoadingAsyncAction = AsyncAction(
      'AdmDashboardControllerBase.setManualDropIsLoading',
      context: context);

  @override
  Future<void> setManualDropIsLoading(bool value) {
    return _$setManualDropIsLoadingAsyncAction
        .run(() => super.setManualDropIsLoading(value));
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

  late final _$dropActivityAsyncAction =
      AsyncAction('AdmDashboardControllerBase.dropActivity', context: context);

  @override
  Future<dynamic> dropActivity(String activityCode, String userId) {
    return _$dropActivityAsyncAction
        .run(() => super.dropActivity(activityCode, userId));
  }

  late final _$getAllActivitiesAsyncAction = AsyncAction(
      'AdmDashboardControllerBase.getAllActivities',
      context: context);

  @override
  Future<dynamic> getAllActivities() {
    return _$getAllActivitiesAsyncAction.run(() => super.getAllActivities());
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
  void setTypeFilter(ActivityEnum value) {
    final _$actionInfo = _$AdmDashboardControllerBaseActionController
        .startAction(name: 'AdmDashboardControllerBase.setTypeFilter');
    try {
      return super.setTypeFilter(value);
    } finally {
      _$AdmDashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDateFilter(DateTime value) {
    final _$actionInfo = _$AdmDashboardControllerBaseActionController
        .startAction(name: 'AdmDashboardControllerBase.setDateFilter');
    try {
      return super.setDateFilter(value);
    } finally {
      _$AdmDashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHourFilter(DateTime value) {
    final _$actionInfo = _$AdmDashboardControllerBaseActionController
        .startAction(name: 'AdmDashboardControllerBase.setHourFilter');
    try {
      return super.setHourFilter(value);
    } finally {
      _$AdmDashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAllFilters() {
    final _$actionInfo = _$AdmDashboardControllerBaseActionController
        .startAction(name: 'AdmDashboardControllerBase.setAllFilters');
    try {
      return super.setAllFilters();
    } finally {
      _$AdmDashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic resetFilters() {
    final _$actionInfo = _$AdmDashboardControllerBaseActionController
        .startAction(name: 'AdmDashboardControllerBase.resetFilters');
    try {
      return super.resetFilters();
    } finally {
      _$AdmDashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<AdminActivityModel> filterActivitiesByType(
      ActivityEnum type, List<AdminActivityModel> activitiesToFilter) {
    final _$actionInfo = _$AdmDashboardControllerBaseActionController
        .startAction(name: 'AdmDashboardControllerBase.filterActivitiesByType');
    try {
      return super.filterActivitiesByType(type, activitiesToFilter);
    } finally {
      _$AdmDashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<AdminActivityModel> filterActivitiesByDate(
      DateTime date, List<AdminActivityModel> activitiesToFilter) {
    final _$actionInfo = _$AdmDashboardControllerBaseActionController
        .startAction(name: 'AdmDashboardControllerBase.filterActivitiesByDate');
    try {
      return super.filterActivitiesByDate(date, activitiesToFilter);
    } finally {
      _$AdmDashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<AdminActivityModel> filterActivitiesByHour(
      DateTime hour, List<AdminActivityModel> activitiesToFilter) {
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
isManualDropLoading: ${isManualDropLoading},
isFloatActionButtonOpen: ${isFloatActionButtonOpen},
filterActivityChipIndexSelected: ${filterActivityChipIndexSelected},
activitiesList: ${activitiesList},
allActivitiesList: ${allActivitiesList},
typeFilter: ${typeFilter},
typeOnScreen: ${typeOnScreen},
dateFilter: ${dateFilter},
hourFilter: ${hourFilter}
    ''';
  }
}
