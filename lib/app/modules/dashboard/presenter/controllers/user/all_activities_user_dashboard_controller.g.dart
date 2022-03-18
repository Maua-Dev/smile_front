// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_activities_user_dashboard_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AllActivitiesUserDashboardController
    on _AllActivitiesUserDashboardControllerBase, Store {
  Computed<List<ActivityModel>>? _$mondayActivitiesListComputed;

  @override
  List<ActivityModel> get mondayActivitiesList =>
      (_$mondayActivitiesListComputed ??= Computed<List<ActivityModel>>(
              () => super.mondayActivitiesList,
              name:
                  '_AllActivitiesUserDashboardControllerBase.mondayActivitiesList'))
          .value;
  Computed<List<ActivityModel>>? _$tuesdayActivitiesListComputed;

  @override
  List<ActivityModel> get tuesdayActivitiesList =>
      (_$tuesdayActivitiesListComputed ??= Computed<List<ActivityModel>>(
              () => super.tuesdayActivitiesList,
              name:
                  '_AllActivitiesUserDashboardControllerBase.tuesdayActivitiesList'))
          .value;
  Computed<List<ActivityModel>>? _$wednesdayActivitiesListComputed;

  @override
  List<ActivityModel> get wednesdayActivitiesList =>
      (_$wednesdayActivitiesListComputed ??= Computed<List<ActivityModel>>(
              () => super.wednesdayActivitiesList,
              name:
                  '_AllActivitiesUserDashboardControllerBase.wednesdayActivitiesList'))
          .value;
  Computed<List<ActivityModel>>? _$thursdayActivitiesListComputed;

  @override
  List<ActivityModel> get thursdayActivitiesList =>
      (_$thursdayActivitiesListComputed ??= Computed<List<ActivityModel>>(
              () => super.thursdayActivitiesList,
              name:
                  '_AllActivitiesUserDashboardControllerBase.thursdayActivitiesList'))
          .value;
  Computed<List<ActivityModel>>? _$fridayActivitiesListComputed;

  @override
  List<ActivityModel> get fridayActivitiesList =>
      (_$fridayActivitiesListComputed ??= Computed<List<ActivityModel>>(
              () => super.fridayActivitiesList,
              name:
                  '_AllActivitiesUserDashboardControllerBase.fridayActivitiesList'))
          .value;

  final _$isFloatActionButtonOpenAtom = Atom(
      name:
          '_AllActivitiesUserDashboardControllerBase.isFloatActionButtonOpen');

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

  final _$filterActivityChipIndexSelectedAtom = Atom(
      name:
          '_AllActivitiesUserDashboardControllerBase.filterActivityChipIndexSelected');

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

  final _$activitiesListAtom =
      Atom(name: '_AllActivitiesUserDashboardControllerBase.activitiesList');

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

  final _$nextActivitiesListAtom = Atom(
      name: '_AllActivitiesUserDashboardControllerBase.nextActivitiesList');

  @override
  List<ActivityModel> get nextActivitiesList {
    _$nextActivitiesListAtom.reportRead();
    return super.nextActivitiesList;
  }

  @override
  set nextActivitiesList(List<ActivityModel> value) {
    _$nextActivitiesListAtom.reportWrite(value, super.nextActivitiesList, () {
      super.nextActivitiesList = value;
    });
  }

  final _$getActivitiesByTypeAsyncAction = AsyncAction(
      '_AllActivitiesUserDashboardControllerBase.getActivitiesByType');

  @override
  Future<dynamic> getActivitiesByType(dynamic index) {
    return _$getActivitiesByTypeAsyncAction
        .run(() => super.getActivitiesByType(index));
  }

  final _$getAllActivitiesAsyncAction =
      AsyncAction('_AllActivitiesUserDashboardControllerBase.getAllActivities');

  @override
  Future<dynamic> getAllActivities() {
    return _$getAllActivitiesAsyncAction.run(() => super.getAllActivities());
  }

  final _$logoutAsyncAction =
      AsyncAction('_AllActivitiesUserDashboardControllerBase.logout');

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  final _$_AllActivitiesUserDashboardControllerBaseActionController =
      ActionController(name: '_AllActivitiesUserDashboardControllerBase');

  @override
  void toggleFloatActionButton() {
    final _$actionInfo =
        _$_AllActivitiesUserDashboardControllerBaseActionController.startAction(
            name:
                '_AllActivitiesUserDashboardControllerBase.toggleFloatActionButton');
    try {
      return super.toggleFloatActionButton();
    } finally {
      _$_AllActivitiesUserDashboardControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

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
  void searchActivityByName(String search) {
    final _$actionInfo =
        _$_AllActivitiesUserDashboardControllerBaseActionController.startAction(
            name:
                '_AllActivitiesUserDashboardControllerBase.searchActivityByName');
    try {
      return super.searchActivityByName(search);
    } finally {
      _$_AllActivitiesUserDashboardControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isFloatActionButtonOpen: ${isFloatActionButtonOpen},
filterActivityChipIndexSelected: ${filterActivityChipIndexSelected},
activitiesList: ${activitiesList},
nextActivitiesList: ${nextActivitiesList},
mondayActivitiesList: ${mondayActivitiesList},
tuesdayActivitiesList: ${tuesdayActivitiesList},
wednesdayActivitiesList: ${wednesdayActivitiesList},
thursdayActivitiesList: ${thursdayActivitiesList},
fridayActivitiesList: ${fridayActivitiesList}
    ''';
  }
}
