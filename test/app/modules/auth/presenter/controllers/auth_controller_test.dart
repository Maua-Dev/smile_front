import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smile_front/app/modules/auth/domain/repositories/auth_repository_interface.dart';
import 'package:smile_front/app/modules/auth/domain/repositories/secure_storage_interface.dart';
import 'package:smile_front/app/modules/auth/presenter/controllers/auth_controller.dart';

import 'auth_controller_test.mocks.dart';

@GenerateMocks([
  AuthRepositoryInterface,
  SecureStorageInterface,
])
void main() {
  AuthRepositoryInterface authRepository = MockAuthRepositoryInterface();
  SecureStorageInterface storage = MockSecureStorageInterface();

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
    when(authRepository.login('adm', 'teste'))
        .thenAnswer((_) async => loginWithCpfRne);
    when(storage.getAccessLevel()).thenAnswer((_) async => 'ADMIN');
    when(storage.getId()).thenAnswer((_) async => '');
    when(storage.getAccessToken()).thenAnswer((_) async => 'token12354');
    when(storage.getRefreshToken())
        .thenAnswer((_) async => 'refreshToken342315');
    controller =
        AuthController(authRepository: authRepository, storage: storage);
  });

  test('loginWithCpfRne', () async {
    await controller.loginWithCpfRne('adm', 'teste');
    expect(controller.isLogged, true);
    expect(controller.accessLevel, loginWithCpfRne['access_level']);
    expect(controller.name, loginWithCpfRne['name']);
    expect(controller.socialname, loginWithCpfRne['social_name']);
    expect(controller.id, loginWithCpfRne['id']);
    expect(controller.certificateWithSocialName,
        loginWithCpfRne['certificate_with_social_name']);
  });

  test('logout', () async {
    await controller.logout();
    expect(controller.isLogged, false);
  });

  test('verifyIfHaveTokens when logged', () async {
    await controller.verifyIfHaveTokens();
    expect(controller.isLogged, true);
    expect(controller.accessLevel, loginWithCpfRne['access_level']);
  });
}
