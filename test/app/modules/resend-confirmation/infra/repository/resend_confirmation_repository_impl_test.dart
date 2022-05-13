import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smile_front/app/modules/resend-confirmation/infra/datasources/resend_confirmation_datasource.dart';
import 'package:smile_front/app/modules/resend-confirmation/infra/repository/resend_confirmation_repository_impl.dart';

import 'resend_confirmation_repository_impl_test.mocks.dart';

@GenerateMocks([ResendConfirmationDatasource])
void main() {
  late ResendConfirmationRepositoryImpl repository;
  ResendConfirmationDatasource datasource = MockResendConfirmationDatasource();

  var name = 'Name';
  var res = 'Resend Confirmation';

  setUpAll(() {
    when(datasource.resendConfirmation(name)).thenAnswer((_) async => res);
    repository = ResendConfirmationRepositoryImpl(datasource: datasource);
  });

  test('resendConfirmation', () async {
    var response = await repository.resendConfirmation(name);
    expect(response, res);
  });
}
