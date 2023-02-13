import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smile_front/app/modules/auth/domain/repositories/secure_storage_interface.dart';
import 'package:smile_front/app/modules/auth/presenter/controllers/auth_controller.dart';
import 'package:smile_front/app/modules/auth/domain/usecases/login_with_email.dart';
import 'package:smile_front/app/modules/auth/domain/usecases/refresh_token.dart';
import 'package:smile_front/app/shared/entities/infra/access_level_enum.dart';
import 'package:smile_front/app/shared/entities/infra/user_roles_enum.dart';
import 'package:smile_front/app/shared/models/user_model.dart';
import 'package:smile_front/app/shared/services/firebase-analytics/firebase_analytics_service.dart';

import '../../../../../setup_firebase_mocks.dart';
import 'auth_controller_test.mocks.dart';

@GenerateMocks([
  SecureStorageInterface,
  FirebaseAnalyticsService,
  RefreshTokenInterface,
  LoginWithEmailInterface,
])
void main() {
  setupCloudFirestoreMocks();
  SecureStorageInterface storage = MockSecureStorageInterface();
  RefreshTokenInterface refreshToken = MockRefreshTokenInterface();
  LoginWithEmailInterface loginWithEmail = MockLoginWithEmailInterface();
  FirebaseAnalyticsService analytics = MockFirebaseAnalyticsService();
  late AuthController controller;

  UserModel userMock = UserModel(
    socialName: '',
    accessLevel: AccessLevelEnum.USER,
    email: 'email',
    role: UserRolesEnum.student,
    name: 'name',
    accessToken: 'access_token',
    idToken: 'id_token',
    phone: 'phone',
    refreshToken: 'refresh',
    userId: 'id',
    ra: 'ra',
    certificateWithSocialName: true,
  );

  var emailMock = '';
  var pwMock = '';

  setUpAll(() async {
    await Firebase.initializeApp();
    when(loginWithEmail(emailMock, pwMock)).thenAnswer((_) async => userMock);
    when(analytics.setUserProperties('')).thenAnswer((_) async => null);
    when(storage.getAccessLevel()).thenAnswer((_) async => 'USER');
    when(storage.getId()).thenAnswer((_) async => '');
    when(storage.getAccessToken()).thenAnswer((_) async => 'token12354');
    when(storage.getRefreshToken())
        .thenAnswer((_) async => 'refreshToken342315');
    controller = AuthController(
      refreshToken: refreshToken,
      storage: storage,
      analytics: analytics,
      loginWithEmail: loginWithEmail,
    );
  });

  test('loginWithCpfRne', () async {
    await controller.loginWithUserEmail(emailMock, pwMock);
    expect(controller.accessLevel, userMock.accessLevel);
    expect(controller.name, userMock.name);
    expect(controller.socialname, userMock.socialName);
    expect(controller.id, userMock.idToken);
    expect(controller.certificateWithSocialName,
        userMock.certificateWithSocialName);
    expect(controller.isLogged, true);
  });

  test('logout', () async {
    await controller.logout();
    expect(controller.isLogged, false);
  });

  test('verifyIfHaveTokens when logged', () async {
    await controller.verifyIfHaveTokens();
    expect(controller.isLogged, true);
    expect(controller.accessLevel, userMock.accessLevel);
  });
}
