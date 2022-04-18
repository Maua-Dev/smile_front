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

  final _$errorAtom = Atom(name: '_UserDashboardControllerBase.error');

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

  final _$socialNameAtom =
      Atom(name: '_UserDashboardControllerBase.socialName');

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

  final _$nameAtom = Atom(name: '_UserDashboardControllerBase.name');

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

  final _$certificateWithSocialNameAtom =
      Atom(name: '_UserDashboardControllerBase.certificateWithSocialName');

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

  final _$socialNameToChangeAtom =
      Atom(name: '_UserDashboardControllerBase.socialNameToChange');

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

  final _$nameToChangeAtom =
      Atom(name: '_UserDashboardControllerBase.nameToChange');

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

  final _$wantSocialNameAtom =
      Atom(name: '_UserDashboardControllerBase.wantSocialName');

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

  final _$isLoadingAtom = Atom(name: '_UserDashboardControllerBase.isLoading');

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

  final _$filterActivityChipIndexSelectedAtom = Atom(
      name: '_UserDashboardControllerBase.filterActivityChipIndexSelected');

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

  final _$subscribedActivitiesListAtom =
      Atom(name: '_UserDashboardControllerBase.subscribedActivitiesList');

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

  final _$nextActivityAtom =
      Atom(name: '_UserDashboardControllerBase.nextActivity');

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

  final _$cardNextActivityAtom =
      Atom(name: '_UserDashboardControllerBase.cardNextActivity');

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

  final _$weekActivitiesListAtom =
      Atom(name: '_UserDashboardControllerBase.weekActivitiesList');

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

  final _$allActivitiesToCardsAtom =
      Atom(name: '_UserDashboardControllerBase.allActivitiesToCards');

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

  final _$getCertificateWithSocialNameAsyncAction =
      AsyncAction('_UserDashboardControllerBase.getCertificateWithSocialName');

  @override
  Future<void> getCertificateWithSocialName() {
    return _$getCertificateWithSocialNameAsyncAction
        .run(() => super.getCertificateWithSocialName());
  }

  final _$getUserNameAsyncAction =
      AsyncAction('_UserDashboardControllerBase.getUserName');

  @override
  Future<void> getUserName() {
    return _$getUserNameAsyncAction.run(() => super.getUserName());
  }

  final _$getUserSocialNameAsyncAction =
      AsyncAction('_UserDashboardControllerBase.getUserSocialName');

  @override
  Future<void> getUserSocialName() {
    return _$getUserSocialNameAsyncAction.run(() => super.getUserSocialName());
  }

  final _$setWantSocialNameAsyncAction =
      AsyncAction('_UserDashboardControllerBase.setWantSocialName');

  @override
  Future<void> setWantSocialName(bool? value) {
    return _$setWantSocialNameAsyncAction
        .run(() => super.setWantSocialName(value));
  }

  final _$changeDataAsyncAction =
      AsyncAction('_UserDashboardControllerBase.changeData');

  @override
  Future<void> changeData() {
    return _$changeDataAsyncAction.run(() => super.changeData());
  }

  final _$setIsLoadingAsyncAction =
      AsyncAction('_UserDashboardControllerBase.setIsLoading');

  @override
  Future<void> setIsLoading(bool value) {
    return _$setIsLoadingAsyncAction.run(() => super.setIsLoading(value));
  }

  final _$getActivitiesAsyncAction =
      AsyncAction('_UserDashboardControllerBase.getActivities');

  @override
  Future<dynamic> getActivities() {
    return _$getActivitiesAsyncAction.run(() => super.getActivities());
  }

  final _$getUserSubscribedActivitiesAsyncAction =
      AsyncAction('_UserDashboardControllerBase.getUserSubscribedActivities');

  @override
  Future<dynamic> getUserSubscribedActivities() {
    return _$getUserSubscribedActivitiesAsyncAction
        .run(() => super.getUserSubscribedActivities());
  }

  final _$_UserDashboardControllerBaseActionController =
      ActionController(name: '_UserDashboardControllerBase');

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
