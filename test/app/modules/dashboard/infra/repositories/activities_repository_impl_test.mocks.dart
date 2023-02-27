// Mocks generated by Mockito 5.3.2 from annotations
// in smile_front/test/app/modules/dashboard/infra/repositories/activities_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:mockito/mockito.dart' as _i1;
import 'package:smile_front/app/modules/dashboard/infra/datasources/activities_datasource_interface.dart'
    as _i5;
import 'package:smile_front/app/shared/entities/infra/enrollment_state_enum.dart'
    as _i9;
import 'package:smile_front/app/shared/models/activity_model.dart' as _i7;
import 'package:smile_front/app/shared/models/admin_activity_model.dart' as _i8;
import 'package:smile_front/app/shared/models/enrollments_model.dart' as _i3;
import 'package:smile_front/app/shared/models/enrolls_activity_model.dart'
    as _i4;
import 'package:smile_front/app/shared/models/professor_activity_model.dart'
    as _i2;

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

class _FakeEnrollmentsModel_1 extends _i1.SmartFake
    implements _i3.EnrollmentsModel {
  _FakeEnrollmentsModel_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEnrollsActivityModel_2 extends _i1.SmartFake
    implements _i4.EnrollsActivityModel {
  _FakeEnrollsActivityModel_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ActivitiesDatasourceInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockActivitiesDatasourceInterface extends _i1.Mock
    implements _i5.ActivitiesDatasourceInterface {
  MockActivitiesDatasourceInterface() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<List<_i7.ActivityModel>> getAllActivities() => (super.noSuchMethod(
        Invocation.method(
          #getAllActivities,
          [],
        ),
        returnValue:
            _i6.Future<List<_i7.ActivityModel>>.value(<_i7.ActivityModel>[]),
      ) as _i6.Future<List<_i7.ActivityModel>>);
  @override
  _i6.Future<List<_i8.AdminActivityModel>> getAdminAllActivities() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAdminAllActivities,
          [],
        ),
        returnValue: _i6.Future<List<_i8.AdminActivityModel>>.value(
            <_i8.AdminActivityModel>[]),
      ) as _i6.Future<List<_i8.AdminActivityModel>>);
  @override
  _i6.Future<List<_i4.EnrollsActivityModel>> getAllActivitiesLogged() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllActivitiesLogged,
          [],
        ),
        returnValue: _i6.Future<List<_i4.EnrollsActivityModel>>.value(
            <_i4.EnrollsActivityModel>[]),
      ) as _i6.Future<List<_i4.EnrollsActivityModel>>);
  @override
  _i6.Future<_i2.ProfessorActivityModel> getActivityWithEnrollments(
          String? code) =>
      (super.noSuchMethod(
        Invocation.method(
          #getActivityWithEnrollments,
          [code],
        ),
        returnValue: _i6.Future<_i2.ProfessorActivityModel>.value(
            _FakeProfessorActivityModel_0(
          this,
          Invocation.method(
            #getActivityWithEnrollments,
            [code],
          ),
        )),
      ) as _i6.Future<_i2.ProfessorActivityModel>);
  @override
  _i6.Future<_i3.EnrollmentsModel> postSubscribe(String? activityCode) =>
      (super.noSuchMethod(
        Invocation.method(
          #postSubscribe,
          [activityCode],
        ),
        returnValue:
            _i6.Future<_i3.EnrollmentsModel>.value(_FakeEnrollmentsModel_1(
          this,
          Invocation.method(
            #postSubscribe,
            [activityCode],
          ),
        )),
      ) as _i6.Future<_i3.EnrollmentsModel>);
  @override
  _i6.Future<bool> postUnsubscribe(String? activityCode) => (super.noSuchMethod(
        Invocation.method(
          #postUnsubscribe,
          [activityCode],
        ),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);
  @override
  _i6.Future<dynamic> editActivity(
    String? id,
    _i7.ActivityModel? activity,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #editActivity,
          [
            id,
            activity,
          ],
        ),
        returnValue: _i6.Future<dynamic>.value(),
      ) as _i6.Future<dynamic>);
  @override
  _i6.Future<dynamic> createActivity(_i7.ActivityModel? activity) =>
      (super.noSuchMethod(
        Invocation.method(
          #createActivity,
          [activity],
        ),
        returnValue: _i6.Future<dynamic>.value(),
      ) as _i6.Future<dynamic>);
  @override
  _i6.Future<dynamic> deleteActivity(String? activityCode) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteActivity,
          [activityCode],
        ),
        returnValue: _i6.Future<dynamic>.value(),
      ) as _i6.Future<dynamic>);
  @override
  _i6.Future<dynamic> postConfirmAttendance(
    String? activityCode,
    String? confirmationCode,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #postConfirmAttendance,
          [
            activityCode,
            confirmationCode,
          ],
        ),
        returnValue: _i6.Future<dynamic>.value(),
      ) as _i6.Future<dynamic>);
  @override
  _i6.Future<String> postGenerateAttendanceConfirmation(String? activityCode) =>
      (super.noSuchMethod(
        Invocation.method(
          #postGenerateAttendanceConfirmation,
          [activityCode],
        ),
        returnValue: _i6.Future<String>.value(''),
      ) as _i6.Future<String>);
  @override
  _i6.Future<dynamic> postDeleteAttendanceConfirmation(String? activityCode) =>
      (super.noSuchMethod(
        Invocation.method(
          #postDeleteAttendanceConfirmation,
          [activityCode],
        ),
        returnValue: _i6.Future<dynamic>.value(),
      ) as _i6.Future<dynamic>);
  @override
  _i6.Future<_i4.EnrollsActivityModel> postManualChangeAttendance(
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
        returnValue: _i6.Future<_i4.EnrollsActivityModel>.value(
            _FakeEnrollsActivityModel_2(
          this,
          Invocation.method(
            #postManualChangeAttendance,
            [
              activityCode,
              userId,
              state,
            ],
          ),
        )),
      ) as _i6.Future<_i4.EnrollsActivityModel>);
  @override
  _i6.Future<String> getLinkCsv() => (super.noSuchMethod(
        Invocation.method(
          #getLinkCsv,
          [],
        ),
        returnValue: _i6.Future<String>.value(''),
      ) as _i6.Future<String>);
}
