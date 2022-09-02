// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adm_dashboard_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AdmDashboardController on AdmDashboardControllerBase, Store {
  Computed<List<CardActivity>>? _$mondayActivitiesListComputed;

  @override
  List<CardActivity> get mondayActivitiesList =>
      (_$mondayActivitiesListComputed ??= Computed<List<CardActivity>>(
              () => super.mondayActivitiesList,
              name: 'AdmDashboardControllerBase.mondayActivitiesList'))
          .value;
  Computed<List<CardActivity>>? _$tuesdayActivitiesListComputed;

  @override
  List<CardActivity> get tuesdayActivitiesList =>
      (_$tuesdayActivitiesListComputed ??= Computed<List<CardActivity>>(
              () => super.tuesdayActivitiesList,
              name: 'AdmDashboardControllerBase.tuesdayActivitiesList'))
          .value;
  Computed<List<CardActivity>>? _$wednesdayActivitiesListComputed;

  @override
  List<CardActivity> get wednesdayActivitiesList =>
      (_$wednesdayActivitiesListComputed ??= Computed<List<CardActivity>>(
              () => super.wednesdayActivitiesList,
              name: 'AdmDashboardControllerBase.wednesdayActivitiesList'))
          .value;
  Computed<List<CardActivity>>? _$thursdayActivitiesListComputed;

  @override
  List<CardActivity> get thursdayActivitiesList =>
      (_$thursdayActivitiesListComputed ??= Computed<List<CardActivity>>(
              () => super.thursdayActivitiesList,
              name: 'AdmDashboardControllerBase.thursdayActivitiesList'))
          .value;
  Computed<List<CardActivity>>? _$fridayActivitiesListComputed;

  @override
  List<CardActivity> get fridayActivitiesList =>
      (_$fridayActivitiesListComputed ??= Computed<List<CardActivity>>(
              () => super.fridayActivitiesList,
              name: 'AdmDashboardControllerBase.fridayActivitiesList'))
          .value;
  Computed<List<CardActivity>>? _$saturdayActivitiesListComputed;

  @override
  List<CardActivity> get saturdayActivitiesList =>
      (_$saturdayActivitiesListComputed ??= Computed<List<CardActivity>>(
              () => super.saturdayActivitiesList,
              name: 'AdmDashboardControllerBase.saturdayActivitiesList'))
          .value;
  Computed<List<CardActivity>>? _$sundayActivitiesListComputed;

  @override
  List<CardActivity> get sundayActivitiesList =>
      (_$sundayActivitiesListComputed ??= Computed<List<CardActivity>>(
              () => super.sundayActivitiesList,
              name: 'AdmDashboardControllerBase.sundayActivitiesList'))
          .value;

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

  late final _$saveActivitiesListAtom = Atom(
      name: 'AdmDashboardControllerBase.saveActivitiesList', context: context);

  @override
  List<ActivityModel> get saveActivitiesList {
    _$saveActivitiesListAtom.reportRead();
    return super.saveActivitiesList;
  }

  @override
  set saveActivitiesList(List<ActivityModel> value) {
    _$saveActivitiesListAtom.reportWrite(value, super.saveActivitiesList, () {
      super.saveActivitiesList = value;
    });
  }

  late final _$allActivitiesToCardsAtom = Atom(
      name: 'AdmDashboardControllerBase.allActivitiesToCards',
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

  late final _$nextActivitiesListAtom = Atom(
      name: 'AdmDashboardControllerBase.nextActivitiesList', context: context);

  @override
  List<CardActivity> get nextActivitiesList {
    _$nextActivitiesListAtom.reportRead();
    return super.nextActivitiesList;
  }

  @override
  set nextActivitiesList(List<CardActivity> value) {
    _$nextActivitiesListAtom.reportWrite(value, super.nextActivitiesList, () {
      super.nextActivitiesList = value;
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

  late final _$getActivitiesByTypeAsyncAction = AsyncAction(
      'AdmDashboardControllerBase.getActivitiesByType',
      context: context);

  @override
  Future<dynamic> getActivitiesByType(dynamic index) {
    return _$getActivitiesByTypeAsyncAction
        .run(() => super.getActivitiesByType(index));
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
  void toggleFilterActivityChipIndex(dynamic index) {
    final _$actionInfo =
        _$AdmDashboardControllerBaseActionController.startAction(
            name: 'AdmDashboardControllerBase.toggleFilterActivityChipIndex');
    try {
      return super.toggleFilterActivityChipIndex(index);
    } finally {
      _$AdmDashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeFormatToCards() {
    final _$actionInfo = _$AdmDashboardControllerBaseActionController
        .startAction(name: 'AdmDashboardControllerBase.changeFormatToCards');
    try {
      return super.changeFormatToCards();
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
saveActivitiesList: ${saveActivitiesList},
allActivitiesToCards: ${allActivitiesToCards},
nextActivitiesList: ${nextActivitiesList},
mondayActivitiesList: ${mondayActivitiesList},
tuesdayActivitiesList: ${tuesdayActivitiesList},
wednesdayActivitiesList: ${wednesdayActivitiesList},
thursdayActivitiesList: ${thursdayActivitiesList},
fridayActivitiesList: ${fridayActivitiesList},
saturdayActivitiesList: ${saturdayActivitiesList},
sundayActivitiesList: ${sundayActivitiesList}
    ''';
  }
}
