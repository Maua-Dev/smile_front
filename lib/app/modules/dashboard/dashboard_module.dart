import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart';
import 'package:smile_front/app/modules/dashboard/external/activities_datasource_impl.dart';
import 'package:smile_front/app/modules/dashboard/infra/datasources/activities_datasource.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/dashboard_controller.dart';
import 'package:smile_front/app/modules/dashboard/ui/dashboard_activities_page.dart';
import 'package:smile_front/app/modules/dashboard/ui/filter_dashboard_page.dart';

import 'infra/repository/activities_repository_impl.dart';

class DashboardModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<ActivitiesDatasource>(
        (i) => ActivitiesDatasourceImpl(i())),
    Bind.lazySingleton<ActivitiesRepositoryInterface>(
        (i) => ActivitiesRepositoryImpl(datasource: i())),
    Bind.lazySingleton<DashboardController>(
      (i) => DashboardController(
          repository: i(),
          activityType: i.args!.data[0] as ActivityEnum,
          accessLevel: i.args!.data[1] as String),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => FilterDashboardPage(accessLevel: args.data as String),
    ),
    ChildRoute('/activities-dashboard',
        child: (_, args) => const DashboardActivitiesPage()),
  ];
}
