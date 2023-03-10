// Mocks generated by Mockito 5.3.2 from annotations
// in smile_front/test/app/modules/auth/presenter/controllers/auth_controller_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:smile_front/app/modules/auth/domain/repositories/secure_storage_interface.dart'
    as _i3;
import 'package:smile_front/app/modules/auth/domain/usecases/login_with_email.dart'
    as _i6;
import 'package:smile_front/app/modules/auth/domain/usecases/refresh_token.dart'
    as _i5;
import 'package:smile_front/app/shared/models/user_model.dart' as _i2;

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

class _FakeUserModel_0 extends _i1.SmartFake implements _i2.UserModel {
  _FakeUserModel_0(
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
    implements _i3.SecureStorageInterface {
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
  _i4.Future<void> saveRole(String? role) => (super.noSuchMethod(
        Invocation.method(
          #saveRole,
          [role],
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
  _i4.Future<void> saveIdToken(String? idToken) => (super.noSuchMethod(
        Invocation.method(
          #saveIdToken,
          [idToken],
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
  _i4.Future<void> savePhone(String? phone) => (super.noSuchMethod(
        Invocation.method(
          #savePhone,
          [phone],
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
  _i4.Future<String?> getRole() => (super.noSuchMethod(
        Invocation.method(
          #getRole,
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
  _i4.Future<String?> getIdToken() => (super.noSuchMethod(
        Invocation.method(
          #getIdToken,
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
  _i4.Future<String?> getPhone() => (super.noSuchMethod(
        Invocation.method(
          #getPhone,
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

/// A class which mocks [RefreshTokenInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockRefreshTokenInterface extends _i1.Mock
    implements _i5.RefreshTokenInterface {
  MockRefreshTokenInterface() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<Map<String, dynamic>> call() => (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue:
            _i4.Future<Map<String, dynamic>>.value(<String, dynamic>{}),
      ) as _i4.Future<Map<String, dynamic>>);
}

/// A class which mocks [LoginWithEmailInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockLoginWithEmailInterface extends _i1.Mock
    implements _i6.LoginWithEmailInterface {
  MockLoginWithEmailInterface() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.UserModel> call(
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
        returnValue: _i4.Future<_i2.UserModel>.value(_FakeUserModel_0(
          this,
          Invocation.method(
            #call,
            [
              user,
              password,
            ],
          ),
        )),
      ) as _i4.Future<_i2.UserModel>);
}
