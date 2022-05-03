import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:smile_front/app/app_module.dart';
import 'package:smile_front/app/modules/register/domain/repositories/register_informations_repository_interface.dart';
import 'package:smile_front/app/modules/register/presenter/controllers/register_controller.dart';
import 'package:smile_front/app/modules/register/register_module.dart';
import 'package:smile_front/app/shared/services/firebase-analytics/firebase_analytics_service.dart';

import 'register_controller_test.mocks.dart';

@GenerateMocks([RegisterRepositoryInterface])
void main() {
  initModules([AppModule(), RegisterModule()]);
  RegisterRepositoryInterface repository = MockRegisterRepositoryInterface();
  FirebaseAnalyticsService analytics = FirebaseAnalyticsService();
  late RegisterController controller;

  setUpAll(() async {
    controller = RegisterController(
        registerUserRepository: repository, analytics: analytics);
  });

  test('isLoading', () {
    var test = controller.isLoading;
    expect(test, false);
  });

  test('successRegistration', () {
    var test = controller.successRegistration;
    expect(test, false);
  });

  test('setName', () {
    var str = 'caio';
    controller.setName(str);
    expect(controller.name, str);
  });

  test('setCpf', () {
    var str = '11759675059';
    controller.setCpf(str);
    expect(controller.cpf, str);
  });

  test('setEmail', () {
    var str = 'teste';
    controller.setEmail(str);
    expect(controller.email, str);
  });

  test('setRa', () {
    var str = 'teste';
    controller.setRa(str);
    expect(controller.ra, str);
  });

  test('setPassword', () {
    var str = 'Teste123!';
    controller.setPassword(str);
    expect(controller.password, str);
  });

  test('setSuccessRegistration', () {
    var str = true;
    controller.setSuccessRegistration(str);
    expect(controller.successRegistration, true);
  });
}
