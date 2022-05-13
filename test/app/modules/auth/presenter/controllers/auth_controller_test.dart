import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smile_front/app/modules/auth/domain/repositories/auth_repository_interface.dart';
import 'package:smile_front/app/modules/auth/domain/repositories/secure_storage_interface.dart';
import 'package:smile_front/app/modules/auth/presenter/controllers/auth_controller.dart';
import 'package:smile_front/app/shared/services/firebase-analytics/firebase_analytics_service.dart';

import '../../../../../setup_firebase_mocks.dart';
import 'auth_controller_test.mocks.dart';

@GenerateMocks(
    [AuthRepositoryInterface, SecureStorageInterface, FirebaseAnalyticsService])
void main() {
  setupCloudFirestoreMocks();
  AuthRepositoryInterface authRepository = MockAuthRepositoryInterface();
  SecureStorageInterface storage = MockSecureStorageInterface();
  FirebaseAnalyticsService analytics = MockFirebaseAnalyticsService();
  late AuthController controller;

  var loginWithCpfRne = {
    'access_token': 'token12354',
    'refresh_token': 'refreshToken342315',
    'access_level': 'ADMIN',
    'id': '',
    'name': 'Test',
    'social_name': 'Test',
    'certificate_with_social_name': true
  };

  setUpAll(() async {
    await Firebase.initializeApp();
    when(authRepository.login('adm', 'teste'))
        .thenAnswer((_) async => loginWithCpfRne);
    when(analytics.setUserProperties('')).thenAnswer((_) async => null);
    controller = AuthController(
        authRepository: authRepository, storage: storage, analytics: analytics);
  });

  test('loginWithCpfRne', () async {
    await controller.loginWithCpfRne('adm', 'teste');
    expect(controller.isLogged, true);
    expect(controller.accessLevel, loginWithCpfRne['access_level']);
    expect(controller.name, loginWithCpfRne['name']);
    expect(controller.socialname, loginWithCpfRne['social_name']);
  });

  test('logout', () async {
    await controller.logout();
    expect(controller.isLogged, false);
  });
}
