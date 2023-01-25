// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_activities_user_dashboard_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AllActivitiesUserDashboardController
    on AllActivitiesUserDashboardControllerBase, Store {
  Computed<List<CardActivity>>? _$mondayActivitiesListComputed;

  @override
  List<CardActivity> get mondayActivitiesList =>
      (_$mondayActivitiesListComputed ??= Computed<List<CardActivity>>(
              () => super.mondayActivitiesList,
              name:
                  'AllActivitiesUserDashboardControllerBase.mondayActivitiesList'))
          .value;
  Computed<List<CardActivity>>? _$tuesdayActivitiesListComputed;

  @override
  List<CardActivity> get tuesdayActivitiesList =>
      (_$tuesdayActivitiesListComputed ??= Computed<List<CardActivity>>(
              () => super.tuesdayActivitiesList,
              name:
                  'AllActivitiesUserDashboardControllerBase.tuesdayActivitiesList'))
          .value;
  Computed<List<CardActivity>>? _$wednesdayActivitiesListComputed;

  @override
  List<CardActivity> get wednesdayActivitiesList =>
      (_$wednesdayActivitiesListComputed ??= Computed<List<CardActivity>>(
              () => super.wednesdayActivitiesList,
              name:
                  'AllActivitiesUserDashboardControllerBase.wednesdayActivitiesList'))
          .value;
  Computed<List<CardActivity>>? _$thursdayActivitiesListComputed;

  @override
  List<CardActivity> get thursdayActivitiesList =>
      (_$thursdayActivitiesListComputed ??= Computed<List<CardActivity>>(
              () => super.thursdayActivitiesList,
              name:
                  'AllActivitiesUserDashboardControllerBase.thursdayActivitiesList'))
          .value;
  Computed<List<CardActivity>>? _$fridayActivitiesListComputed;

  @override
  List<CardActivity> get fridayActivitiesList =>
      (_$fridayActivitiesListComputed ??= Computed<List<CardActivity>>(
              () => super.fridayActivitiesList,
              name:
                  'AllActivitiesUserDashboardControllerBase.fridayActivitiesList'))
          .value;
  Computed<List<CardActivity>>? _$saturdayActivitiesListComputed;

  @override
  List<CardActivity> get saturdayActivitiesList =>
      (_$saturdayActivitiesListComputed ??= Computed<List<CardActivity>>(
              () => super.saturdayActivitiesList,
              name:
                  'AllActivitiesUserDashboardControllerBase.saturdayActivitiesList'))
          .value;

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

  late final _$filterActivityChipIndexSelectedAtom = Atom(
      name:
          'AllActivitiesUserDashboardControllerBase.filterActivityChipIndexSelected',
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
      name: 'AllActivitiesUserDashboardControllerBase.weekActivitiesList',
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
      name: 'AllActivitiesUserDashboardControllerBase.activitiesList',
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
      name: 'AllActivitiesUserDashboardControllerBase.allActivitiesToCards',
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
      name: 'AllActivitiesUserDashboardControllerBase.activityType',
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

  late final _$getActivitiesByTypeAsyncAction = AsyncAction(
      'AllActivitiesUserDashboardControllerBase.getActivitiesByType',
      context: context);

  @override
  Future<dynamic> getActivitiesByType(ActivityEnum? typeActivity) {
    return _$getActivitiesByTypeAsyncAction
        .run(() => super.getActivitiesByType(typeActivity));
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
  void toggleFilterActivityChipIndex(dynamic index) {
    final _$actionInfo =
        _$AllActivitiesUserDashboardControllerBaseActionController.startAction(
            name:
                'AllActivitiesUserDashboardControllerBase.toggleFilterActivityChipIndex');
    try {
      return super.toggleFilterActivityChipIndex(index);
    } finally {
      _$AllActivitiesUserDashboardControllerBaseActionController
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
