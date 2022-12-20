import 'package:firebase_core/firebase_core.dart';
import 'package:modular_test/modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smile_front/app/modules/forgot-password/domain/repository/forgot_password_datasource_interface.dart';
import 'package:smile_front/app/modules/forgot-password/forgot_password_module.dart';
import 'package:smile_front/app/modules/forgot-password/presenter/controller/forgot_password_controller.dart';
import 'package:smile_front/app/shared/services/firebase-analytics/firebase_analytics_service.dart';

import '../../../../../setup_firebase_mocks.dart';
import 'forgot_password_controller_test.mocks.dart';

@GenerateMocks([ForgotPasswordRepositoryInterface, FirebaseAnalyticsService])
void main() {
  setupCloudFirestoreMocks();

  initModules([ForgotPasswordModule()]);
  ForgotPasswordRepositoryInterface repository =
      MockForgotPasswordRepositoryInterface();
  FirebaseAnalyticsService analytics = MockFirebaseAnalyticsService();
  late ForgotPasswordController controller;

  setUpAll(() async {
    await Firebase.initializeApp();
    when(repository.forgotPassword('')).thenAnswer((_) async => '');
    controller = ForgotPasswordController(
        forgotPasswordRepository: repository, analytics: analytics);
  });

  test('setError', () {
    var str = 'test';
    controller.setError(str);
    expect(controller.errors, str);
  });

  test('setCode', () {
    var str = 'test';
    controller.setCode(str);
    expect(controller.code, str);
  });

  test('setEmail', () {
    var str = 'test';
    controller.setEmail(str);
    expect(controller.username, str);
  });

  test('setEmail if not contains @', () {
    var str = '17.00163-3';
    controller.setEmail(str);
    expect(controller.username, '17001633');
  });

  test('validateEmail if is empty', () {
    var str = '';
    expect(controller.validateEmail(str), "         Campo obrigatório");
  });

  test('validateEmail if CPF is valid : false', () {
    var str = '1234567';
    expect(controller.validateEmail(str), "         E-mail inválido");
  });

  test('validateEmail if CPF is valid : true', () {
    var str = '498.461.298-31';
    expect(controller.validateEmail(str), null);
  });

  test('setIsLoading', () {
    controller.setIsLoading(true);
    expect(controller.isLoading, true);
  });

  test('setPassword', () {
    var str = 'test';
    controller.setPassword(str);
    expect(controller.password, str);
  });

  test('setVerifyPassword', () {
    var str = 'test';
    controller.setVerifyPassword(str);
    expect(controller.verifyPassword, str);
  });

  test('setSuccessRegistration', () {
    controller.setSuccessRegistration(true);
    expect(controller.successRegistration, true);
  });

  test('validateVerifyPassword if is empty', () {
    var str = '';
    expect(
        controller.validateVerifyPassword(str), "         Campo obrigatório");
  });

  test('validateVerifyPassword if is equal to password', () {
    controller.password = '123';
    var str = '1234';
    expect(controller.validateVerifyPassword(str),
        "         Digite a mesma senha");
  });

  test('toggleVisibilityPwd', () {
    controller.toggleVisibilityPwd(true);
    expect(controller.showPwd, false);
  });

  test('toggleVisibilityConfirmPwd', () {
    controller.toggleVisibilityConfirmPwd(true);
    expect(controller.showConfirmPwd, false);
  });
}
