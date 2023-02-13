// Mocks generated by Mockito 5.3.2 from annotations
// in smile_front/test/app/modules/auth/presenter/controllers/auth_controller_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:firebase_analytics/firebase_analytics.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:smile_front/app/modules/auth/domain/repositories/secure_storage_interface.dart'
    as _i4;
import 'package:smile_front/app/modules/auth/domain/usecases/login_with_email.dart'
    as _i8;
import 'package:smile_front/app/modules/auth/domain/usecases/refresh_token.dart'
    as _i7;
import 'package:smile_front/app/shared/models/user_model.dart' as _i3;
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

class _FakeUserModel_2 extends _i1.SmartFake implements _i3.UserModel {
  _FakeUserModel_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [SecureStorageInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockSecureStorageInterface extends _i1.Mock
    implements _i4.SecureStorageInterface {
  MockSecureStorageInterface() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<void> saveAccessToken(String? token) => (super.noSuchMethod(
        Invocation.method(
          #saveAccessToken,
          [token],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> saveRefreshToken(String? token) => (super.noSuchMethod(
        Invocation.method(
          #saveRefreshToken,
          [token],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<String?> getAccessToken() => (super.noSuchMethod(
        Invocation.method(
          #getAccessToken,
          [],
        ),
        returnValue: _i5.Future<String?>.value(),
      ) as _i5.Future<String?>);
  @override
  _i5.Future<String?> getRefreshToken() => (super.noSuchMethod(
        Invocation.method(
          #getRefreshToken,
          [],
        ),
        returnValue: _i5.Future<String?>.value(),
      ) as _i5.Future<String?>);
  @override
  _i5.Future<void> saveAccessLevel(String? accessLevel) => (super.noSuchMethod(
        Invocation.method(
          #saveAccessLevel,
          [accessLevel],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> saveId(String? id) => (super.noSuchMethod(
        Invocation.method(
          #saveId,
          [id],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> saveName(String? name) => (super.noSuchMethod(
        Invocation.method(
          #saveName,
          [name],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> saveSocialName(String? socialName) => (super.noSuchMethod(
        Invocation.method(
          #saveSocialName,
          [socialName],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> saveCertificateWithSocialName(
          bool? certificateWithSocialName) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveCertificateWithSocialName,
          [certificateWithSocialName],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<String?> getAccessLevel() => (super.noSuchMethod(
        Invocation.method(
          #getAccessLevel,
          [],
        ),
        returnValue: _i5.Future<String?>.value(),
      ) as _i5.Future<String?>);
  @override
  _i5.Future<String?> getId() => (super.noSuchMethod(
        Invocation.method(
          #getId,
          [],
        ),
        returnValue: _i5.Future<String?>.value(),
      ) as _i5.Future<String?>);
  @override
  _i5.Future<String?> getName() => (super.noSuchMethod(
        Invocation.method(
          #getName,
          [],
        ),
        returnValue: _i5.Future<String?>.value(),
      ) as _i5.Future<String?>);
  @override
  _i5.Future<String?> getSocialName() => (super.noSuchMethod(
        Invocation.method(
          #getSocialName,
          [],
        ),
        returnValue: _i5.Future<String?>.value(),
      ) as _i5.Future<String?>);
  @override
  _i5.Future<bool?> getCertificateWithSocialName() => (super.noSuchMethod(
        Invocation.method(
          #getCertificateWithSocialName,
          [],
        ),
        returnValue: _i5.Future<bool?>.value(),
      ) as _i5.Future<bool?>);
  @override
  _i5.Future<void> cleanSecureStorage() => (super.noSuchMethod(
        Invocation.method(
          #cleanSecureStorage,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
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
  _i5.Future<dynamic> setUserProperties(String? userId) => (super.noSuchMethod(
        Invocation.method(
          #setUserProperties,
          [userId],
        ),
        returnValue: _i5.Future<dynamic>.value(),
      ) as _i5.Future<dynamic>);
  @override
  _i5.Future<dynamic> logLogin() => (super.noSuchMethod(
        Invocation.method(
          #logLogin,
          [],
        ),
        returnValue: _i5.Future<dynamic>.value(),
      ) as _i5.Future<dynamic>);
  @override
  _i5.Future<dynamic> logSignUp() => (super.noSuchMethod(
        Invocation.method(
          #logSignUp,
          [],
        ),
        returnValue: _i5.Future<dynamic>.value(),
      ) as _i5.Future<dynamic>);
  @override
  _i5.Future<dynamic> logViewActivity(String? activityCode) =>
      (super.noSuchMethod(
        Invocation.method(
          #logViewActivity,
          [activityCode],
        ),
        returnValue: _i5.Future<dynamic>.value(),
      ) as _i5.Future<dynamic>);
  @override
  _i5.Future<dynamic> logChangePassword() => (super.noSuchMethod(
        Invocation.method(
          #logChangePassword,
          [],
        ),
        returnValue: _i5.Future<dynamic>.value(),
      ) as _i5.Future<dynamic>);
  @override
  _i5.Future<dynamic> logFaq(int? id) => (super.noSuchMethod(
        Invocation.method(
          #logFaq,
          [id],
        ),
        returnValue: _i5.Future<dynamic>.value(),
      ) as _i5.Future<dynamic>);
}

/// A class which mocks [RefreshTokenInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockRefreshTokenInterface extends _i1.Mock
    implements _i7.RefreshTokenInterface {
  MockRefreshTokenInterface() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<Map<String, dynamic>> call(String? token) => (super.noSuchMethod(
        Invocation.method(
          #call,
          [token],
        ),
        returnValue:
            _i5.Future<Map<String, dynamic>>.value(<String, dynamic>{}),
      ) as _i5.Future<Map<String, dynamic>>);
}

/// A class which mocks [LoginWithEmailInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockLoginWithEmailInterface extends _i1.Mock
    implements _i8.LoginWithEmailInterface {
  MockLoginWithEmailInterface() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i3.UserModel> call(
    String? user,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [
            user,
            password,
          ],
        ),
        returnValue: _i5.Future<_i3.UserModel>.value(_FakeUserModel_2(
          this,
          Invocation.method(
            #call,
            [
              user,
              password,
            ],
          ),
        )),
      ) as _i5.Future<_i3.UserModel>);
}
