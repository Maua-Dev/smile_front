// Mocks generated by Mockito 5.1.0 from annotations
// in smile_front/test/app/modules/dashboard/infra/activities_repository_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:smile_front/app/modules/dashboard/infra/datasources/activities_datasource.dart'
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

/// A class which mocks [ActivitiesDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockActivitiesDatasource extends _i1.Mock
    implements _i2.ActivitiesDatasource {
  MockActivitiesDatasource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.ActivityModel>> getAllActivities() =>
      (super.noSuchMethod(Invocation.method(#getAllActivities, []),
              returnValue:
                  Future<List<_i4.ActivityModel>>.value(<_i4.ActivityModel>[]))
          as _i3.Future<List<_i4.ActivityModel>>);
  @override
  _i3.Future<dynamic> putActivity(String? id, _i4.ActivityModel? activity) =>
      (super.noSuchMethod(Invocation.method(#putActivity, [id, activity]),
          returnValue: Future<dynamic>.value()) as _i3.Future<dynamic>);
  @override
  _i3.Future<dynamic> removeActivity(String? id) =>
      (super.noSuchMethod(Invocation.method(#removeActivity, [id]),
          returnValue: Future<dynamic>.value()) as _i3.Future<dynamic>);
}
