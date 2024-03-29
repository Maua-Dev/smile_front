import 'dart:ui';

import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smile_front/app/modules/forgot-password/domain/repository/forgot_password_datasource_interface.dart';
import 'package:smile_front/app/modules/forgot-password/domain/usecases/change_password.dart';
import 'package:smile_front/app/modules/forgot-password/domain/usecases/forgot_password.dart';
import 'package:smile_front/app/modules/forgot-password/forgot_password_module.dart';
import 'package:smile_front/app/modules/forgot-password/presenter/controller/forgot_password_controller.dart';

import 'package:smile_front/generated/l10n.dart';

import 'forgot_password_controller_test.mocks.dart';

@GenerateMocks([
  ForgotPasswordRepositoryInterface,
  ForgotPasswordInterface,
  ChangePasswordInterface,
])
void main() {
  initModules([ForgotPasswordModule()]);
  ForgotPasswordInterface forgotPassword = MockForgotPasswordInterface();

  ChangePasswordInterface changePassword = MockChangePasswordInterface();
  late ForgotPasswordController controller;

  setUpAll(() async {
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
    when(forgotPassword('')).thenAnswer((_) async => '');

    controller = ForgotPasswordController(
        forgotPassword: forgotPassword, changePassword: changePassword);
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

  test('validateEmail if is empty : String Error Message', () {
    var str = '';
    expect(controller.validateEmail(str), isA<String>());
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

  test('validateVerifyPassword if is empty : String Error Message', () {
    var str = '';
    expect(controller.validateVerifyPassword(str), isA<String>());
  });

  test('validateVerifyPassword if is equal to password : String Error Message',
      () {
    controller.password = '123';
    var str = '1234';
    expect(controller.validateVerifyPassword(str), isA<String>());
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
