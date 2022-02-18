import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/dashboard/dashboard_module.dart';
import 'package:smile_front/app/modules/logged-adm-home/domain/repositories/future_activity_repository.dart';
import 'package:smile_front/app/modules/logged-adm-home/infra/repository/future_activity_repository_impl.dart';
import 'package:smile_front/app/modules/logged-adm-home/ui/logged_adm_home_page.dart';
import 'package:smile_front/app/modules/logged-adm-home/presenter/controllers/logged_home_controller.dart';
import 'package:smile_front/app/shared/models/user_model.dart';

import '../logged-adm-home/external/future_activity_datasource_impl.dart';
import '../logged-adm-home/infra/datasources/future_activity_datasource.dart';
import '../logged-user-home/domain/repositories/user_repository_interface.dart';
import '../logged-user-home/external/user_datasource_impl.dart';
import '../logged-user-home/infra/datasources/user_datasource.dart';
import '../logged-user-home/infra/repository/user_repository_impl.dart';

class LoggedAdmHomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<FutureActivityDatasource>(
        (i) => FutureActivityDatasourceImpl()),
    Bind.lazySingleton<FutureActivityRepository>(
        (i) => FutureActivityRepositoryImpl(datasource: i())),
    Bind.lazySingleton<UserDatasource>((i) => UserDatasourceImpl(i())),
    Bind.lazySingleton<UserRepositoryInteface>((i) => UserRepositoryImpl(i())),
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
        child: (_, args) => LoggedAdmHomePage(
              user: args.data as UserModel,
            )),
    ModuleRoute('/filter-dashboard', module: DashboardModule())
  ];
}
