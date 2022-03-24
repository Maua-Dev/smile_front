import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smile_front/app/app_module.dart';
import 'package:smile_front/app/modules/auth/presenter/controllers/auth_controller.dart';
import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart';
import 'package:smile_front/app/modules/dashboard/infra/datasources/activities_datasource.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/all_activities_user_dashboard_controller.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/user_dashboard_controller.dart';
import 'package:smile_front/app/modules/dashboard/user_module.dart';

void main() {
  initModules([AppModule(), UserModule()]);

  setUp(() async {
    await Modular.isModuleReady<AppModule>();
  });

  test('AllActivitiesUserDashboardController Injection', () {
    Modular.get<AllActivitiesUserDashboardController>();
  });

  test('ActivitiesDatasource Injection', () {
    Modular.get<ActivitiesDatasource>();
  });

  test('ActivitiesRepositoryInterface Injection', () {
    Modular.get<ActivitiesRepositoryInterface>();
  });

  test('UserDashboardController Injection', () {
    Modular.get<UserDashboardController>();
  });

  test('AuthController Injection', () {
    Modular.get<AuthController>();
  });

  test('Dio Injection', () {
    Modular.get<Dio>();
  });
}
