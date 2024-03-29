// Mocks generated by Mockito 5.4.0 from annotations
// in smile_front/test/app/modules/dashboard/presenter/controller/adm/edit_activity_controller_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart'
    as _i3;
import 'package:smile_front/app/modules/dashboard/domain/usecases/edit_activity.dart'
    as _i9;
import 'package:smile_front/app/modules/dashboard/domain/usecases/get_responsible_professors.dart'
    as _i10;
import 'package:smile_front/app/shared/entities/infra/enrollment_state_enum.dart'
    as _i8;
import 'package:smile_front/app/shared/models/activity_model.dart' as _i5;
import 'package:smile_front/app/shared/models/admin_activity_model.dart' as _i7;
import 'package:smile_front/app/shared/models/enrolls_activity_model.dart'
    as _i6;
import 'package:smile_front/app/shared/models/professor_activity_model.dart'
    as _i2;
import 'package:smile_front/app/shared/models/responsible_professor_model.dart'
    as _i11;

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

/// A class which mocks [ActivitiesRepositoryInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockActivitiesRepositoryInterface extends _i1.Mock
    implements _i3.ActivitiesRepositoryInterface {
  MockActivitiesRepositoryInterface() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<List<_i5.ActivityModel>> getAllActivities() => (super.noSuchMethod(
        Invocation.method(
          #getAllActivities,
          [],
        ),
        returnValue:
            _i4.Future<List<_i5.ActivityModel>>.value(<_i5.ActivityModel>[]),
      ) as _i4.Future<List<_i5.ActivityModel>>);
  @override
  _i4.Future<List<_i6.EnrollsActivityModel>> getUserSubscribedActivities() =>
      (super.noSuchMethod(
        Invocation.method(
          #getUserSubscribedActivities,
          [],
        ),
        returnValue: _i4.Future<List<_i6.EnrollsActivityModel>>.value(
            <_i6.EnrollsActivityModel>[]),
      ) as _i4.Future<List<_i6.EnrollsActivityModel>>);
  @override
  _i4.Future<_i2.ProfessorActivityModel> getActivityWithEnrollments(
          String? code) =>
      (super.noSuchMethod(
        Invocation.method(
          #getActivityWithEnrollments,
          [code],
        ),
        returnValue: _i4.Future<_i2.ProfessorActivityModel>.value(
            _FakeProfessorActivityModel_0(
          this,
          Invocation.method(
            #getActivityWithEnrollments,
            [code],
          ),
        )),
      ) as _i4.Future<_i2.ProfessorActivityModel>);
  @override
  _i4.Future<String> getDownloadLinkCsv() => (super.noSuchMethod(
        Invocation.method(
          #getDownloadLinkCsv,
          [],
        ),
        returnValue: _i4.Future<String>.value(''),
      ) as _i4.Future<String>);
  @override
  _i4.Future<bool> createActivity(_i7.AdminActivityModel? activityToCreate) =>
      (super.noSuchMethod(
        Invocation.method(
          #createActivity,
          [activityToCreate],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
  @override
  _i4.Future<List<_i7.AdminActivityModel>> getAdminActivities() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAdminActivities,
          [],
        ),
        returnValue: _i4.Future<List<_i7.AdminActivityModel>>.value(
            <_i7.AdminActivityModel>[]),
      ) as _i4.Future<List<_i7.AdminActivityModel>>);
  @override
  _i4.Future<bool> editActivity(_i7.AdminActivityModel? activityToEdit) =>
      (super.noSuchMethod(
        Invocation.method(
          #editActivity,
          [activityToEdit],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
  @override
  _i4.Future<dynamic> deleteActivity(String? activityCode) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteActivity,
          [activityCode],
        ),
        returnValue: _i4.Future<dynamic>.value(),
      ) as _i4.Future<dynamic>);
  @override
  _i4.Future<dynamic> manualDropActivity(
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
        returnValue: _i4.Future<dynamic>.value(),
      ) as _i4.Future<dynamic>);
  @override
  _i4.Future<bool> subscribeActivity(String? activityCode) =>
      (super.noSuchMethod(
        Invocation.method(
          #subscribeActivity,
          [activityCode],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
  @override
  _i4.Future<bool> unsubscribeActivity(String? activityCode) =>
      (super.noSuchMethod(
        Invocation.method(
          #unsubscribeActivity,
          [activityCode],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
  @override
  _i4.Future<String> generateConfirmationCode(String? activityCode) =>
      (super.noSuchMethod(
        Invocation.method(
          #generateConfirmationCode,
          [activityCode],
        ),
        returnValue: _i4.Future<String>.value(''),
      ) as _i4.Future<String>);
  @override
  _i4.Future<dynamic> postManualChangeAttendance(
    String? activityCode,
    String? userId,
    _i8.EnrollmentStateEnum? state,
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
        returnValue: _i4.Future<dynamic>.value(),
      ) as _i4.Future<dynamic>);
  @override
  _i4.Future<dynamic> confirmAttendance(
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
        returnValue: _i4.Future<dynamic>.value(),
      ) as _i4.Future<dynamic>);
  @override
  _i4.Future<dynamic> deleteAtendanceCode(String? activityCode) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteAtendanceCode,
          [activityCode],
        ),
        returnValue: _i4.Future<dynamic>.value(),
      ) as _i4.Future<dynamic>);
  @override
  _i4.Future<dynamic> deleteUser() => (super.noSuchMethod(
        Invocation.method(
          #deleteUser,
          [],
        ),
        returnValue: _i4.Future<dynamic>.value(),
      ) as _i4.Future<dynamic>);
}

/// A class which mocks [EditActivityInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockEditActivityInterface extends _i1.Mock
    implements _i9.EditActivityInterface {
  MockEditActivityInterface() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<dynamic> call(_i7.AdminActivityModel? activityToEdit) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [activityToEdit],
        ),
        returnValue: _i4.Future<dynamic>.value(),
      ) as _i4.Future<dynamic>);
}

/// A class which mocks [GetResponsibleProfessorsInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetResponsibleProfessorsInterface extends _i1.Mock
    implements _i10.GetResponsibleProfessorsInterface {
  MockGetResponsibleProfessorsInterface() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<List<_i11.ResponsibleProfessorModel>> call() =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue: _i4.Future<List<_i11.ResponsibleProfessorModel>>.value(
            <_i11.ResponsibleProfessorModel>[]),
      ) as _i4.Future<List<_i11.ResponsibleProfessorModel>>);
}
