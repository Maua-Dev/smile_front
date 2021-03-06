// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dashboard_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserDashboardController on _UserDashboardControllerBase, Store {
  Computed<List<CardActivity>>? _$mondayActivitiesListComputed;

  @override
  List<CardActivity> get mondayActivitiesList =>
      (_$mondayActivitiesListComputed ??= Computed<List<CardActivity>>(
              () => super.mondayActivitiesList,
              name: '_UserDashboardControllerBase.mondayActivitiesList'))
          .value;
  Computed<List<CardActivity>>? _$tuesdayActivitiesListComputed;

  @override
  List<CardActivity> get tuesdayActivitiesList =>
      (_$tuesdayActivitiesListComputed ??= Computed<List<CardActivity>>(
              () => super.tuesdayActivitiesList,
              name: '_UserDashboardControllerBase.tuesdayActivitiesList'))
          .value;
  Computed<List<CardActivity>>? _$wednesdayActivitiesListComputed;

  @override
  List<CardActivity> get wednesdayActivitiesList =>
      (_$wednesdayActivitiesListComputed ??= Computed<List<CardActivity>>(
              () => super.wednesdayActivitiesList,
              name: '_UserDashboardControllerBase.wednesdayActivitiesList'))
          .value;
  Computed<List<CardActivity>>? _$thursdayActivitiesListComputed;

  @override
  List<CardActivity> get thursdayActivitiesList =>
      (_$thursdayActivitiesListComputed ??= Computed<List<CardActivity>>(
              () => super.thursdayActivitiesList,
              name: '_UserDashboardControllerBase.thursdayActivitiesList'))
          .value;
  Computed<List<CardActivity>>? _$fridayActivitiesListComputed;

  @override
  List<CardActivity> get fridayActivitiesList =>
      (_$fridayActivitiesListComputed ??= Computed<List<CardActivity>>(
              () => super.fridayActivitiesList,
              name: '_UserDashboardControllerBase.fridayActivitiesList'))
          .value;
  Computed<List<CardActivity>>? _$saturdayActivitiesListComputed;

  @override
  List<CardActivity> get saturdayActivitiesList =>
      (_$saturdayActivitiesListComputed ??= Computed<List<CardActivity>>(
              () => super.saturdayActivitiesList,
              name: '_UserDashboardControllerBase.saturdayActivitiesList'))
          .value;

  late final _$errorAtom =
      Atom(name: '_UserDashboardControllerBase.error', context: context);

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
      Atom(name: '_UserDashboardControllerBase.socialName', context: context);

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
      Atom(name: '_UserDashboardControllerBase.name', context: context);

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
      name: '_UserDashboardControllerBase.certificateWithSocialName',
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
      name: '_UserDashboardControllerBase.socialNameToChange',
      context: context);

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
      Atom(name: '_UserDashboardControllerBase.nameToChange', context: context);

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
      name: '_UserDashboardControllerBase.wantSocialName', context: context);

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

  late final _$isLoadingAtom =
      Atom(name: '_UserDashboardControllerBase.isLoading', context: context);

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
      name: '_UserDashboardControllerBase.filterActivityChipIndexSelected',
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

  late final _$subscribedActivitiesListAtom = Atom(
      name: '_UserDashboardControllerBase.subscribedActivitiesList',
      context: context);

  @override
  List<ActivityModel> get subscribedActivitiesList {
    _$subscribedActivitiesListAtom.reportRead();
    return super.subscribedActivitiesList;
  }

  @override
  set subscribedActivitiesList(List<ActivityModel> value) {
    _$subscribedActivitiesListAtom
        .reportWrite(value, super.subscribedActivitiesList, () {
      super.subscribedActivitiesList = value;
    });
  }

  late final _$nextActivityAtom =
      Atom(name: '_UserDashboardControllerBase.nextActivity', context: context);

  @override
  ActivityModel get nextActivity {
    _$nextActivityAtom.reportRead();
    return super.nextActivity;
  }

  @override
  set nextActivity(ActivityModel value) {
    _$nextActivityAtom.reportWrite(value, super.nextActivity, () {
      super.nextActivity = value;
    });
  }

  late final _$cardNextActivityAtom = Atom(
      name: '_UserDashboardControllerBase.cardNextActivity', context: context);

  @override
  CardActivity get cardNextActivity {
    _$cardNextActivityAtom.reportRead();
    return super.cardNextActivity;
  }

  @override
  set cardNextActivity(CardActivity value) {
    _$cardNextActivityAtom.reportWrite(value, super.cardNextActivity, () {
      super.cardNextActivity = value;
    });
  }

  late final _$weekActivitiesListAtom = Atom(
      name: '_UserDashboardControllerBase.weekActivitiesList',
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

  late final _$allActivitiesToCardsAtom = Atom(
      name: '_UserDashboardControllerBase.allActivitiesToCards',
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

  late final _$getCertificateWithSocialNameAsyncAction = AsyncAction(
      '_UserDashboardControllerBase.getCertificateWithSocialName',
      context: context);

  @override
  Future<void> getCertificateWithSocialName() {
    return _$getCertificateWithSocialNameAsyncAction
        .run(() => super.getCertificateWithSocialName());
  }

  late final _$getUserNameAsyncAction =
      AsyncAction('_UserDashboardControllerBase.getUserName', context: context);

  @override
  Future<void> getUserName() {
    return _$getUserNameAsyncAction.run(() => super.getUserName());
  }

  late final _$getUserSocialNameAsyncAction = AsyncAction(
      '_UserDashboardControllerBase.getUserSocialName',
      context: context);

  @override
  Future<void> getUserSocialName() {
    return _$getUserSocialNameAsyncAction.run(() => super.getUserSocialName());
  }

  late final _$setWantSocialNameAsyncAction = AsyncAction(
      '_UserDashboardControllerBase.setWantSocialName',
      context: context);

  @override
  Future<void> setWantSocialName(bool? value) {
    return _$setWantSocialNameAsyncAction
        .run(() => super.setWantSocialName(value));
  }

  late final _$changeDataAsyncAction =
      AsyncAction('_UserDashboardControllerBase.changeData', context: context);

  @override
  Future<void> changeData() {
    return _$changeDataAsyncAction.run(() => super.changeData());
  }

  late final _$setIsLoadingAsyncAction = AsyncAction(
      '_UserDashboardControllerBase.setIsLoading',
      context: context);

  @override
  Future<void> setIsLoading(bool value) {
    return _$setIsLoadingAsyncAction.run(() => super.setIsLoading(value));
  }

  late final _$getActivitiesAsyncAction = AsyncAction(
      '_UserDashboardControllerBase.getActivities',
      context: context);

  @override
  Future<dynamic> getActivities() {
    return _$getActivitiesAsyncAction.run(() => super.getActivities());
  }

  late final _$getUserSubscribedActivitiesAsyncAction = AsyncAction(
      '_UserDashboardControllerBase.getUserSubscribedActivities',
      context: context);

  @override
  Future<dynamic> getUserSubscribedActivities() {
    return _$getUserSubscribedActivitiesAsyncAction
        .run(() => super.getUserSubscribedActivities());
  }

  late final _$_UserDashboardControllerBaseActionController =
      ActionController(name: '_UserDashboardControllerBase', context: context);

  @override
  void setName(String value) {
    final _$actionInfo = _$_UserDashboardControllerBaseActionController
        .startAction(name: '_UserDashboardControllerBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_UserDashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUserSocialName(String value) {
    final _$actionInfo = _$_UserDashboardControllerBaseActionController
        .startAction(name: '_UserDashboardControllerBase.setUserSocialName');
    try {
      return super.setUserSocialName(value);
    } finally {
      _$_UserDashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCertificateWithSocialName(bool value) {
    final _$actionInfo =
        _$_UserDashboardControllerBaseActionController.startAction(
            name: '_UserDashboardControllerBase.setCertificateWithSocialName');
    try {
      return super.setCertificateWithSocialName(value);
    } finally {
      _$_UserDashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validateName() {
    final _$actionInfo = _$_UserDashboardControllerBaseActionController
        .startAction(name: '_UserDashboardControllerBase.validateName');
    try {
      return super.validateName();
    } finally {
      _$_UserDashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool validateSocialName() {
    final _$actionInfo = _$_UserDashboardControllerBaseActionController
        .startAction(name: '_UserDashboardControllerBase.validateSocialName');
    try {
      return super.validateSocialName();
    } finally {
      _$_UserDashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getNextActivity() {
    final _$actionInfo = _$_UserDashboardControllerBaseActionController
        .startAction(name: '_UserDashboardControllerBase.getNextActivity');
    try {
      return super.getNextActivity();
    } finally {
      _$_UserDashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleFilterActivityChipIndex(dynamic index) {
    final _$actionInfo =
        _$_UserDashboardControllerBaseActionController.startAction(
            name: '_UserDashboardControllerBase.toggleFilterActivityChipIndex');
    try {
      return super.toggleFilterActivityChipIndex(index);
    } finally {
      _$_UserDashboardControllerBaseActionController.endAction(_$actionInfo);
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
isLoading: ${isLoading},
filterActivityChipIndexSelected: ${filterActivityChipIndexSelected},
subscribedActivitiesList: ${subscribedActivitiesList},
nextActivity: ${nextActivity},
cardNextActivity: ${cardNextActivity},
weekActivitiesList: ${weekActivitiesList},
allActivitiesToCards: ${allActivitiesToCards},
mondayActivitiesList: ${mondayActivitiesList},
tuesdayActivitiesList: ${tuesdayActivitiesList},
wednesdayActivitiesList: ${wednesdayActivitiesList},
thursdayActivitiesList: ${thursdayActivitiesList},
fridayActivitiesList: ${fridayActivitiesList},
saturdayActivitiesList: ${saturdayActivitiesList}
    ''';
  }
}
