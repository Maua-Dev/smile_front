// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responsible_activities_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ResponsibleActivitiesController
    on ResponsibleActivitiesControllerBase, Store {
  late final _$isLoadingAtom = Atom(
      name: 'ResponsibleActivitiesControllerBase.isLoading', context: context);

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

  late final _$allResponsibleActivitiesAtom = Atom(
      name: 'ResponsibleActivitiesControllerBase.allResponsibleActivities',
      context: context);

  @override
  List<EnrollsActivityModel> get allResponsibleActivities {
    _$allResponsibleActivitiesAtom.reportRead();
    return super.allResponsibleActivities;
  }

  @override
  set allResponsibleActivities(List<EnrollsActivityModel> value) {
    _$allResponsibleActivitiesAtom
        .reportWrite(value, super.allResponsibleActivities, () {
      super.allResponsibleActivities = value;
    });
  }

  late final _$activitiesToShowAtom = Atom(
      name: 'ResponsibleActivitiesControllerBase.activitiesToShow',
      context: context);

  @override
  List<EnrollsActivityModel> get activitiesToShow {
    _$activitiesToShowAtom.reportRead();
    return super.activitiesToShow;
  }

  @override
  set activitiesToShow(List<EnrollsActivityModel> value) {
    _$activitiesToShowAtom.reportWrite(value, super.activitiesToShow, () {
      super.activitiesToShow = value;
    });
  }

  late final _$requisitionErrorAtom = Atom(
      name: 'ResponsibleActivitiesControllerBase.requisitionError',
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

  late final _$activityTypeAtom = Atom(
      name: 'ResponsibleActivitiesControllerBase.activityType',
      context: context);

  @override
  ActivityEnum? get activityType {
    _$activityTypeAtom.reportRead();
    return super.activityType;
  }

  @override
  set activityType(ActivityEnum? value) {
    _$activityTypeAtom.reportWrite(value, super.activityType, () {
      super.activityType = value;
    });
  }

  late final _$typeFilterAtom = Atom(
      name: 'ResponsibleActivitiesControllerBase.typeFilter', context: context);

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

  late final _$dateFilterAtom = Atom(
      name: 'ResponsibleActivitiesControllerBase.dateFilter', context: context);

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
      name: 'ResponsibleActivitiesControllerBase.hourFilter', context: context);

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

  late final _$setIsLoadingAsyncAction = AsyncAction(
      'ResponsibleActivitiesControllerBase.setIsLoading',
      context: context);

  @override
  Future<void> setIsLoading(bool value) {
    return _$setIsLoadingAsyncAction.run(() => super.setIsLoading(value));
  }

  late final _$getFiltredActivitiesAsyncAction = AsyncAction(
      'ResponsibleActivitiesControllerBase.getFiltredActivities',
      context: context);

  @override
  Future<void> getFiltredActivities() {
    return _$getFiltredActivitiesAsyncAction
        .run(() => super.getFiltredActivities());
  }

  late final _$ResponsibleActivitiesControllerBaseActionController =
      ActionController(
          name: 'ResponsibleActivitiesControllerBase', context: context);

  @override
  void setTypeFilter(ActivityEnum value) {
    final _$actionInfo = _$ResponsibleActivitiesControllerBaseActionController
        .startAction(name: 'ResponsibleActivitiesControllerBase.setTypeFilter');
    try {
      return super.setTypeFilter(value);
    } finally {
      _$ResponsibleActivitiesControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setDateFilter(DateTime value) {
    final _$actionInfo = _$ResponsibleActivitiesControllerBaseActionController
        .startAction(name: 'ResponsibleActivitiesControllerBase.setDateFilter');
    try {
      return super.setDateFilter(value);
    } finally {
      _$ResponsibleActivitiesControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setHourFilter(DateTime value) {
    final _$actionInfo = _$ResponsibleActivitiesControllerBaseActionController
        .startAction(name: 'ResponsibleActivitiesControllerBase.setHourFilter');
    try {
      return super.setHourFilter(value);
    } finally {
      _$ResponsibleActivitiesControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setAllFilters() {
    final _$actionInfo = _$ResponsibleActivitiesControllerBaseActionController
        .startAction(name: 'ResponsibleActivitiesControllerBase.setAllFilters');
    try {
      return super.setAllFilters();
    } finally {
      _$ResponsibleActivitiesControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic resetFilters() {
    final _$actionInfo = _$ResponsibleActivitiesControllerBaseActionController
        .startAction(name: 'ResponsibleActivitiesControllerBase.resetFilters');
    try {
      return super.resetFilters();
    } finally {
      _$ResponsibleActivitiesControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  List<EnrollsActivityModel> filterActivitiesByType(
      ActivityEnum type, List<EnrollsActivityModel> activitiesToFilter) {
    final _$actionInfo =
        _$ResponsibleActivitiesControllerBaseActionController.startAction(
            name: 'ResponsibleActivitiesControllerBase.filterActivitiesByType');
    try {
      return super.filterActivitiesByType(type, activitiesToFilter);
    } finally {
      _$ResponsibleActivitiesControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  List<EnrollsActivityModel> filterActivitiesByDate(
      DateTime date, List<EnrollsActivityModel> activitiesToFilter) {
    final _$actionInfo =
        _$ResponsibleActivitiesControllerBaseActionController.startAction(
            name: 'ResponsibleActivitiesControllerBase.filterActivitiesByDate');
    try {
      return super.filterActivitiesByDate(date, activitiesToFilter);
    } finally {
      _$ResponsibleActivitiesControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  List<EnrollsActivityModel> filterActivitiesByHour(
      DateTime hour, List<EnrollsActivityModel> activitiesToFilter) {
    final _$actionInfo =
        _$ResponsibleActivitiesControllerBaseActionController.startAction(
            name: 'ResponsibleActivitiesControllerBase.filterActivitiesByHour');
    try {
      return super.filterActivitiesByHour(hour, activitiesToFilter);
    } finally {
      _$ResponsibleActivitiesControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
allResponsibleActivities: ${allResponsibleActivities},
activitiesToShow: ${activitiesToShow},
requisitionError: ${requisitionError},
activityType: ${activityType},
typeFilter: ${typeFilter},
dateFilter: ${dateFilter},
hourFilter: ${hourFilter}
    ''';
  }
}
