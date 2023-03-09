import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smile_front/app/app_module.dart';
import 'package:smile_front/app/modules/auth/auth_module.dart';
import 'package:smile_front/app/modules/auth/domain/repositories/auth_repository_interface.dart';
import 'package:smile_front/app/modules/auth/infra/datasource/auth_datasource_interface.dart';
import 'package:smile_front/app/modules/home/home_module.dart';
import 'package:smile_front/app/modules/login/login_module.dart';
import 'package:smile_front/app/modules/login/presenter/controllers/login_controller.dart';

void main() {
  initModules([LoginModule(), AppModule(), HomeModule(), AuthModule()]);

  setUpAll(() async {
    await Modular.isModuleReady<AuthModule>();
  });

  test('LoginController Injection', () {
    Modular.get<LoginController>();
  });

  test('AuthDatasourceImpl Injection', () {
    Modular.get<AuthDatasourceInterface>();
  });

  test('AuthRepositoryImpl Injection', () {
    Modular.get<AuthRepositoryInterface>();
  });

  test('Dio Injection', () {
    Modular.get<Dio>();
  });
}
