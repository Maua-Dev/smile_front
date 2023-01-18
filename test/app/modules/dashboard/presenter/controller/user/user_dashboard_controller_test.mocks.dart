// Mocks generated by Mockito 5.3.2 from annotations
// in smile_front/test/app/modules/dashboard/presenter/controller/user/user_dashboard_controller_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:firebase_analytics/firebase_analytics.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:smile_front/app/modules/auth/domain/repositories/secure_storage_interface.dart'
    as _i6;
import 'package:smile_front/app/modules/dashboard/domain/repositories/user_repository_interface.dart'
    as _i7;
import 'package:smile_front/app/modules/dashboard/domain/usecases/change_data.dart'
    as _i10;
import 'package:smile_front/app/modules/dashboard/domain/usecases/get_user_subscribed_activities.dart'
    as _i3;
import 'package:smile_front/app/modules/dashboard/infra/models/user_change_data_model.dart'
    as _i8;
import 'package:smile_front/app/shared/models/activity_model.dart' as _i5;
import 'package:smile_front/app/shared/services/firebase-analytics/firebase_analytics_service.dart'
    as _i9;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeFirebaseAnalytics_0 extends _i1.SmartFake
    implements _i2.FirebaseAnalytics {
  _FakeFirebaseAnalytics_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeFirebaseAnalyticsObserver_1 extends _i1.SmartFake
    implements _i2.FirebaseAnalyticsObserver {
  _FakeFirebaseAnalyticsObserver_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GetUserSubscribedActivitiesInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetUserSubscribedActivitiesInterface extends _i1.Mock
    implements _i3.GetUserSubscribedActivitiesInterface {
  MockGetUserSubscribedActivitiesInterface() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<List<_i5.ActivityModel>> call() => (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue:
            _i4.Future<List<_i5.ActivityModel>>.value(<_i5.ActivityModel>[]),
      ) as _i4.Future<List<_i5.ActivityModel>>);
}

/// A class which mocks [SecureStorageInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockSecureStorageInterface extends _i1.Mock
    implements _i6.SecureStorageInterface {
  MockSecureStorageInterface() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<void> saveAccessToken(String? token) => (super.noSuchMethod(
        Invocation.method(
          #saveAccessToken,
          [token],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> saveRefreshToken(String? token) => (super.noSuchMethod(
        Invocation.method(
          #saveRefreshToken,
          [token],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<String?> getAccessToken() => (super.noSuchMethod(
        Invocation.method(
          #getAccessToken,
          [],
        ),
        returnValue: _i4.Future<String?>.value(),
      ) as _i4.Future<String?>);
  @override
  _i4.Future<String?> getRefreshToken() => (super.noSuchMethod(
        Invocation.method(
          #getRefreshToken,
          [],
        ),
        returnValue: _i4.Future<String?>.value(),
      ) as _i4.Future<String?>);
  @override
  _i4.Future<void> saveAccessLevel(String? accessLevel) => (super.noSuchMethod(
        Invocation.method(
          #saveAccessLevel,
          [accessLevel],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> saveId(String? id) => (super.noSuchMethod(
        Invocation.method(
          #saveId,
          [id],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> saveName(String? name) => (super.noSuchMethod(
        Invocation.method(
          #saveName,
          [name],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> saveSocialName(String? socialName) => (super.noSuchMethod(
        Invocation.method(
          #saveSocialName,
          [socialName],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> saveCertificateWithSocialName(
          bool? certificateWithSocialName) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveCertificateWithSocialName,
          [certificateWithSocialName],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<String?> getAccessLevel() => (super.noSuchMethod(
        Invocation.method(
          #getAccessLevel,
          [],
        ),
        returnValue: _i4.Future<String?>.value(),
      ) as _i4.Future<String?>);
  @override
  _i4.Future<String?> getId() => (super.noSuchMethod(
        Invocation.method(
          #getId,
          [],
        ),
        returnValue: _i4.Future<String?>.value(),
      ) as _i4.Future<String?>);
  @override
  _i4.Future<String?> getName() => (super.noSuchMethod(
        Invocation.method(
          #getName,
          [],
        ),
        returnValue: _i4.Future<String?>.value(),
      ) as _i4.Future<String?>);
  @override
  _i4.Future<String?> getSocialName() => (super.noSuchMethod(
        Invocation.method(
          #getSocialName,
          [],
        ),
        returnValue: _i4.Future<String?>.value(),
      ) as _i4.Future<String?>);
  @override
  _i4.Future<bool?> getCertificateWithSocialName() => (super.noSuchMethod(
        Invocation.method(
          #getCertificateWithSocialName,
          [],
        ),
        returnValue: _i4.Future<bool?>.value(),
      ) as _i4.Future<bool?>);
  @override
  _i4.Future<void> cleanSecureStorage() => (super.noSuchMethod(
        Invocation.method(
          #cleanSecureStorage,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}

/// A class which mocks [UserRepositoryInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserRepositoryInterface extends _i1.Mock
    implements _i7.UserRepositoryInterface {
  MockUserRepositoryInterface() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<dynamic> changeData(
          _i8.UserChangeDataModel? userChangeDataModel) =>
      (super.noSuchMethod(
        Invocation.method(
          #changeData,
          [userChangeDataModel],
        ),
        returnValue: _i4.Future<dynamic>.value(),
      ) as _i4.Future<dynamic>);
}

/// A class which mocks [FirebaseAnalyticsService].
///
/// See the documentation for Mockito's code generation for more information.
class MockFirebaseAnalyticsService extends _i1.Mock
    implements _i9.FirebaseAnalyticsService {
  MockFirebaseAnalyticsService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.FirebaseAnalytics get analytics => (super.noSuchMethod(
        Invocation.getter(#analytics),
        returnValue: _FakeFirebaseAnalytics_0(
          this,
          Invocation.getter(#analytics),
        ),
      ) as _i2.FirebaseAnalytics);
  @override
  _i2.FirebaseAnalyticsObserver getAnalyticsObserver() => (super.noSuchMethod(
        Invocation.method(
          #getAnalyticsObserver,
          [],
        ),
        returnValue: _FakeFirebaseAnalyticsObserver_1(
          this,
          Invocation.method(
            #getAnalyticsObserver,
            [],
          ),
        ),
      ) as _i2.FirebaseAnalyticsObserver);
  @override
  _i4.Future<dynamic> setUserProperties(String? userId) => (super.noSuchMethod(
        Invocation.method(
          #setUserProperties,
          [userId],
        ),
        returnValue: _i4.Future<dynamic>.value(),
      ) as _i4.Future<dynamic>);
  @override
  _i4.Future<dynamic> logLogin() => (super.noSuchMethod(
        Invocation.method(
          #logLogin,
          [],
        ),
        returnValue: _i4.Future<dynamic>.value(),
      ) as _i4.Future<dynamic>);
  @override
  _i4.Future<dynamic> logSignUp() => (super.noSuchMethod(
        Invocation.method(
          #logSignUp,
          [],
        ),
        returnValue: _i4.Future<dynamic>.value(),
      ) as _i4.Future<dynamic>);
  @override
  _i4.Future<dynamic> logViewActivity(String? activityCode) =>
      (super.noSuchMethod(
        Invocation.method(
          #logViewActivity,
          [activityCode],
        ),
        returnValue: _i4.Future<dynamic>.value(),
      ) as _i4.Future<dynamic>);
  @override
  _i4.Future<dynamic> logChangePassword() => (super.noSuchMethod(
        Invocation.method(
          #logChangePassword,
          [],
        ),
        returnValue: _i4.Future<dynamic>.value(),
      ) as _i4.Future<dynamic>);
  @override
  _i4.Future<dynamic> logFaq(int? id) => (super.noSuchMethod(
        Invocation.method(
          #logFaq,
          [id],
        ),
        returnValue: _i4.Future<dynamic>.value(),
      ) as _i4.Future<dynamic>);
}

/// A class which mocks [ChangeDataInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockChangeDataInterface extends _i1.Mock
    implements _i10.ChangeDataInterface {
  MockChangeDataInterface() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<dynamic> call(
    String? nameToChange,
    String? socialNameToChange,
    bool? certificateWithSocialName,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [
            nameToChange,
            socialNameToChange,
            certificateWithSocialName,
          ],
        ),
        returnValue: _i4.Future<dynamic>.value(),
      ) as _i4.Future<dynamic>);
}
