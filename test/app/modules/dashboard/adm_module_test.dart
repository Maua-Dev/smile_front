import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smile_front/app/app_module.dart';
import 'package:smile_front/app/modules/auth/presenter/controllers/auth_controller.dart';
import 'package:smile_front/app/modules/dashboard/adm_module.dart';
import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart';
import 'package:smile_front/app/modules/dashboard/infra/datasources/activities_datasource_interface.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/adm/create_activity_controller.dart';

import '../../../setup_firebase_mocks.dart';

void main() {
  initModules([AppModule(), AdmModule()]);

  setupCloudFirestoreMocks();

  setUp(() async {
    await Modular.isModuleReady<AppModule>();
    await Modular.isModuleReady<AdmModule>();
    await Firebase.initializeApp();
  });

  test('CreateActivityController Injection', () {
    Modular.get<CreateActivityController>();
  });

  test('ActivitiesDatasource Injection', () {
    Modular.get<ActivitiesDatasourceInterface>();
  });

  test('ActivitiesRepositoryInterface Injection', () {
    Modular.get<ActivitiesRepositoryInterface>();
  });

  test('AuthController Injection', () {
    Modular.get<AuthController>();
  });

  test('Dio Injection', () {
    Modular.get<Dio>();
  });
}
