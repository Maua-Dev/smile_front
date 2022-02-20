import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/dashboard/dashboard_module.dart';
import 'package:smile_front/app/modules/logged-home/domain/repositories/future_activity_repository_interface.dart';
import 'package:smile_front/app/modules/logged-home/infra/repository/future_activity_repository_impl.dart';
import 'package:smile_front/app/modules/logged-home/ui/logged_adm_home_page.dart';
import 'package:smile_front/app/modules/logged-home/presenter/controllers/logged_home_controller.dart';

import '../logged-home/external/future_activity_datasource_impl.dart';
import '../logged-home/infra/datasources/future_activity_datasource.dart';
import '../logged-home/domain/repositories/user_repository_interface.dart';
import '../logged-home/external/user_datasource_impl.dart';
import '../logged-home/infra/datasources/user_datasource.dart';
import '../logged-home/infra/repository/user_repository_impl.dart';

class LoggedAdmHomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<FutureActivityDatasource>(
        (i) => FutureActivityDatasourceImpl()),
    Bind.lazySingleton<FutureActivityRepositoryInterface>(
        (i) => FutureActivityRepositoryImpl(datasource: i())),
    Bind.lazySingleton<UserDatasource>(
        (i) => UserDatasourceImpl(dioClient: i())),
    Bind.lazySingleton<UserRepositoryInterface>(
        (i) => UserRepositoryImpl(datasource: i())),
    Bind.lazySingleton<LoggedHomeController>(
      (i) => LoggedHomeController(
          userRepository: i(),
          futureActivityRepository: i(),
          cpfRne: i.args!.data as String),
    )
  ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => const LoggedAdmHomePage()),
    ModuleRoute('/filter-dashboard', module: DashboardModule())
  ];
}
