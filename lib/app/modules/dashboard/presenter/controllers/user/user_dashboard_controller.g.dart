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

  final _$userAtom = Atom(name: '_UserDashboardControllerBase.user');

  @override
  UserModel get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$userNameAtom = Atom(name: '_UserDashboardControllerBase.userName');

  @override
  String get userName {
    _$userNameAtom.reportRead();
    return super.userName;
  }

  @override
  set userName(String value) {
    _$userNameAtom.reportWrite(value, super.userName, () {
      super.userName = value;
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

  final _$setIsLoadingAsyncAction =
      AsyncAction('_UserDashboardControllerBase.setIsLoading');

  @override
  Future<void> setIsLoading(bool value) {
    return _$setIsLoadingAsyncAction.run(() => super.setIsLoading(value));
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
  void getUserFirstName() {
    final _$actionInfo = _$_UserDashboardControllerBaseActionController
        .startAction(name: '_UserDashboardControllerBase.getUserFirstName');
    try {
      return super.getUserFirstName();
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
isLoading: ${isLoading},
filterActivityChipIndexSelected: ${filterActivityChipIndexSelected},
subscribedActivitiesList: ${subscribedActivitiesList},
nextActivity: ${nextActivity},
cardNextActivity: ${cardNextActivity},
weekActivitiesList: ${weekActivitiesList},
user: ${user},
userName: ${userName},
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
