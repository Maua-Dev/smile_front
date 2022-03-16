import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smile_front/app/app_module.dart';
import 'package:smile_front/app/modules/auth/auth_module.dart';
import 'package:smile_front/app/modules/auth/domain/repositories/auth_repository_interface.dart';
import 'package:smile_front/app/modules/auth/domain/repositories/secure_storage_interface.dart';
import 'package:smile_front/app/modules/auth/external/auth_datasource_impl.dart';
import 'package:smile_front/app/modules/auth/infra/repositories/auth_repository_mock.dart';
import 'package:smile_front/app/modules/auth/presenter/controllers/auth_controller.dart';

void main() {
  initModules([AuthModule(), AppModule()]);

  test('SecureStorage Injection', () async {
    await Modular.isModuleReady<AuthModule>();
    Modular.get<SecureStorageInterface>();
  });

  test('AuthController Injection', () async {
    await Modular.isModuleReady<AuthModule>();
    var test = Modular.get<AuthController>();
    expect(test.authRepository, isInstanceOf<AuthRepositoryInterface>());
  });

  test('AuthRepositoryMock Injection', () {
    Modular.get<AuthRepositoryMock>();
  });

  test('AuthDatasourceImpl Injection', () {
    var test = Modular.get<AuthDatasourceImpl>();
    expect(test.dioClient, isInstanceOf<Dio>());
  });
}
