// ignore_for_file: file_names

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:smile_front/app/modules/auth/domain/repositories/auth_repository_interface.dart';
import 'package:smile_front/app/modules/auth/domain/repositories/secure_storage_interface.dart';
import 'package:smile_front/app/modules/auth/infra/repositories/auth_repository_mock.dart';

import 'package:smile_front/app/modules/auth/presenter/controllers/auth_controller.dart';

import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart';
import 'package:smile_front/app/modules/login/presenter/controllers/login_controller.dart';
import 'package:smile_front/app/shared/services/firebase-analytics/firebase_analytics_service.dart';
import '../../../auth/presenter/controllers/auth_controller_test.mocks.dart';

@GenerateMocks([ActivitiesRepositoryInterface])
void main() {
  AuthRepositoryInterface repository = AuthRepositoryMock();
  SecureStorageInterface storage = MockSecureStorageInterface();
  FirebaseAnalyticsService analytics = FirebaseAnalyticsService();

  late LoginController controller;
  late AuthController authController;

  setUpAll(() {
    authController = AuthController(
        authRepository: repository, storage: storage, analytics: analytics);
    controller =
        LoginController(authController: authController, analytics: analytics);
  });

  test('isLoading', () {
    var test = controller.isLoading;
    expect(test, false);
  });

  test('isLoading', () {
    var test = controller.cpfRne;
    expect(test, '');
  });

  test('isLoading', () {
    var test = controller.password;
    expect(test, '');
  });

  test('isLoading', () {
    var test = controller.errors;
    expect(test, '');
  });

  test('setUsername', () {
    var str = '57647604023';
    controller.setUsername(str);
    expect(controller.cpfRne, str);
  });

  test('setPassword', () {
    var str = 'senhaMuitoForte123';
    controller.setPassword(str);
    expect(controller.password, str);
  });

  test('setError', () {
    var str = 'Senha inválida';
    controller.setError(str);
    expect(controller.errors, str);
  });

  test('setIsLoading', () {
    var str = true;
    controller.setIsLoading(str);
    expect(controller.isLoading, str);
  });
}
