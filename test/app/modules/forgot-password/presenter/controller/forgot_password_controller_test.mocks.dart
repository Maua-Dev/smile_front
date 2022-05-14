// Mocks generated by Mockito 5.1.0 from annotations
// in smile_front/test/app/modules/forgot-password/presenter/controller/forgot_password_controller_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:firebase_analytics/firebase_analytics.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:smile_front/app/modules/forgot-password/domain/repository/forgot_password_datasource_interface.dart'
    as _i3;
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

class _FakeFirebaseAnalytics_0 extends _i1.Fake
    implements _i2.FirebaseAnalytics {}

class _FakeFirebaseAnalyticsObserver_1 extends _i1.Fake
    implements _i2.FirebaseAnalyticsObserver {}

/// A class which mocks [ForgotPasswordRepositoryInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockForgotPasswordRepositoryInterface extends _i1.Mock
    implements _i3.ForgotPasswordRepositoryInterface {
  MockForgotPasswordRepositoryInterface() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<String> forgotPassword(String? username) =>
      (super.noSuchMethod(Invocation.method(#forgotPassword, [username]),
          returnValue: Future<String>.value('')) as _i4.Future<String>);
  @override
  _i4.Future<String> changePassword(
          String? username, String? password, String? code) =>
      (super.noSuchMethod(
          Invocation.method(#changePassword, [username, password, code]),
          returnValue: Future<String>.value('')) as _i4.Future<String>);
}

/// A class which mocks [FirebaseAnalyticsService].
///
/// See the documentation for Mockito's code generation for more information.
class MockFirebaseAnalyticsService extends _i1.Mock
    implements _i5.FirebaseAnalyticsService {
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
