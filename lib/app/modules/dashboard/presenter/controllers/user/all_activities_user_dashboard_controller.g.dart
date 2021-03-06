// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_activities_user_dashboard_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AllActivitiesUserDashboardController
    on _AllActivitiesUserDashboardControllerBase, Store {
  Computed<List<CardActivity>>? _$mondayActivitiesListComputed;

  @override
  List<CardActivity> get mondayActivitiesList =>
      (_$mondayActivitiesListComputed ??= Computed<List<CardActivity>>(
              () => super.mondayActivitiesList,
              name:
                  '_AllActivitiesUserDashboardControllerBase.mondayActivitiesList'))
          .value;
  Computed<List<CardActivity>>? _$tuesdayActivitiesListComputed;

  @override
  List<CardActivity> get tuesdayActivitiesList =>
      (_$tuesdayActivitiesListComputed ??= Computed<List<CardActivity>>(
              () => super.tuesdayActivitiesList,
              name:
                  '_AllActivitiesUserDashboardControllerBase.tuesdayActivitiesList'))
          .value;
  Computed<List<CardActivity>>? _$wednesdayActivitiesListComputed;

  @override
  List<CardActivity> get wednesdayActivitiesList =>
      (_$wednesdayActivitiesListComputed ??= Computed<List<CardActivity>>(
              () => super.wednesdayActivitiesList,
              name:
                  '_AllActivitiesUserDashboardControllerBase.wednesdayActivitiesList'))
          .value;
  Computed<List<CardActivity>>? _$thursdayActivitiesListComputed;

  @override
  List<CardActivity> get thursdayActivitiesList =>
      (_$thursdayActivitiesListComputed ??= Computed<List<CardActivity>>(
              () => super.thursdayActivitiesList,
              name:
                  '_AllActivitiesUserDashboardControllerBase.thursdayActivitiesList'))
          .value;
  Computed<List<CardActivity>>? _$fridayActivitiesListComputed;

  @override
  List<CardActivity> get fridayActivitiesList =>
      (_$fridayActivitiesListComputed ??= Computed<List<CardActivity>>(
              () => super.fridayActivitiesList,
              name:
                  '_AllActivitiesUserDashboardControllerBase.fridayActivitiesList'))
          .value;
  Computed<List<CardActivity>>? _$saturdayActivitiesListComputed;

  @override
  List<CardActivity> get saturdayActivitiesList =>
      (_$saturdayActivitiesListComputed ??= Computed<List<CardActivity>>(
              () => super.saturdayActivitiesList,
              name:
                  '_AllActivitiesUserDashboardControllerBase.saturdayActivitiesList'))
          .value;

  late final _$isLoadingAtom = Atom(
      name: '_AllActivitiesUserDashboardControllerBase.isLoading',
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

  late final _$filterActivityChipIndexSelectedAtom = Atom(
      name:
          '_AllActivitiesUserDashboardControllerBase.filterActivityChipIndexSelected',
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

  late final _$weekActivitiesListAtom = Atom(
      name: '_AllActivitiesUserDashboardControllerBase.weekActivitiesList',
      context: context);

  @override
  List<CardActivity> get weekActivitiesList {
    _$weekActivitiesListAtom.reportRead();
    return super.weekActivitiesList;
  }

  @override
  set weekActivitiesList(List<CardActivity> value) {
    _$weekActivitiesListAtom.reportWrite(value, super.weekActivitiesList, () {
      super.weekActivitiesList = value;
    });
  }

  late final _$activitiesListAtom = Atom(
      name: '_AllActivitiesUserDashboardControllerBase.activitiesList',
      context: context);

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

  late final _$allActivitiesToCardsAtom = Atom(
      name: '_AllActivitiesUserDashboardControllerBase.allActivitiesToCards',
      context: context);

  @override
  List<CardActivity> get allActivitiesToCards {
    _$allActivitiesToCardsAtom.reportRead();
    return super.allActivitiesToCards;
  }

  @override
  set allActivitiesToCards(List<CardActivity> value) {
    _$allActivitiesToCardsAtom.reportWrite(value, super.allActivitiesToCards,
        () {
      super.allActivitiesToCards = value;
    });
  }

  late final _$activityTypeAtom = Atom(
      name: '_AllActivitiesUserDashboardControllerBase.activityType',
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

  late final _$setIsLoadingAsyncAction = AsyncAction(
      '_AllActivitiesUserDashboardControllerBase.setIsLoading',
      context: context);

  @override
  Future<void> setIsLoading(bool value) {
    return _$setIsLoadingAsyncAction.run(() => super.setIsLoading(value));
  }

  late final _$getAllActivitiesAsyncAction = AsyncAction(
      '_AllActivitiesUserDashboardControllerBase.getAllActivities',
      context: context);

  @override
  Future<dynamic> getAllActivities() {
    return _$getAllActivitiesAsyncAction.run(() => super.getAllActivities());
  }

  late final _$getActivitiesByTypeAsyncAction = AsyncAction(
      '_AllActivitiesUserDashboardControllerBase.getActivitiesByType',
      context: context);

  @override
  Future<dynamic> getActivitiesByType(ActivityEnum? typeActivity) {
    return _$getActivitiesByTypeAsyncAction
        .run(() => super.getActivitiesByType(typeActivity));
  }

  late final _$logoutAsyncAction = AsyncAction(
      '_AllActivitiesUserDashboardControllerBase.logout',
      context: context);

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  late final _$_AllActivitiesUserDashboardControllerBaseActionController =
      ActionController(
          name: '_AllActivitiesUserDashboardControllerBase', context: context);

  @override
  void toggleFilterActivityChipIndex(dynamic index) {
    final _$actionInfo =
        _$_AllActivitiesUserDashboardControllerBaseActionController.startAction(
            name:
                '_AllActivitiesUserDashboardControllerBase.toggleFilterActivityChipIndex');
    try {
      return super.toggleFilterActivityChipIndex(index);
    } finally {
      _$_AllActivitiesUserDashboardControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
filterActivityChipIndexSelected: ${filterActivityChipIndexSelected},
weekActivitiesList: ${weekActivitiesList},
activitiesList: ${activitiesList},
allActivitiesToCards: ${allActivitiesToCards},
activityType: ${activityType},
mondayActivitiesList: ${mondayActivitiesList},
tuesdayActivitiesList: ${tuesdayActivitiesList},
wednesdayActivitiesList: ${wednesdayActivitiesList},
thursdayActivitiesList: ${thursdayActivitiesList},
fridayActivitiesList: ${fridayActivitiesList},
saturdayActivitiesList: ${saturdayActivitiesList}
    ''';
  }
}
