// ignore_for_file: file_names

import 'dart:ui';

import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:smile_front/app/app_module.dart';
import 'package:smile_front/app/modules/auth/domain/repositories/secure_storage_interface.dart';
import 'package:smile_front/app/modules/auth/domain/usecases/login_with_email.dart';
import 'package:smile_front/app/modules/auth/presenter/controllers/auth_controller.dart';
import 'package:smile_front/app/modules/auth/domain/usecases/refresh_token.dart';

import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart';
import 'package:smile_front/app/modules/login/presenter/controllers/login_controller.dart';

import 'package:smile_front/generated/l10n.dart';
import 'login_controller_test.mocks.dart';

@GenerateMocks([
  ActivitiesRepositoryInterface,
  RefreshTokenInterface,
  SecureStorageInterface,
  LoginWithEmailInterface
])
void main() {
  initModule(AppModule());

  LoginWithEmailInterface loginWithEmail = MockLoginWithEmailInterface();
  RefreshTokenInterface refreshToken = MockRefreshTokenInterface();
  SecureStorageInterface storage = MockSecureStorageInterface();

  late LoginController controller;
  late AuthController authController;

  setUpAll(() async {
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
    authController = AuthController(
      refreshToken: refreshToken,
      storage: storage,
      loginWithEmail: loginWithEmail,
    );
    controller = LoginController(
      authController: authController,
    );
  });

  test('setUsername if contains @ and Upper Case : email', () {
    var email = 'G@gmail.com';
    controller.setUsername(email);
    expect(controller.email, email.toLowerCase());
  });

  test('setPassword', () {
    var psw = '123';
    controller.setPassword(psw);
    expect(controller.password, psw);
  });

  test('setIsLoading', () {
    controller.setIsLoading(true);
    expect(controller.isLoading, true);
  });

  test('validateCpf if contains @', () {
    expect(controller.validateEmail('g@gmail.com'), null);
  });

  test('validateCpf if is empty : String Error Message', () {
    expect(controller.validateEmail(''), isA<String>());
  });

  test('validateCpf if CPF is valid : String Error Message', () {
    expect(controller.validateEmail('123.456.678-9'), isA<String>());
  });

  test('validateField if is empty : String Error Message', () {
    expect(controller.validateField(''), isA<String>());
  });

  test('validateField if is ok', () {
    expect(controller.validateField('123'), null);
  });

  test('toggleVisibilityPwd', () {
    controller.toggleVisibilityPwd(true);
    expect(controller.showPwd, false);
  });
}
