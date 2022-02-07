import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/dashboard/dashboard_module.dart';
import 'package:smile_front/app/modules/logged-user-home/presenter/controllers/logged_home_controller.dart';
import 'package:smile_front/app/modules/logged-user-home/ui/logged_user_home_page.dart';

import '../logged-user-home/domain/repositories/logged_user_repository.dart';
import '../logged-user-home/external/logged_user_datasource_impl.dart';
import '../logged-user-home/infra/datasources/logged_user_datasource.dart';
import '../logged-user-home/infra/repository/logged_user_repository_impl.dart';

class LoggedUserHomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<LoggedUserDatasource>(
        (i) => LoggedUserDatasourceImpl(i())),
    Bind.lazySingleton<LoggedUserRepository>(
        (i) => LoggedUserRepositoryImpl(datasource: i())),
    Bind.lazySingleton<LoggedHomeController>(
        (i) => LoggedHomeController(loggedHomeRepository: i())),
  ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const LoggedUserHomePage()),
    ModuleRoute('/filter-dashboard', module: DashboardModule())
  ];
}
