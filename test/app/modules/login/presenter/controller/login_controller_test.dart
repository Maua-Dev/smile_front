// ignore_for_file: file_names

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:smile_front/app/app_module.dart';
import 'package:smile_front/app/modules/auth/domain/repositories/secure_storage_interface.dart';
import 'package:smile_front/app/modules/auth/presenter/controllers/auth_controller.dart';
import 'package:smile_front/app/modules/auth/usecases/refresh_token.dart';

import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart';
import 'package:smile_front/app/modules/login/presenter/controllers/login_controller.dart';
import 'package:smile_front/app/shared/services/firebase-analytics/firebase_analytics_service.dart';
import '../../../../../setup_firebase_mocks.dart';
import '../../../auth/presenter/controllers/auth_controller_test.mocks.dart';
import '../../../dashboard/presenter/controller/adm/adm_dashboard_controller_test.mocks.dart';

@GenerateMocks([ActivitiesRepositoryInterface, FirebaseAnalyticsService])
void main() {
  initModule(AppModule());
  setupCloudFirestoreMocks();
  MockLoginWithCpfRneInterface loginWithCpfRne = MockLoginWithCpfRneInterface();
  RefreshTokenInterface refreshToken = MockRefreshTokenInterface();
  SecureStorageInterface storage = MockSecureStorageInterface();
  FirebaseAnalyticsService analytics = MockFirebaseAnalyticsService();

  late LoginController controller;
  late AuthController authController;

  setUpAll(() async {
    await Firebase.initializeApp();
    authController = AuthController(
        refreshToken: refreshToken,
        storage: storage,
        analytics: analytics,
        loginWithCpfRne: loginWithCpfRne);
    controller =
        LoginController(authController: authController, analytics: analytics);
  });

  test('setUsername if contains @ and Upper Case : email', () {
    var email = 'G@gmail.com';
    controller.setUsername(email);
    expect(controller.cpfRne, email.toLowerCase());
  });

  test('setUsername if contains "." and "-" : cpf', () {
    var email = '1.2-3';
    controller.setUsername(email);
    expect(controller.cpfRne, '123');
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
    expect(controller.validateCpf('g@gmail.com'), null);
  });

  test('validateCpf if is empty', () {
    expect(controller.validateCpf(''), "         Campo obrigatório");
  });

  test('validateCpf if CPF is valid', () {
    expect(controller.validateCpf('123.456.678-9'), "         CPF inválido");
  });

  test('validateField if is empty', () {
    expect(controller.validateField(''), "         Campo obrigatório");
  });

  test('validateField if is ok', () {
    expect(controller.validateField('123'), null);
  });

  test('toggleVisibilityPwd', () {
    controller.toggleVisibilityPwd(true);
    expect(controller.showPwd, false);
  });
}
