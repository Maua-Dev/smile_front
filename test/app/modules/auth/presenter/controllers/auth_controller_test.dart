import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smile_front/app/modules/auth/domain/repositories/auth_repository_interface.dart';
import 'package:smile_front/app/modules/auth/domain/repositories/secure_storage_interface.dart';
import 'package:smile_front/app/modules/auth/presenter/controllers/auth_controller.dart';
import 'package:smile_front/app/modules/auth/usecases/login_with_cpf_rne.dart';
import 'package:smile_front/app/modules/auth/usecases/refresh_token.dart';
import 'package:smile_front/app/shared/services/firebase-analytics/firebase_analytics_service.dart';

import '../../../../../setup_firebase_mocks.dart';
import 'auth_controller_test.mocks.dart';

@GenerateMocks([
  AuthRepositoryInterface,
  SecureStorageInterface,
  FirebaseAnalyticsService,
  RefreshTokenInterface,
  LoginWithCpfRneInterface,
])
void main() {
  setupCloudFirestoreMocks();
  AuthRepositoryInterface authRepository = MockAuthRepositoryInterface();
  SecureStorageInterface storage = MockSecureStorageInterface();
  RefreshTokenInterface refreshToken = MockRefreshTokenInterface();
  LoginWithCpfRneInterface loginWithCpfRne = MockLoginWithCpfRneInterface();
  FirebaseAnalyticsService analytics = MockFirebaseAnalyticsService();
  late AuthController controller;

  var loginWithUserCpfRne = {
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
        .thenAnswer((_) async => loginWithUserCpfRne);
    when(analytics.setUserProperties('')).thenAnswer((_) async => null);
    when(storage.getAccessLevel()).thenAnswer((_) async => 'ADMIN');
    when(storage.getId()).thenAnswer((_) async => '');
    when(storage.getAccessToken()).thenAnswer((_) async => 'token12354');
    when(storage.getRefreshToken())
        .thenAnswer((_) async => 'refreshToken342315');
    controller = AuthController(
        refreshToken: refreshToken,
        storage: storage,
        analytics: analytics,
        loginWithCpfRne: loginWithCpfRne);
  });

  test('loginWithCpfRne', () async {
    await controller.loginWithCpfRne('adm', 'teste');
    expect(controller.isLogged, true);
    expect(controller.accessLevel, loginWithUserCpfRne['access_level']);
    expect(controller.name, loginWithUserCpfRne['name']);
    expect(controller.socialname, loginWithUserCpfRne['social_name']);
    expect(controller.id, loginWithUserCpfRne['id']);
    expect(controller.certificateWithSocialName,
        loginWithUserCpfRne['certificate_with_social_name']);
  });

  test('logout', () async {
    await controller.logout();
    expect(controller.isLogged, false);
  });

  test('verifyIfHaveTokens when logged', () async {
    await controller.verifyIfHaveTokens();
    expect(controller.isLogged, true);
    expect(controller.accessLevel, loginWithUserCpfRne['access_level']);
  });
}
