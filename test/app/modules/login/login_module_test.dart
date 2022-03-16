import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smile_front/app/app_module.dart';
import 'package:smile_front/app/modules/auth/external/auth_datasource_impl.dart';
import 'package:smile_front/app/modules/auth/infra/datasource/auth_datasource.dart';
import 'package:smile_front/app/modules/auth/infra/repositories/auth_repository_impl.dart';
import 'package:smile_front/app/modules/dashboard/user_module.dart';

void main() {
  initModules([AppModule(), UserModule()]);

  test('AuthDatasourceImpl Injection', () {
    var datasource = Modular.get<AuthDatasourceImpl>();
    expect(datasource.dioClient, isInstanceOf<Dio>());
  });

  test('ActivitiesRepositoryImpl Injection', () {
    var repository = Modular.get<AuthRepositoryImpl>();
    expect(repository.datasource, isInstanceOf<AuthDatasource>());
  });
}
