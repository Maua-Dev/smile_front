// Mocks generated by Mockito 5.3.2 from annotations
// in smile_front/test/app/modules/dashboard/infra/repositories/activities_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:smile_front/app/modules/dashboard/infra/datasources/activities_datasource_interface.dart'
    as _i2;
import 'package:smile_front/app/shared/models/activity_model.dart' as _i4;

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

/// A class which mocks [ActivitiesDatasourceInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockActivitiesDatasourceInterface extends _i1.Mock
    implements _i2.ActivitiesDatasourceInterface {
  MockActivitiesDatasourceInterface() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.ActivityModel>> getAllActivities() => (super.noSuchMethod(
        Invocation.method(
          #getAllActivities,
          [],
        ),
        returnValue:
            _i3.Future<List<_i4.ActivityModel>>.value(<_i4.ActivityModel>[]),
      ) as _i3.Future<List<_i4.ActivityModel>>);
  @override
  _i3.Future<List<_i4.ActivityModel>> getUserSubscribedActivities() =>
      (super.noSuchMethod(
        Invocation.method(
          #getUserSubscribedActivities,
          [],
        ),
        returnValue:
            _i3.Future<List<_i4.ActivityModel>>.value(<_i4.ActivityModel>[]),
      ) as _i3.Future<List<_i4.ActivityModel>>);
  @override
  _i3.Future<bool> postSubscribe(
    String? activityId,
    DateTime? activityDate,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #postSubscribe,
          [
            activityId,
            activityDate,
          ],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);
  @override
  _i3.Future<bool> postUnsubscribe(
    String? activityId,
    DateTime? activityDate,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #postUnsubscribe,
          [
            activityId,
            activityDate,
          ],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);
  @override
  _i3.Future<dynamic> editActivity(
    String? id,
    _i4.ActivityModel? activity,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #editActivity,
          [
            id,
            activity,
          ],
        ),
        returnValue: _i3.Future<dynamic>.value(),
      ) as _i3.Future<dynamic>);
  @override
  _i3.Future<dynamic> createActivity(_i4.ActivityModel? activity) =>
      (super.noSuchMethod(
        Invocation.method(
          #createActivity,
          [activity],
        ),
        returnValue: _i3.Future<dynamic>.value(),
      ) as _i3.Future<dynamic>);
  @override
  _i3.Future<dynamic> deleteActivity(String? activityCode) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteActivity,
          [activityCode],
        ),
        returnValue: _i3.Future<dynamic>.value(),
      ) as _i3.Future<dynamic>);
  @override
  _i3.Future<String> getLinkCsv() => (super.noSuchMethod(
        Invocation.method(
          #getLinkCsv,
          [],
        ),
        returnValue: _i3.Future<String>.value(''),
      ) as _i3.Future<String>);
}
