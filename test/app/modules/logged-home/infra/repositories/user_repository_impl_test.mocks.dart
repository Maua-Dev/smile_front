// Mocks generated by Mockito 5.1.0 from annotations
// in smile_front/test/app/modules/logged-home/infra/repositories/user_repository_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:smile_front/app/modules/logged-home/infra/datasources/user_datasource.dart'
    as _i3;
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

/// A class which mocks [UserDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserDatasource extends _i1.Mock implements _i3.UserDatasource {
  MockUserDatasource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.UserModel> getLoggedUser(String? cpfRne) =>
      (super.noSuchMethod(Invocation.method(#getLoggedUser, [cpfRne]),
              returnValue: Future<_i2.UserModel>.value(_FakeUserModel_0()))
          as _i4.Future<_i2.UserModel>);
}
