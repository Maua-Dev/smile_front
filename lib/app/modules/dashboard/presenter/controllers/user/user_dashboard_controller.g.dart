// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dashboard_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserDashboardController on _UserDashboardControllerBase, Store {
  Computed<List<ActivityModel>>? _$mondayActivitiesListComputed;

  @override
  List<ActivityModel> get mondayActivitiesList =>
      (_$mondayActivitiesListComputed ??= Computed<List<ActivityModel>>(
              () => super.mondayActivitiesList,
              name: '_UserDashboardControllerBase.mondayActivitiesList'))
          .value;
  Computed<List<ActivityModel>>? _$tuesdayActivitiesListComputed;

  @override
  List<ActivityModel> get tuesdayActivitiesList =>
      (_$tuesdayActivitiesListComputed ??= Computed<List<ActivityModel>>(
              () => super.tuesdayActivitiesList,
              name: '_UserDashboardControllerBase.tuesdayActivitiesList'))
          .value;
  Computed<List<ActivityModel>>? _$wednesdayActivitiesListComputed;

  @override
  List<ActivityModel> get wednesdayActivitiesList =>
      (_$wednesdayActivitiesListComputed ??= Computed<List<ActivityModel>>(
              () => super.wednesdayActivitiesList,
              name: '_UserDashboardControllerBase.wednesdayActivitiesList'))
          .value;
  Computed<List<ActivityModel>>? _$thursdayActivitiesListComputed;

  @override
  List<ActivityModel> get thursdayActivitiesList =>
      (_$thursdayActivitiesListComputed ??= Computed<List<ActivityModel>>(
              () => super.thursdayActivitiesList,
              name: '_UserDashboardControllerBase.thursdayActivitiesList'))
          .value;
  Computed<List<ActivityModel>>? _$fridayActivitiesListComputed;

  @override
  List<ActivityModel> get fridayActivitiesList =>
      (_$fridayActivitiesListComputed ??= Computed<List<ActivityModel>>(
              () => super.fridayActivitiesList,
              name: '_UserDashboardControllerBase.fridayActivitiesList'))
          .value;

  final _$activitiesListAtom =
      Atom(name: '_UserDashboardControllerBase.activitiesList');

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

  final _$getUserSubscribedActivitiesAsyncAction =
      AsyncAction('_UserDashboardControllerBase.getUserSubscribedActivities');

  @override
  Future<dynamic> getUserSubscribedActivities() {
    return _$getUserSubscribedActivitiesAsyncAction
        .run(() => super.getUserSubscribedActivities());
  }

  final _$getUserAsyncAction =
      AsyncAction('_UserDashboardControllerBase.getUser');

  @override
  Future<dynamic> getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  final _$logoutAsyncAction =
      AsyncAction('_UserDashboardControllerBase.logout');

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  final _$_UserDashboardControllerBaseActionController =
      ActionController(name: '_UserDashboardControllerBase');

  @override
  void getUserName() {
    final _$actionInfo = _$_UserDashboardControllerBaseActionController
        .startAction(name: '_UserDashboardControllerBase.getUserName');
    try {
      return super.getUserName();
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
  String toString() {
    return '''
activitiesList: ${activitiesList},
nextActivity: ${nextActivity},
user: ${user},
userName: ${userName},
mondayActivitiesList: ${mondayActivitiesList},
tuesdayActivitiesList: ${tuesdayActivitiesList},
wednesdayActivitiesList: ${wednesdayActivitiesList},
thursdayActivitiesList: ${thursdayActivitiesList},
fridayActivitiesList: ${fridayActivitiesList}
    ''';
  }
}
