// Mocks generated by Mockito 5.3.2 from annotations
// in smile_front/test/app/modules/forgot-password/infra/repository/forgot_password_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:smile_front/app/modules/forgot-password/infra/datasources/forgot_password_datasource.dart'
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

/// A class which mocks [ForgotPasswordDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockForgotPasswordDatasource extends _i1.Mock
    implements _i2.ForgotPasswordDatasource {
  MockForgotPasswordDatasource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<String> forgotPassword(String? username) => (super.noSuchMethod(
        Invocation.method(
          #forgotPassword,
          [username],
        ),
        returnValue: _i3.Future<String>.value(''),
      ) as _i3.Future<String>);
  @override
  _i3.Future<String> changePassword(
    String? username,
    String? password,
    String? code,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #changePassword,
          [
            username,
            password,
            code,
          ],
        ),
        returnValue: _i3.Future<String>.value(''),
      ) as _i3.Future<String>);
}
