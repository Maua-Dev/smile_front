import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smile_front/app/modules/auth/domain/repositories/auth_repository_interface.dart';
import 'package:smile_front/app/modules/auth/domain/repositories/secure_storage_interface.dart';
import 'package:smile_front/app/modules/auth/presenter/controllers/auth_controller.dart';

import 'auth_controller_test.mocks.dart';

@GenerateMocks([AuthRepositoryInterface, SecureStorageInterface])
void main() {
  AuthRepositoryInterface authRepository = MockAuthRepositoryInterface();
  SecureStorageInterface storage = MockSecureStorageInterface();
  late AuthController controller;

  var loginWithEmail = {'token': 'token12354', 'accessLevel': 'ADMIN'};

  setUpAll(() {
    when(authRepository.login('adm', 'teste'))
        .thenAnswer((_) async => loginWithEmail);
    controller =
        AuthController(authRepository: authRepository, storage: storage);
  });

  test('loginWithCpfRne', () async {
    await controller.loginWithCpfRne('adm', 'teste');
    expect(controller.isLogged, true);
  });

  test('logout', () async {
    await controller.logout();
    expect(controller.isLogged, false);
  });
}
