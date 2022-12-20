import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_test/modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smile_front/app/app_module.dart';
import 'package:smile_front/app/modules/auth/auth_module.dart';
import 'package:smile_front/app/modules/auth/domain/repositories/auth_repository_interface.dart';
import 'package:smile_front/app/modules/auth/domain/repositories/secure_storage_interface.dart';
import 'package:smile_front/app/modules/auth/external/auth_datasource_impl.dart';
import 'package:smile_front/app/modules/auth/presenter/controllers/auth_controller.dart';
import '../../../setup_firebase_mocks.dart';

void main() {
  initModules([AuthModule(), AppModule()]);
  setupCloudFirestoreMocks();

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
    expect(test.authRepository, isInstanceOf<AuthRepositoryInterface>());
  });

  test('AuthDatasourceImpl Injection', () async {
    await Modular.isModuleReady<AuthModule>();
    var test = Modular.get<AuthDatasourceImpl>();
    expect(test.dioClient, isInstanceOf<Dio>());
  });
}
