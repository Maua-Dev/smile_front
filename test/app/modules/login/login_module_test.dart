import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smile_front/app/app_module.dart';
import 'package:smile_front/app/modules/auth/domain/repositories/auth_repository_interface.dart';
import 'package:smile_front/app/modules/auth/infra/datasource/auth_datasource_interface.dart';
import 'package:smile_front/app/modules/login/login_module.dart';

void main() {
  initModules([LoginModule(), AppModule()]);

  test('AuthDatasource Injection', () {
    Modular.get<AuthDatasourceInterface>();
  });

  test('AuthRepositoryInterface Injection', () {
    Modular.get<AuthRepositoryInterface>();
  });

  test('Dio Injection', () {
    Modular.get<Dio>();
  });
}
