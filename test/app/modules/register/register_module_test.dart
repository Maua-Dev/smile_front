import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_test/modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smile_front/app/app_module.dart';
import 'package:smile_front/app/modules/register/domain/repositories/register_informations_repository_interface.dart';
import 'package:smile_front/app/modules/register/infra/datasources/register_datasource_interface.dart';
import 'package:smile_front/app/modules/register/presenter/controllers/register_controller.dart';
import 'package:smile_front/app/modules/register/register_module.dart';

import '../../../setup_firebase_mocks.dart';

void main() {
  initModules([
    RegisterModule(),
    AppModule(),
  ]);
  setupCloudFirestoreMocks();

  setUpAll(() async {
    await Firebase.initializeApp();
  });

  test('RegisterController Injection', () {
    Modular.get<RegisterController>();
  });

  test('RegisterDatasourceImpl Injection', () {
    Modular.get<RegisterDatasourceInterface>();
  });

  test('RegisterRepositoryInterface Injection', () {
    Modular.get<RegisterRepositoryInterface>();
  });

  test('Dio Injection', () {
    Modular.get<Dio>();
  });
}
