// Mocks generated by Mockito 5.1.0 from annotations
// in smile_front/test/app/modules/logged-adm-home/controller/logged_home_controller.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:mockito/mockito.dart' as _i1;
import 'package:smile_front/app/modules/logged-adm-home/domain/repositories/future_activity_repository_interface.dart'
    as _i6;
import 'package:smile_front/app/modules/logged-adm-home/domain/repositories/user_repository_interface.dart'
    as _i4;
import 'package:smile_front/app/shared/entities/activity.dart' as _i3;
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

class _FakeUserModel_0 extends _i1.Fake implements _i2.UserModel {}

class _FakeActivity_1 extends _i1.Fake implements _i3.Activity {}

/// A class which mocks [UserRepositoryInteface].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserRepositoryInteface extends _i1.Mock
    implements _i4.UserRepositoryInteface {
  MockUserRepositoryInteface() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.UserModel> getUser(String? cpfRne) =>
      (super.noSuchMethod(Invocation.method(#getUser, [cpfRne]),
              returnValue: Future<_i2.UserModel>.value(_FakeUserModel_0()))
          as _i5.Future<_i2.UserModel>);
}

/// A class which mocks [FutureActivityRepositoryInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockFutureActivityRepositoryInterface extends _i1.Mock
    implements _i6.FutureActivityRepositoryInterface {
  MockFutureActivityRepositoryInterface() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i3.Activity> getFutureActivity() =>
      (super.noSuchMethod(Invocation.method(#getFutureActivity, []),
              returnValue: Future<_i3.Activity>.value(_FakeActivity_1()))
          as _i5.Future<_i3.Activity>);
}
