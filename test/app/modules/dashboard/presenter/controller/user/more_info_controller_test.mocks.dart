// Mocks generated by Mockito 5.1.0 from annotations
// in smile_front/test/app/modules/dashboard/presenter/controller/user/more_info_controller_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i9;

import 'package:mobx/mobx.dart' as _i8;
import 'package:mockito/mockito.dart' as _i1;
import 'package:smile_front/app/modules/auth/domain/repositories/secure_storage_interface.dart'
    as _i4;
import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart'
    as _i2;
import 'package:smile_front/app/modules/dashboard/domain/repositories/user_repository_interface.dart'
    as _i3;
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/user_dashboard_controller.dart'
    as _i10;
import 'package:smile_front/app/shared/entities/card_activity.dart' as _i7;
import 'package:smile_front/app/shared/models/activity_model.dart' as _i6;
import 'package:smile_front/app/shared/services/firebase-analytics/firebase_analytics_service.dart'
    as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeActivitiesRepositoryInterface_0 extends _i1.Fake
    implements _i2.ActivitiesRepositoryInterface {}

class _FakeUserRepositoryInterface_1 extends _i1.Fake
    implements _i3.UserRepositoryInterface {}

class _FakeSecureStorageInterface_2 extends _i1.Fake
    implements _i4.SecureStorageInterface {}

class _FakeFirebaseAnalyticsService_3 extends _i1.Fake
    implements _i5.FirebaseAnalyticsService {}

class _FakeActivityModel_4 extends _i1.Fake implements _i6.ActivityModel {}

class _FakeCardActivity_5 extends _i1.Fake implements _i7.CardActivity {}

class _FakeReactiveContext_6 extends _i1.Fake implements _i8.ReactiveContext {}

/// A class which mocks [ActivitiesRepositoryInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockActivitiesRepositoryInterface extends _i1.Mock
    implements _i2.ActivitiesRepositoryInterface {
  MockActivitiesRepositoryInterface() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<List<_i6.ActivityModel>> getAllActivities() =>
      (super.noSuchMethod(Invocation.method(#getAllActivities, []),
              returnValue:
                  Future<List<_i6.ActivityModel>>.value(<_i6.ActivityModel>[]))
          as _i9.Future<List<_i6.ActivityModel>>);
  @override
  _i9.Future<List<_i6.ActivityModel>> getUserSubscribedActivities() =>
      (super.noSuchMethod(Invocation.method(#getUserSubscribedActivities, []),
              returnValue:
                  Future<List<_i6.ActivityModel>>.value(<_i6.ActivityModel>[]))
          as _i9.Future<List<_i6.ActivityModel>>);
  @override
  _i9.Future<String> getDownloadLinkCsv() =>
      (super.noSuchMethod(Invocation.method(#getDownloadLinkCsv, []),
          returnValue: Future<String>.value('')) as _i9.Future<String>);
  @override
  _i9.Future<dynamic> createActivity(_i6.ActivityModel? activityToCreate) =>
      (super.noSuchMethod(
          Invocation.method(#createActivity, [activityToCreate]),
          returnValue: Future<dynamic>.value()) as _i9.Future<dynamic>);
  @override
  _i9.Future<dynamic> editActivity(_i6.ActivityModel? activityToEdit) =>
      (super.noSuchMethod(Invocation.method(#editActivity, [activityToEdit]),
          returnValue: Future<dynamic>.value()) as _i9.Future<dynamic>);
  @override
  _i9.Future<dynamic> removeActivity(String? id) =>
      (super.noSuchMethod(Invocation.method(#removeActivity, [id]),
          returnValue: Future<dynamic>.value()) as _i9.Future<dynamic>);
  @override
  _i9.Future<bool> subscribeActivity(_i6.ActivityModel? activity,
          String? activityId, DateTime? activityDate) =>
      (super.noSuchMethod(
          Invocation.method(
              #subscribeActivity, [activity, activityId, activityDate]),
          returnValue: Future<bool>.value(false)) as _i9.Future<bool>);
  @override
  _i9.Future<bool> unsubscribeActivity(
          String? activityId, DateTime? activityDate) =>
      (super.noSuchMethod(
          Invocation.method(#unsubscribeActivity, [activityId, activityDate]),
          returnValue: Future<bool>.value(false)) as _i9.Future<bool>);
}

/// A class which mocks [UserDashboardController].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserDashboardController extends _i1.Mock
    implements _i10.UserDashboardController {
  MockUserDashboardController() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.ActivitiesRepositoryInterface get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
              returnValue: _FakeActivitiesRepositoryInterface_0())
          as _i2.ActivitiesRepositoryInterface);
  @override
  _i3.UserRepositoryInterface get userRepository =>
      (super.noSuchMethod(Invocation.getter(#userRepository),
              returnValue: _FakeUserRepositoryInterface_1())
          as _i3.UserRepositoryInterface);
  @override
  _i4.SecureStorageInterface get secureStorage =>
      (super.noSuchMethod(Invocation.getter(#secureStorage),
              returnValue: _FakeSecureStorageInterface_2())
          as _i4.SecureStorageInterface);
  @override
  _i5.FirebaseAnalyticsService get analytics =>
      (super.noSuchMethod(Invocation.getter(#analytics),
              returnValue: _FakeFirebaseAnalyticsService_3())
          as _i5.FirebaseAnalyticsService);
  @override
  set error(String? _error) =>
      super.noSuchMethod(Invocation.setter(#error, _error),
          returnValueForMissingStub: null);
  @override
  set socialName(String? _socialName) =>
      super.noSuchMethod(Invocation.setter(#socialName, _socialName),
          returnValueForMissingStub: null);
  @override
  set name(String? _name) => super.noSuchMethod(Invocation.setter(#name, _name),
      returnValueForMissingStub: null);
  @override
  bool get certificateWithSocialName =>
      (super.noSuchMethod(Invocation.getter(#certificateWithSocialName),
          returnValue: false) as bool);
  @override
  set certificateWithSocialName(bool? _certificateWithSocialName) =>
      super.noSuchMethod(
          Invocation.setter(
              #certificateWithSocialName, _certificateWithSocialName),
          returnValueForMissingStub: null);
  @override
  String get socialNameToChange => (super
          .noSuchMethod(Invocation.getter(#socialNameToChange), returnValue: '')
      as String);
  @override
  set socialNameToChange(String? _socialNameToChange) => super.noSuchMethod(
      Invocation.setter(#socialNameToChange, _socialNameToChange),
      returnValueForMissingStub: null);
  @override
  String get nameToChange =>
      (super.noSuchMethod(Invocation.getter(#nameToChange), returnValue: '')
          as String);
  @override
  set nameToChange(String? _nameToChange) =>
      super.noSuchMethod(Invocation.setter(#nameToChange, _nameToChange),
          returnValueForMissingStub: null);
  @override
  bool get wantSocialName => (super
          .noSuchMethod(Invocation.getter(#wantSocialName), returnValue: false)
      as bool);
  @override
  set wantSocialName(bool? _wantSocialName) =>
      super.noSuchMethod(Invocation.setter(#wantSocialName, _wantSocialName),
          returnValueForMissingStub: null);
  @override
  bool get isLoading =>
      (super.noSuchMethod(Invocation.getter(#isLoading), returnValue: false)
          as bool);
  @override
  set isLoading(bool? _isLoading) =>
      super.noSuchMethod(Invocation.setter(#isLoading, _isLoading),
          returnValueForMissingStub: null);
  @override
  int get filterActivityChipIndexSelected =>
      (super.noSuchMethod(Invocation.getter(#filterActivityChipIndexSelected),
          returnValue: 0) as int);
  @override
  set filterActivityChipIndexSelected(int? _filterActivityChipIndexSelected) =>
      super.noSuchMethod(
          Invocation.setter(#filterActivityChipIndexSelected,
              _filterActivityChipIndexSelected),
          returnValueForMissingStub: null);
  @override
  List<_i6.ActivityModel> get subscribedActivitiesList =>
      (super.noSuchMethod(Invocation.getter(#subscribedActivitiesList),
          returnValue: <_i6.ActivityModel>[]) as List<_i6.ActivityModel>);
  @override
  set subscribedActivitiesList(
          List<_i6.ActivityModel>? _subscribedActivitiesList) =>
      super.noSuchMethod(
          Invocation.setter(
              #subscribedActivitiesList, _subscribedActivitiesList),
          returnValueForMissingStub: null);
  @override
  _i6.ActivityModel get nextActivity =>
      (super.noSuchMethod(Invocation.getter(#nextActivity),
          returnValue: _FakeActivityModel_4()) as _i6.ActivityModel);
  @override
  set nextActivity(_i6.ActivityModel? _nextActivity) =>
      super.noSuchMethod(Invocation.setter(#nextActivity, _nextActivity),
          returnValueForMissingStub: null);
  @override
  _i7.CardActivity get cardNextActivity =>
      (super.noSuchMethod(Invocation.getter(#cardNextActivity),
          returnValue: _FakeCardActivity_5()) as _i7.CardActivity);
  @override
  set cardNextActivity(_i7.CardActivity? _cardNextActivity) => super
      .noSuchMethod(Invocation.setter(#cardNextActivity, _cardNextActivity),
          returnValueForMissingStub: null);
  @override
  List<_i7.CardActivity> get weekActivitiesList =>
      (super.noSuchMethod(Invocation.getter(#weekActivitiesList),
          returnValue: <_i7.CardActivity>[]) as List<_i7.CardActivity>);
  @override
  set weekActivitiesList(List<_i7.CardActivity>? _weekActivitiesList) => super
      .noSuchMethod(Invocation.setter(#weekActivitiesList, _weekActivitiesList),
          returnValueForMissingStub: null);
  @override
  List<_i7.CardActivity> get allActivitiesToCards =>
      (super.noSuchMethod(Invocation.getter(#allActivitiesToCards),
          returnValue: <_i7.CardActivity>[]) as List<_i7.CardActivity>);
  @override
  set allActivitiesToCards(List<_i7.CardActivity>? _allActivitiesToCards) =>
      super.noSuchMethod(
          Invocation.setter(#allActivitiesToCards, _allActivitiesToCards),
          returnValueForMissingStub: null);
  @override
  List<_i7.CardActivity> get mondayActivitiesList =>
      (super.noSuchMethod(Invocation.getter(#mondayActivitiesList),
          returnValue: <_i7.CardActivity>[]) as List<_i7.CardActivity>);
  @override
  List<_i7.CardActivity> get tuesdayActivitiesList =>
      (super.noSuchMethod(Invocation.getter(#tuesdayActivitiesList),
          returnValue: <_i7.CardActivity>[]) as List<_i7.CardActivity>);
  @override
  List<_i7.CardActivity> get wednesdayActivitiesList =>
      (super.noSuchMethod(Invocation.getter(#wednesdayActivitiesList),
          returnValue: <_i7.CardActivity>[]) as List<_i7.CardActivity>);
  @override
  List<_i7.CardActivity> get thursdayActivitiesList =>
      (super.noSuchMethod(Invocation.getter(#thursdayActivitiesList),
          returnValue: <_i7.CardActivity>[]) as List<_i7.CardActivity>);
  @override
  List<_i7.CardActivity> get fridayActivitiesList =>
      (super.noSuchMethod(Invocation.getter(#fridayActivitiesList),
          returnValue: <_i7.CardActivity>[]) as List<_i7.CardActivity>);
  @override
  List<_i7.CardActivity> get saturdayActivitiesList =>
      (super.noSuchMethod(Invocation.getter(#saturdayActivitiesList),
          returnValue: <_i7.CardActivity>[]) as List<_i7.CardActivity>);
  @override
  _i8.ReactiveContext get context =>
      (super.noSuchMethod(Invocation.getter(#context),
          returnValue: _FakeReactiveContext_6()) as _i8.ReactiveContext);
  @override
  _i9.Future<void> getCertificateWithSocialName() =>
      (super.noSuchMethod(Invocation.method(#getCertificateWithSocialName, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i9.Future<void>);
  @override
  _i9.Future<void> getUserName() =>
      (super.noSuchMethod(Invocation.method(#getUserName, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i9.Future<void>);
  @override
  _i9.Future<void> getUserSocialName() =>
      (super.noSuchMethod(Invocation.method(#getUserSocialName, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i9.Future<void>);
  @override
  _i9.Future<void> setWantSocialName(bool? value) =>
      (super.noSuchMethod(Invocation.method(#setWantSocialName, [value]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i9.Future<void>);
  @override
  void setName(String? value) =>
      super.noSuchMethod(Invocation.method(#setName, [value]),
          returnValueForMissingStub: null);
  @override
  void setUserSocialName(String? value) =>
      super.noSuchMethod(Invocation.method(#setUserSocialName, [value]),
          returnValueForMissingStub: null);
  @override
  void setCertificateWithSocialName(bool? value) => super.noSuchMethod(
      Invocation.method(#setCertificateWithSocialName, [value]),
      returnValueForMissingStub: null);
  @override
  _i9.Future<void> changeData() =>
      (super.noSuchMethod(Invocation.method(#changeData, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i9.Future<void>);
  @override
  bool validateName() =>
      (super.noSuchMethod(Invocation.method(#validateName, []),
          returnValue: false) as bool);
  @override
  bool validateSocialName() =>
      (super.noSuchMethod(Invocation.method(#validateSocialName, []),
          returnValue: false) as bool);
  @override
  _i9.Future<void> setIsLoading(bool? value) =>
      (super.noSuchMethod(Invocation.method(#setIsLoading, [value]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i9.Future<void>);
  @override
  _i9.Future<dynamic> getActivities() =>
      (super.noSuchMethod(Invocation.method(#getActivities, []),
          returnValue: Future<dynamic>.value()) as _i9.Future<dynamic>);
  @override
  _i9.Future<dynamic> getUserSubscribedActivities() =>
      (super.noSuchMethod(Invocation.method(#getUserSubscribedActivities, []),
          returnValue: Future<dynamic>.value()) as _i9.Future<dynamic>);
  @override
  void getNextActivity() =>
      super.noSuchMethod(Invocation.method(#getNextActivity, []),
          returnValueForMissingStub: null);
  @override
  void toggleFilterActivityChipIndex(dynamic index) => super.noSuchMethod(
      Invocation.method(#toggleFilterActivityChipIndex, [index]),
      returnValueForMissingStub: null);
}
