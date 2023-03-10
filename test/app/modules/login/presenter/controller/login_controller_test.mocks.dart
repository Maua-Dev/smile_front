// Mocks generated by Mockito 5.3.2 from annotations
// in smile_front/test/app/modules/login/presenter/controller/login_controller_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:mockito/mockito.dart' as _i1;
import 'package:smile_front/app/modules/auth/domain/repositories/secure_storage_interface.dart'
    as _i11;
import 'package:smile_front/app/modules/auth/domain/usecases/login_with_email.dart'
    as _i12;
import 'package:smile_front/app/modules/auth/domain/usecases/refresh_token.dart'
    as _i10;
import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart'
    as _i4;
import 'package:smile_front/app/shared/entities/infra/enrollment_state_enum.dart'
    as _i9;
import 'package:smile_front/app/shared/models/activity_model.dart' as _i6;
import 'package:smile_front/app/shared/models/admin_activity_model.dart' as _i8;
import 'package:smile_front/app/shared/models/enrolls_activity_model.dart'
    as _i7;
import 'package:smile_front/app/shared/models/professor_activity_model.dart'
    as _i2;
import 'package:smile_front/app/shared/models/user_model.dart' as _i3;

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

class _FakeProfessorActivityModel_0 extends _i1.SmartFake
    implements _i2.ProfessorActivityModel {
  _FakeProfessorActivityModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUserModel_1 extends _i1.SmartFake implements _i3.UserModel {
  _FakeUserModel_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ActivitiesRepositoryInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockActivitiesRepositoryInterface extends _i1.Mock
    implements _i4.ActivitiesRepositoryInterface {
  MockActivitiesRepositoryInterface() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<List<_i6.ActivityModel>> getAllActivities() => (super.noSuchMethod(
        Invocation.method(
          #getAllActivities,
          [],
        ),
        returnValue:
            _i5.Future<List<_i6.ActivityModel>>.value(<_i6.ActivityModel>[]),
      ) as _i5.Future<List<_i6.ActivityModel>>);
  @override
  _i5.Future<List<_i7.EnrollsActivityModel>> getUserSubscribedActivities() =>
      (super.noSuchMethod(
        Invocation.method(
          #getUserSubscribedActivities,
          [],
        ),
        returnValue: _i5.Future<List<_i7.EnrollsActivityModel>>.value(
            <_i7.EnrollsActivityModel>[]),
      ) as _i5.Future<List<_i7.EnrollsActivityModel>>);
  @override
  _i5.Future<_i2.ProfessorActivityModel> getActivityWithEnrollments(
          String? code) =>
      (super.noSuchMethod(
        Invocation.method(
          #getActivityWithEnrollments,
          [code],
        ),
        returnValue: _i5.Future<_i2.ProfessorActivityModel>.value(
            _FakeProfessorActivityModel_0(
          this,
          Invocation.method(
            #getActivityWithEnrollments,
            [code],
          ),
        )),
      ) as _i5.Future<_i2.ProfessorActivityModel>);
  @override
  _i5.Future<String> getDownloadLinkCsv() => (super.noSuchMethod(
        Invocation.method(
          #getDownloadLinkCsv,
          [],
        ),
        returnValue: _i5.Future<String>.value(''),
      ) as _i5.Future<String>);
  @override
  _i5.Future<dynamic> createActivity(_i6.ActivityModel? activityToCreate) =>
      (super.noSuchMethod(
        Invocation.method(
          #createActivity,
          [activityToCreate],
        ),
        returnValue: _i5.Future<dynamic>.value(),
      ) as _i5.Future<dynamic>);
  @override
  _i5.Future<List<_i8.AdminActivityModel>> getAdminActivities() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAdminActivities,
          [],
        ),
        returnValue: _i5.Future<List<_i8.AdminActivityModel>>.value(
            <_i8.AdminActivityModel>[]),
      ) as _i5.Future<List<_i8.AdminActivityModel>>);
  @override
  _i5.Future<dynamic> editActivity(_i6.ActivityModel? activityToEdit) =>
      (super.noSuchMethod(
        Invocation.method(
          #editActivity,
          [activityToEdit],
        ),
        returnValue: _i5.Future<dynamic>.value(),
      ) as _i5.Future<dynamic>);
  @override
  _i5.Future<dynamic> deleteActivity(String? activityCode) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteActivity,
          [activityCode],
        ),
        returnValue: _i5.Future<dynamic>.value(),
      ) as _i5.Future<dynamic>);
  @override
  _i5.Future<dynamic> manualDropActivity(
    String? activityCode,
    String? userId,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #manualDropActivity,
          [
            activityCode,
            userId,
          ],
        ),
        returnValue: _i5.Future<dynamic>.value(),
      ) as _i5.Future<dynamic>);
  @override
  _i5.Future<bool> subscribeActivity(String? activityCode) =>
      (super.noSuchMethod(
        Invocation.method(
          #subscribeActivity,
          [activityCode],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
  @override
  _i5.Future<bool> unsubscribeActivity(String? activityCode) =>
      (super.noSuchMethod(
        Invocation.method(
          #unsubscribeActivity,
          [activityCode],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
  @override
  _i5.Future<String> generateConfirmationCode(String? activityCode) =>
      (super.noSuchMethod(
        Invocation.method(
          #generateConfirmationCode,
          [activityCode],
        ),
        returnValue: _i5.Future<String>.value(''),
      ) as _i5.Future<String>);
  @override
  _i5.Future<dynamic> postManualChangeAttendance(
    String? activityCode,
    String? userId,
    _i9.EnrollmentStateEnum? state,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #postManualChangeAttendance,
          [
            activityCode,
            userId,
            state,
          ],
        ),
        returnValue: _i5.Future<dynamic>.value(),
      ) as _i5.Future<dynamic>);
  @override
  _i5.Future<dynamic> confirmAttendance(
    String? confirmAttendanceCode,
    String? activityCode,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #confirmAttendance,
          [
            confirmAttendanceCode,
            activityCode,
          ],
        ),
        returnValue: _i5.Future<dynamic>.value(),
      ) as _i5.Future<dynamic>);
  @override
  _i5.Future<dynamic> deleteAtendanceCode(String? activityCode) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteAtendanceCode,
          [activityCode],
        ),
        returnValue: _i5.Future<dynamic>.value(),
      ) as _i5.Future<dynamic>);
}

/// A class which mocks [RefreshTokenInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockRefreshTokenInterface extends _i1.Mock
    implements _i10.RefreshTokenInterface {
  MockRefreshTokenInterface() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<Map<String, dynamic>> call() => (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue:
            _i5.Future<Map<String, dynamic>>.value(<String, dynamic>{}),
      ) as _i5.Future<Map<String, dynamic>>);
}

/// A class which mocks [SecureStorageInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockSecureStorageInterface extends _i1.Mock
    implements _i11.SecureStorageInterface {
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
  _i5.Future<void> saveRole(String? role) => (super.noSuchMethod(
        Invocation.method(
          #saveRole,
          [role],
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
  _i5.Future<void> saveIdToken(String? idToken) => (super.noSuchMethod(
        Invocation.method(
          #saveIdToken,
          [idToken],
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
  _i5.Future<void> savePhone(String? phone) => (super.noSuchMethod(
        Invocation.method(
          #savePhone,
          [phone],
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
  _i5.Future<String?> getRole() => (super.noSuchMethod(
        Invocation.method(
          #getRole,
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
  _i5.Future<String?> getIdToken() => (super.noSuchMethod(
        Invocation.method(
          #getIdToken,
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
  _i5.Future<String?> getPhone() => (super.noSuchMethod(
        Invocation.method(
          #getPhone,
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

/// A class which mocks [LoginWithEmailInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockLoginWithEmailInterface extends _i1.Mock
    implements _i12.LoginWithEmailInterface {
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
        returnValue: _i5.Future<_i3.UserModel>.value(_FakeUserModel_1(
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
