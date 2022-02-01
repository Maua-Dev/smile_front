import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/dashboard/dashboard_module.dart';
import 'package:smile_front/app/modules/logged-home/presenter/controllers/logged_home_controller.dart';
import 'package:smile_front/app/modules/logged-home/ui/logged_adm_home_page.dart';
import 'package:smile_front/app/modules/logged-home/ui/logged_user_home_page.dart';

import 'domain/repositories/future_activity_repository.dart';
import 'domain/repositories/logged_user_repository.dart';
import 'external/future_activity_datasource_impl.dart';
import 'external/logged_user_datasource_impl.dart';
import 'infra/datasources/future_activity_datasource.dart';
import 'infra/datasources/logged_user_datasource.dart';
import 'infra/repository/future_activity_repository_impl.dart';
import 'infra/repository/logged_user_repository_impl.dart';

class LoggedHomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<FutureActivityDatasource>(
        (i) => FutureActivityDatasourceImpl()),
    Bind.lazySingleton<FutureActivityRepository>(
        (i) => FutureActivityRepositoryImpl(datasource: i())),
    Bind.lazySingleton<LoggedUserDatasource>(
        (i) => LoggedUserDatasourceImpl(i())),
    Bind.lazySingleton<LoggedUserRepository>(
        (i) => LoggedUserRepositoryImpl(datasource: i())),
    Bind.lazySingleton<LoggedHomeController>((i) => LoggedHomeController(
        loggedHomeRepository: i(), futureActivityRepository: i())),
  ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/user-home', child: (_, args) => const LoggedUserHomePage()),
    ChildRoute('/adm-home', child: (_, args) => const LoggedAdmHomePage()),
    ModuleRoute('/filter-dashboard', module: DashboardModule())
  ];
}
