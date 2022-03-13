import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/adm/adm_dashboard_controller.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/adm/edit_activity_controller.dart';
import 'package:smile_front/app/modules/dashboard/ui/adm/adm_dashboard_page.dart';
import 'package:smile_front/app/modules/dashboard/ui/adm/edit_activity_page.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';

import '../../shared/services/dio/smile_activities_options.dart';
import 'domain/repositories/activities_repository_interface.dart';
import 'external/activities_datasource_impl.dart';
import 'infra/datasources/activities_datasource.dart';
import 'infra/repository/activities_repository_impl.dart';

class AdmModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<AdmDashboardController>(
      (i) => AdmDashboardController(
          repository: i(), accessLevel: i.args!.data[1] as String),
    ),
    Bind.lazySingleton<EditActivityController>(
      (i) => EditActivityController(
          repository: i(), activity: i.args!.data as ActivityModel),
    ),
    Bind.lazySingleton<ActivitiesDatasource>(
        (i) => ActivitiesDatasourceImpl(i())),
    Bind.lazySingleton<ActivitiesRepositoryInterface>(
        (i) => ActivitiesRepositoryImpl(datasource: i())),
    Bind.lazySingleton((i) => Dio(smileOption)),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => const AdmDashboardPage()),
    ChildRoute('/edit-activity', child: (_, args) => const EditActivityPage())
  ];
}
