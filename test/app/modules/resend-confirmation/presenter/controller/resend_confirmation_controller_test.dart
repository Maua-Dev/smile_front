import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smile_front/app/modules/register/register_module.dart';
import 'package:smile_front/app/modules/resend-confirmation/domain/repository/resend_confirmation_datasource_interface.dart';
import 'package:smile_front/app/modules/resend-confirmation/presenter/controller/resend_confirmation_controller.dart';
import 'package:smile_front/app/modules/resend-confirmation/usecases/resend_confirmation.dart';

import 'resend_confirmation_controller_test.mocks.dart';

@GenerateMocks(
    [ResendConfirmationRepositoryInterface, ResendConfirmationInterface])
void main() {
  initModules([RegisterModule()]);
  ResendConfirmationRepositoryInterface repository =
      MockResendConfirmationRepositoryInterface();
  ResendConfirmationInterface resendUserConfirmation =
      MockResendConfirmationInterface();
  late ResendConfirmationController controller;

  var cpf = '123.456.789-0';

  setUpAll(() async {
    when(repository.resendConfirmation(cpf)).thenAnswer((_) async => '');
    controller = ResendConfirmationController(
        resendUserConfirmation: resendUserConfirmation);
  });

  test('setError', () {
    var str = 'error';
    controller.setError(str);
    expect(controller.errors, str);
  });

  test('setCpf', () {
    var str = '1.2-3';
    controller.setCpf(str);
    expect(controller.cpf, '123');
  });

  test('setIsLoading', () {
    controller.setIsLoading(true);
    expect(controller.isLoading, true);
  });

  test('setSuccessRegistration', () {
    controller.setSuccessRegistration(true);
    expect(controller.successRegistration, true);
  });
}
