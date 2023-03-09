import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smile_front/app/app_module.dart';
import 'package:smile_front/app/modules/auth/auth_module.dart';
import 'package:smile_front/app/modules/auth/domain/repositories/secure_storage_interface.dart';
import 'package:smile_front/app/modules/auth/presenter/controllers/auth_controller.dart';
import 'package:smile_front/app/modules/auth/domain/usecases/login_with_email.dart';
import 'package:smile_front/app/modules/auth/domain/usecases/refresh_token.dart';

void main() {
  initModules([AuthModule(), AppModule()]);

  setUpAll(() async {
    await Firebase.initializeApp();
  });

  test('SecureStorage Injection', () async {
    await Modular.isModuleReady<AuthModule>();
    Modular.get<SecureStorageInterface>();
  });

  test('AuthController Injection', () async {
    await Modular.isModuleReady<AppModule>();
    await Modular.isModuleReady<AuthModule>();
    var test = Modular.get<AuthController>();
    expect(test.refreshToken, isInstanceOf<RefreshTokenInterface>());
    expect(test.loginWithEmail, isInstanceOf<LoginWithEmailInterface>());
  });
}
