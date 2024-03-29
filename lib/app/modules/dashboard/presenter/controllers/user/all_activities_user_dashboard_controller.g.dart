// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_activities_user_dashboard_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AllActivitiesUserDashboardController
    on AllActivitiesUserDashboardControllerBase, Store {
  late final _$isLoadingAtom = Atom(
      name: 'AllActivitiesUserDashboardControllerBase.isLoading',
      context: context);

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

  late final _$allActivitiesFromGetAtom = Atom(
      name: 'AllActivitiesUserDashboardControllerBase.allActivitiesFromGet',
      context: context);

  @override
  List<EnrollsActivityModel> get allActivitiesFromGet {
    _$allActivitiesFromGetAtom.reportRead();
    return super.allActivitiesFromGet;
  }

  @override
  set allActivitiesFromGet(List<EnrollsActivityModel> value) {
    _$allActivitiesFromGetAtom.reportWrite(value, super.allActivitiesFromGet,
        () {
      super.allActivitiesFromGet = value;
    });
  }

  late final _$activitiesOnScreenAtom = Atom(
      name: 'AllActivitiesUserDashboardControllerBase.activitiesOnScreen',
      context: context);

  @override
  List<EnrollsActivityModel> get activitiesOnScreen {
    _$activitiesOnScreenAtom.reportRead();
    return super.activitiesOnScreen;
  }

  @override
  set activitiesOnScreen(List<EnrollsActivityModel> value) {
    _$activitiesOnScreenAtom.reportWrite(value, super.activitiesOnScreen, () {
      super.activitiesOnScreen = value;
    });
  }

  late final _$enrollmentFilterAtom = Atom(
      name: 'AllActivitiesUserDashboardControllerBase.enrollmentFilter',
      context: context);

  @override
  EnrollButtonEnum? get enrollmentFilter {
    _$enrollmentFilterAtom.reportRead();
    return super.enrollmentFilter;
  }

  @override
  set enrollmentFilter(EnrollButtonEnum? value) {
    _$enrollmentFilterAtom.reportWrite(value, super.enrollmentFilter, () {
      super.enrollmentFilter = value;
    });
  }

  late final _$typeFilterAtom = Atom(
      name: 'AllActivitiesUserDashboardControllerBase.typeFilter',
      context: context);

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

  late final _$typeOnScreenAtom = Atom(
      name: 'AllActivitiesUserDashboardControllerBase.typeOnScreen',
      context: context);

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

  late final _$dateFilterAtom = Atom(
      name: 'AllActivitiesUserDashboardControllerBase.dateFilter',
      context: context);

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

  late final _$hourFilterAtom = Atom(
      name: 'AllActivitiesUserDashboardControllerBase.hourFilter',
      context: context);

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

  late final _$requisitionErrorAtom = Atom(
      name: 'AllActivitiesUserDashboardControllerBase.requisitionError',
      context: context);

  @override
  String? get requisitionError {
    _$requisitionErrorAtom.reportRead();
    return super.requisitionError;
  }

  @override
  set requisitionError(String? value) {
    _$requisitionErrorAtom.reportWrite(value, super.requisitionError, () {
      super.requisitionError = value;
    });
  }

  late final _$setIsLoadingAsyncAction = AsyncAction(
      'AllActivitiesUserDashboardControllerBase.setIsLoading',
      context: context);

  @override
  Future<void> setIsLoading(bool value) {
    return _$setIsLoadingAsyncAction.run(() => super.setIsLoading(value));
  }

  late final _$getActivitiesAsyncAction = AsyncAction(
      'AllActivitiesUserDashboardControllerBase.getActivities',
      context: context);

  @override
  Future<dynamic> getActivities() {
    return _$getActivitiesAsyncAction.run(() => super.getActivities());
  }

  late final _$logoutAsyncAction = AsyncAction(
      'AllActivitiesUserDashboardControllerBase.logout',
      context: context);

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  late final _$AllActivitiesUserDashboardControllerBaseActionController =
      ActionController(
          name: 'AllActivitiesUserDashboardControllerBase', context: context);

  @override
  void setTypeFilter(ActivityEnum value) {
    final _$actionInfo =
        _$AllActivitiesUserDashboardControllerBaseActionController.startAction(
            name: 'AllActivitiesUserDashboardControllerBase.setTypeFilter');
    try {
      return super.setTypeFilter(value);
    } finally {
      _$AllActivitiesUserDashboardControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setEnrollmentFilter(EnrollButtonEnum value) {
    final _$actionInfo =
        _$AllActivitiesUserDashboardControllerBaseActionController.startAction(
            name:
                'AllActivitiesUserDashboardControllerBase.setEnrollmentFilter');
    try {
      return super.setEnrollmentFilter(value);
    } finally {
      _$AllActivitiesUserDashboardControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setDateFilter(DateTime value) {
    final _$actionInfo =
        _$AllActivitiesUserDashboardControllerBaseActionController.startAction(
            name: 'AllActivitiesUserDashboardControllerBase.setDateFilter');
    try {
      return super.setDateFilter(value);
    } finally {
      _$AllActivitiesUserDashboardControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setHourFilter(DateTime value) {
    final _$actionInfo =
        _$AllActivitiesUserDashboardControllerBaseActionController.startAction(
            name: 'AllActivitiesUserDashboardControllerBase.setHourFilter');
    try {
      return super.setHourFilter(value);
    } finally {
      _$AllActivitiesUserDashboardControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setAllFilters() {
    final _$actionInfo =
        _$AllActivitiesUserDashboardControllerBaseActionController.startAction(
            name: 'AllActivitiesUserDashboardControllerBase.setAllFilters');
    try {
      return super.setAllFilters();
    } finally {
      _$AllActivitiesUserDashboardControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic resetFilters() {
    final _$actionInfo =
        _$AllActivitiesUserDashboardControllerBaseActionController.startAction(
            name: 'AllActivitiesUserDashboardControllerBase.resetFilters');
    try {
      return super.resetFilters();
    } finally {
      _$AllActivitiesUserDashboardControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  List<EnrollsActivityModel> filterActivitiesByType(
      ActivityEnum type, List<EnrollsActivityModel> activitiesToFilter) {
    final _$actionInfo =
        _$AllActivitiesUserDashboardControllerBaseActionController.startAction(
            name:
                'AllActivitiesUserDashboardControllerBase.filterActivitiesByType');
    try {
      return super.filterActivitiesByType(type, activitiesToFilter);
    } finally {
      _$AllActivitiesUserDashboardControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  List<EnrollsActivityModel> filterActivitiesByEnrollmentState(
      EnrollButtonEnum type, List<EnrollsActivityModel> activitiesToFilter) {
    final _$actionInfo =
        _$AllActivitiesUserDashboardControllerBaseActionController.startAction(
            name:
                'AllActivitiesUserDashboardControllerBase.filterActivitiesByEnrollmentState');
    try {
      return super.filterActivitiesByEnrollmentState(type, activitiesToFilter);
    } finally {
      _$AllActivitiesUserDashboardControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  List<EnrollsActivityModel> filterActivitiesByDate(
      DateTime date, List<EnrollsActivityModel> activitiesToFilter) {
    final _$actionInfo =
        _$AllActivitiesUserDashboardControllerBaseActionController.startAction(
            name:
                'AllActivitiesUserDashboardControllerBase.filterActivitiesByDate');
    try {
      return super.filterActivitiesByDate(date, activitiesToFilter);
    } finally {
      _$AllActivitiesUserDashboardControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  List<EnrollsActivityModel> filterActivitiesByHour(
      DateTime hour, List<EnrollsActivityModel> activitiesToFilter) {
    final _$actionInfo =
        _$AllActivitiesUserDashboardControllerBaseActionController.startAction(
            name:
                'AllActivitiesUserDashboardControllerBase.filterActivitiesByHour');
    try {
      return super.filterActivitiesByHour(hour, activitiesToFilter);
    } finally {
      _$AllActivitiesUserDashboardControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
allActivitiesFromGet: ${allActivitiesFromGet},
activitiesOnScreen: ${activitiesOnScreen},
enrollmentFilter: ${enrollmentFilter},
typeFilter: ${typeFilter},
typeOnScreen: ${typeOnScreen},
dateFilter: ${dateFilter},
hourFilter: ${hourFilter},
requisitionError: ${requisitionError}
    ''';
  }
}
