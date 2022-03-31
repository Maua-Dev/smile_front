// Mocks generated by Mockito 5.1.0 from annotations
// in smile_front/test/app/modules/dashboard/presenter/controller/adm/edit_activity_controller_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart'
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

/// A class which mocks [ActivitiesRepositoryInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockActivitiesRepositoryInterface extends _i1.Mock
    implements _i2.ActivitiesRepositoryInterface {
  MockActivitiesRepositoryInterface() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.ActivityModel>> getAllActivities() =>
      (super.noSuchMethod(Invocation.method(#getAllActivities, []),
              returnValue:
                  Future<List<_i4.ActivityModel>>.value(<_i4.ActivityModel>[]))
          as _i3.Future<List<_i4.ActivityModel>>);
  @override
  _i3.Future<List<_i4.ActivityModel>> getUserSubscribedActivities() =>
      (super.noSuchMethod(Invocation.method(#getUserSubscribedActivities, []),
              returnValue:
                  Future<List<_i4.ActivityModel>>.value(<_i4.ActivityModel>[]))
          as _i3.Future<List<_i4.ActivityModel>>);
  @override
  _i3.Future<dynamic> createActivity(_i4.ActivityModel? activityToCreate) =>
      (super.noSuchMethod(
          Invocation.method(#createActivity, [activityToCreate]),
          returnValue: Future<dynamic>.value()) as _i3.Future<dynamic>);
  @override
  _i3.Future<dynamic> editActivity(_i4.ActivityModel? activityToEdit) =>
      (super.noSuchMethod(Invocation.method(#editActivity, [activityToEdit]),
          returnValue: Future<dynamic>.value()) as _i3.Future<dynamic>);
  @override
  _i3.Future<dynamic> removeActivity(String? id) =>
      (super.noSuchMethod(Invocation.method(#removeActivity, [id]),
          returnValue: Future<dynamic>.value()) as _i3.Future<dynamic>);
}
