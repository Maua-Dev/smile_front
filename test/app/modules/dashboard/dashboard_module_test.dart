import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smile_front/app/app_module.dart';
import 'package:smile_front/app/modules/dashboard/dashboard_module.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart';
import 'package:smile_front/app/modules/dashboard/external/activities_datasource_impl.dart';
import 'package:smile_front/app/modules/dashboard/infra/datasources/activities_datasource.dart';
import 'package:smile_front/app/modules/dashboard/infra/repository/activities_repository_impl.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/dashboard_controller.dart';

void main() {
  initModules([AppModule(), DashboardModule()]);

  test('ActivitiesDatasourceImpl Injection', () {
    var datasource = Modular.get<ActivitiesDatasourceImpl>();
    expect(datasource.dioClient, isInstanceOf<Dio>());
  });

  test('ActivitiesRepositoryImpl Injection', () {
    var repository = Modular.get<ActivitiesRepositoryImpl>();
    expect(repository.datasource, isInstanceOf<ActivitiesDatasource>());
  });
}
