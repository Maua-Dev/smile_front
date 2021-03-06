// Mocks generated by Mockito 5.1.0 from annotations
// in smile_front/test/app/modules/login/presenter/controller/login_controller_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:firebase_analytics/firebase_analytics.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart'
    as _i3;
import 'package:smile_front/app/shared/models/activity_model.dart' as _i5;
import 'package:smile_front/app/shared/services/firebase-analytics/firebase_analytics_service.dart'
    as _i6;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeFirebaseAnalytics_0 extends _i1.Fake
    implements _i2.FirebaseAnalytics {}

class _FakeFirebaseAnalyticsObserver_1 extends _i1.Fake
    implements _i2.FirebaseAnalyticsObserver {}

/// A class which mocks [ActivitiesRepositoryInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockActivitiesRepositoryInterface extends _i1.Mock
    implements _i3.ActivitiesRepositoryInterface {
  MockActivitiesRepositoryInterface() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<List<_i5.ActivityModel>> getAllActivities() =>
      (super.noSuchMethod(Invocation.method(#getAllActivities, []),
              returnValue:
                  Future<List<_i5.ActivityModel>>.value(<_i5.ActivityModel>[]))
          as _i4.Future<List<_i5.ActivityModel>>);
  @override
  _i4.Future<List<_i5.ActivityModel>> getUserSubscribedActivities() =>
      (super.noSuchMethod(Invocation.method(#getUserSubscribedActivities, []),
              returnValue:
                  Future<List<_i5.ActivityModel>>.value(<_i5.ActivityModel>[]))
          as _i4.Future<List<_i5.ActivityModel>>);
  @override
  _i4.Future<String> getDownloadLinkCsv() =>
      (super.noSuchMethod(Invocation.method(#getDownloadLinkCsv, []),
          returnValue: Future<String>.value('')) as _i4.Future<String>);
  @override
  _i4.Future<dynamic> createActivity(_i5.ActivityModel? activityToCreate) =>
      (super.noSuchMethod(
          Invocation.method(#createActivity, [activityToCreate]),
          returnValue: Future<dynamic>.value()) as _i4.Future<dynamic>);
  @override
  _i4.Future<dynamic> editActivity(_i5.ActivityModel? activityToEdit) =>
      (super.noSuchMethod(Invocation.method(#editActivity, [activityToEdit]),
          returnValue: Future<dynamic>.value()) as _i4.Future<dynamic>);
  @override
  _i4.Future<dynamic> removeActivity(String? id) =>
      (super.noSuchMethod(Invocation.method(#removeActivity, [id]),
          returnValue: Future<dynamic>.value()) as _i4.Future<dynamic>);
  @override
  _i4.Future<bool> subscribeActivity(_i5.ActivityModel? activity,
          String? activityId, DateTime? activityDate) =>
      (super.noSuchMethod(
          Invocation.method(
              #subscribeActivity, [activity, activityId, activityDate]),
          returnValue: Future<bool>.value(false)) as _i4.Future<bool>);
  @override
  _i4.Future<bool> unsubscribeActivity(
          String? activityId, DateTime? activityDate) =>
      (super.noSuchMethod(
          Invocation.method(#unsubscribeActivity, [activityId, activityDate]),
          returnValue: Future<bool>.value(false)) as _i4.Future<bool>);
}

/// A class which mocks [FirebaseAnalyticsService].
///
/// See the documentation for Mockito's code generation for more information.
class MockFirebaseAnalyticsService extends _i1.Mock
    implements _i6.FirebaseAnalyticsService {
  MockFirebaseAnalyticsService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.FirebaseAnalytics get analytics =>
      (super.noSuchMethod(Invocation.getter(#analytics),
          returnValue: _FakeFirebaseAnalytics_0()) as _i2.FirebaseAnalytics);
  @override
  _i2.FirebaseAnalyticsObserver getAnalyticsObserver() =>
      (super.noSuchMethod(Invocation.method(#getAnalyticsObserver, []),
              returnValue: _FakeFirebaseAnalyticsObserver_1())
          as _i2.FirebaseAnalyticsObserver);
  @override
  _i4.Future<dynamic> setUserProperties(String? userId) =>
      (super.noSuchMethod(Invocation.method(#setUserProperties, [userId]),
          returnValue: Future<dynamic>.value()) as _i4.Future<dynamic>);
  @override
  _i4.Future<dynamic> logLogin() =>
      (super.noSuchMethod(Invocation.method(#logLogin, []),
          returnValue: Future<dynamic>.value()) as _i4.Future<dynamic>);
  @override
  _i4.Future<dynamic> logSignUp() =>
      (super.noSuchMethod(Invocation.method(#logSignUp, []),
          returnValue: Future<dynamic>.value()) as _i4.Future<dynamic>);
  @override
  _i4.Future<dynamic> logViewActivity(String? activityCode) =>
      (super.noSuchMethod(Invocation.method(#logViewActivity, [activityCode]),
          returnValue: Future<dynamic>.value()) as _i4.Future<dynamic>);
  @override
  _i4.Future<dynamic> logChangePassword() =>
      (super.noSuchMethod(Invocation.method(#logChangePassword, []),
          returnValue: Future<dynamic>.value()) as _i4.Future<dynamic>);
  @override
  _i4.Future<dynamic> logFaq(int? id) =>
      (super.noSuchMethod(Invocation.method(#logFaq, [id]),
          returnValue: Future<dynamic>.value()) as _i4.Future<dynamic>);
}
