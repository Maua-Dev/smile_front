// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dashboard_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserDashboardController on UserDashboardControllerBase, Store {
  late final _$errorAtom =
      Atom(name: 'UserDashboardControllerBase.error', context: context);

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$socialNameAtom =
      Atom(name: 'UserDashboardControllerBase.socialName', context: context);

  @override
  String? get socialName {
    _$socialNameAtom.reportRead();
    return super.socialName;
  }

  @override
  set socialName(String? value) {
    _$socialNameAtom.reportWrite(value, super.socialName, () {
      super.socialName = value;
    });
  }

  late final _$nameAtom =
      Atom(name: 'UserDashboardControllerBase.name', context: context);

  @override
  String? get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String? value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$certificateWithSocialNameAtom = Atom(
      name: 'UserDashboardControllerBase.certificateWithSocialName',
      context: context);

  @override
  bool get certificateWithSocialName {
    _$certificateWithSocialNameAtom.reportRead();
    return super.certificateWithSocialName;
  }

  @override
  set certificateWithSocialName(bool value) {
    _$certificateWithSocialNameAtom
        .reportWrite(value, super.certificateWithSocialName, () {
      super.certificateWithSocialName = value;
    });
  }

  late final _$socialNameToChangeAtom = Atom(
      name: 'UserDashboardControllerBase.socialNameToChange', context: context);

  @override
  String get socialNameToChange {
    _$socialNameToChangeAtom.reportRead();
    return super.socialNameToChange;
  }

  @override
  set socialNameToChange(String value) {
    _$socialNameToChangeAtom.reportWrite(value, super.socialNameToChange, () {
      super.socialNameToChange = value;
    });
  }

  late final _$nameToChangeAtom =
      Atom(name: 'UserDashboardControllerBase.nameToChange', context: context);

  @override
  String get nameToChange {
    _$nameToChangeAtom.reportRead();
    return super.nameToChange;
  }

  @override
  set nameToChange(String value) {
    _$nameToChangeAtom.reportWrite(value, super.nameToChange, () {
      super.nameToChange = value;
    });
  }

  late final _$wantSocialNameAtom = Atom(
      name: 'UserDashboardControllerBase.wantSocialName', context: context);

  @override
  bool get wantSocialName {
    _$wantSocialNameAtom.reportRead();
    return super.wantSocialName;
  }

  @override
  set wantSocialName(bool value) {
    _$wantSocialNameAtom.reportWrite(value, super.wantSocialName, () {
      super.wantSocialName = value;
    });
  }

  late final _$subscribedActivitiesOnScreenAtom = Atom(
      name: 'UserDashboardControllerBase.subscribedActivitiesOnScreen',
      context: context);

  @override
  List<EnrollsActivityModel> get subscribedActivitiesOnScreen {
    _$subscribedActivitiesOnScreenAtom.reportRead();
    return super.subscribedActivitiesOnScreen;
  }

  @override
  set subscribedActivitiesOnScreen(List<EnrollsActivityModel> value) {
    _$subscribedActivitiesOnScreenAtom
        .reportWrite(value, super.subscribedActivitiesOnScreen, () {
      super.subscribedActivitiesOnScreen = value;
    });
  }

  late final _$activityTypeAtom =
      Atom(name: 'UserDashboardControllerBase.activityType', context: context);

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

  late final _$typeFilterAtom =
      Atom(name: 'UserDashboardControllerBase.typeFilter', context: context);

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

  late final _$dateFilterAtom =
      Atom(name: 'UserDashboardControllerBase.dateFilter', context: context);

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
      Atom(name: 'UserDashboardControllerBase.hourFilter', context: context);

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

  late final _$isLoadingAtom =
      Atom(name: 'UserDashboardControllerBase.isLoading', context: context);

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

  late final _$filterActivityChipIndexSelectedAtom = Atom(
      name: 'UserDashboardControllerBase.filterActivityChipIndexSelected',
      context: context);

  @override
  int get filterActivityChipIndexSelected {
    _$filterActivityChipIndexSelectedAtom.reportRead();
    return super.filterActivityChipIndexSelected;
  }

  @override
  set filterActivityChipIndexSelected(int value) {
    _$filterActivityChipIndexSelectedAtom
        .reportWrite(value, super.filterActivityChipIndexSelected, () {
      super.filterActivityChipIndexSelected = value;
    });
  }

  late final _$allSubscribedActivitiesListAtom = Atom(
      name: 'UserDashboardControllerBase.allSubscribedActivitiesList',
      context: context);

  @override
  List<EnrollsActivityModel> get allSubscribedActivitiesList {
    _$allSubscribedActivitiesListAtom.reportRead();
    return super.allSubscribedActivitiesList;
  }

  @override
  set allSubscribedActivitiesList(List<EnrollsActivityModel> value) {
    _$allSubscribedActivitiesListAtom
        .reportWrite(value, super.allSubscribedActivitiesList, () {
      super.allSubscribedActivitiesList = value;
    });
  }

  late final _$nextActivityAtom =
      Atom(name: 'UserDashboardControllerBase.nextActivity', context: context);

  @override
  EnrollsActivityModel get nextActivity {
    _$nextActivityAtom.reportRead();
    return super.nextActivity;
  }

  @override
  set nextActivity(EnrollsActivityModel value) {
    _$nextActivityAtom.reportWrite(value, super.nextActivity, () {
      super.nextActivity = value;
    });
  }

  late final _$requisitionErrorAtom = Atom(
      name: 'UserDashboardControllerBase.requisitionError', context: context);

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

  late final _$getCertificateWithSocialNameAsyncAction = AsyncAction(
      'UserDashboardControllerBase.getCertificateWithSocialName',
      context: context);

  @override
  Future<void> getCertificateWithSocialName() {
    return _$getCertificateWithSocialNameAsyncAction
        .run(() => super.getCertificateWithSocialName());
  }

  late final _$getUserNameAsyncAction =
      AsyncAction('UserDashboardControllerBase.getUserName', context: context);

  @override
  Future<void> getUserName() {
    return _$getUserNameAsyncAction.run(() => super.getUserName());
  }

  late final _$getUserSocialNameAsyncAction = AsyncAction(
      'UserDashboardControllerBase.getUserSocialName',
      context: context);

  @override
  Future<void> getUserSocialName() {
    return _$getUserSocialNameAsyncAction.run(() => super.getUserSocialName());
  }

  late final _$setWantSocialNameAsyncAction = AsyncAction(
      'UserDashboardControllerBase.setWantSocialName',
      context: context);

  @override
  Future<void> setWantSocialName(bool? value) {
    return _$setWantSocialNameAsyncAction
        .run(() => super.setWantSocialName(value));
  }

  late final _$changeUserDataAsyncAction = AsyncAction(
      'UserDashboardControllerBase.changeUserData',
      context: context);

  @override
  Future<void> changeUserData() {
    return _$changeUserDataAsyncAction.run(() => super.changeUserData());
  }

  late final _$setIsLoadingAsyncAction =
      AsyncAction('UserDashboardControllerBase.setIsLoading', context: context);

  @override
  Future<void> setIsLoading(bool value) {
    return _$setIsLoadingAsyncAction.run(() => super.setIsLoading(value));
  }

  late final _$getUserSubscribedActivitiesAsyncAction = AsyncAction(
      'UserDashboardControllerBase.getUserSubscribedActivities',
      context: context);

  @override
  Future<dynamic> getUserSubscribedActivities() {
    return _$getUserSubscribedActivitiesAsyncAction
        .run(() => super.getUserSubscribedActivities());
  }

  late final _$UserDashboardControllerBaseActionController =
      ActionController(name: 'UserDashboardControllerBase', context: context);

  @override
  void setTypeFilter(ActivityEnum value) {
    final _$actionInfo = _$UserDashboardControllerBaseActionController
        .startAction(name: 'UserDashboardControllerBase.setTypeFilter');
    try {
      return super.setTypeFilter(value);
    } finally {
      _$UserDashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDateFilter(DateTime value) {
    final _$actionInfo = _$UserDashboardControllerBaseActionController
        .startAction(name: 'UserDashboardControllerBase.setDateFilter');
    try {
      return super.setDateFilter(value);
    } finally {
      _$UserDashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHourFilter(DateTime value) {
    final _$actionInfo = _$UserDashboardControllerBaseActionController
        .startAction(name: 'UserDashboardControllerBase.setHourFilter');
    try {
      return super.setHourFilter(value);
    } finally {
      _$UserDashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAllFilters() {
    final _$actionInfo = _$UserDashboardControllerBaseActionController
        .startAction(name: 'UserDashboardControllerBase.setAllFilters');
    try {
      return super.setAllFilters();
    } finally {
      _$UserDashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic resetFilters() {
    final _$actionInfo = _$UserDashboardControllerBaseActionController
        .startAction(name: 'UserDashboardControllerBase.resetFilters');
    try {
      return super.resetFilters();
    } finally {
      _$UserDashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<EnrollsActivityModel> filterActivitiesByType(
      ActivityEnum type, List<EnrollsActivityModel> activitiesToFilter) {
    final _$actionInfo =
        _$UserDashboardControllerBaseActionController.startAction(
            name: 'UserDashboardControllerBase.filterActivitiesByType');
    try {
      return super.filterActivitiesByType(type, activitiesToFilter);
    } finally {
      _$UserDashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<EnrollsActivityModel> filterActivitiesByDate(
      DateTime date, List<EnrollsActivityModel> activitiesToFilter) {
    final _$actionInfo =
        _$UserDashboardControllerBaseActionController.startAction(
            name: 'UserDashboardControllerBase.filterActivitiesByDate');
    try {
      return super.filterActivitiesByDate(date, activitiesToFilter);
    } finally {
      _$UserDashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<EnrollsActivityModel> filterActivitiesByHour(
      DateTime hour, List<EnrollsActivityModel> activitiesToFilter) {
    final _$actionInfo =
        _$UserDashboardControllerBaseActionController.startAction(
            name: 'UserDashboardControllerBase.filterActivitiesByHour');
    try {
      return super.filterActivitiesByHour(hour, activitiesToFilter);
    } finally {
      _$UserDashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String value) {
    final _$actionInfo = _$UserDashboardControllerBaseActionController
        .startAction(name: 'UserDashboardControllerBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$UserDashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUserSocialName(String value) {
    final _$actionInfo = _$UserDashboardControllerBaseActionController
        .startAction(name: 'UserDashboardControllerBase.setUserSocialName');
    try {
      return super.setUserSocialName(value);
    } finally {
      _$UserDashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCertificateWithSocialName(bool value) {
    final _$actionInfo =
        _$UserDashboardControllerBaseActionController.startAction(
            name: 'UserDashboardControllerBase.setCertificateWithSocialName');
    try {
      return super.setCertificateWithSocialName(value);
    } finally {
      _$UserDashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validateName() {
    final _$actionInfo = _$UserDashboardControllerBaseActionController
        .startAction(name: 'UserDashboardControllerBase.validateName');
    try {
      return super.validateName();
    } finally {
      _$UserDashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validateSocialName() {
    final _$actionInfo = _$UserDashboardControllerBaseActionController
        .startAction(name: 'UserDashboardControllerBase.validateSocialName');
    try {
      return super.validateSocialName();
    } finally {
      _$UserDashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getNextActivity() {
    final _$actionInfo = _$UserDashboardControllerBaseActionController
        .startAction(name: 'UserDashboardControllerBase.getNextActivity');
    try {
      return super.getNextActivity();
    } finally {
      _$UserDashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
error: ${error},
socialName: ${socialName},
name: ${name},
certificateWithSocialName: ${certificateWithSocialName},
socialNameToChange: ${socialNameToChange},
nameToChange: ${nameToChange},
wantSocialName: ${wantSocialName},
subscribedActivitiesOnScreen: ${subscribedActivitiesOnScreen},
activityType: ${activityType},
typeFilter: ${typeFilter},
dateFilter: ${dateFilter},
hourFilter: ${hourFilter},
isLoading: ${isLoading},
filterActivityChipIndexSelected: ${filterActivityChipIndexSelected},
allSubscribedActivitiesList: ${allSubscribedActivitiesList},
nextActivity: ${nextActivity},
requisitionError: ${requisitionError}
    ''';
  }
}
