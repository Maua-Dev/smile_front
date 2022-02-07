import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/dashboard/dashboard_module.dart';
import 'package:smile_front/app/modules/logged-adm-home/domain/repositories/future_activity_repository.dart';
import 'package:smile_front/app/modules/logged-adm-home/domain/repositories/logged_adm_repository.dart';
import 'package:smile_front/app/modules/logged-adm-home/external/logged_user_datasource_impl.dart';
import 'package:smile_front/app/modules/logged-adm-home/infra/datasources/logged_user_datasource.dart';
import 'package:smile_front/app/modules/logged-adm-home/infra/repository/future_activity_repository_impl.dart';
import 'package:smile_front/app/modules/logged-adm-home/infra/repository/logged_user_repository_impl.dart';
import 'package:smile_front/app/modules/logged-adm-home/ui/logged_adm_home_page.dart';
import 'package:smile_front/app/modules/logged-adm-home/presenter/controllers/logged_home_controller.dart';

import '../logged-adm-home/external/future_activity_datasource_impl.dart';
import '../logged-adm-home/infra/datasources/future_activity_datasource.dart';

class LoggedAdmHomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<FutureActivityDatasource>(
        (i) => FutureActivityDatasourceImpl()),
    Bind.lazySingleton<FutureActivityRepository>(
        (i) => FutureActivityRepositoryImpl(datasource: i())),
    Bind.lazySingleton<LoggedAdmDatasource>(
        (i) => LoggedAdmDatasourceImpl(i())),
    Bind.lazySingleton<LoggedAdmRepository>(
        (i) => LoggedAdmRepositoryImpl(datasource: i())),
    Bind.lazySingleton<LoggedHomeController>((i) => LoggedHomeController(
        loggedHomeRepository: i(), futureActivityRepository: i())),
  ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const LoggedAdmHomePage()),
    ModuleRoute('/filter-dashboard', module: DashboardModule())
  ];
}
