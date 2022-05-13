import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smile_front/app/modules/forgot-password/infra/datasources/forgot_password_datasource.dart';
import 'package:smile_front/app/modules/forgot-password/infra/repository/forgot_password_repository_impl.dart';

import 'forgot_password_repository_impl_test.mocks.dart';

@GenerateMocks([ForgotPasswordDatasource])
void main() {
  late ForgotPasswordRepositoryImpl repository;
  ForgotPasswordDatasource datasource = MockForgotPasswordDatasource();

  var success = 'Success';

  setUpAll(() async {
    when(datasource.forgotPassword('')).thenAnswer((_) async => success);
    when(datasource.changePassword('', '', ''))
        .thenAnswer((_) async => success);
    repository = ForgotPasswordRepositoryImpl(datasource: datasource);
  });

  test('forgotPassword', () async {
    expect(await repository.forgotPassword(''), success);
  });

  test('changePassword', () async {
    expect(await repository.changePassword('', '', ''), success);
  });
}
