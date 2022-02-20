import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/dashboard/dashboard_module.dart';
import 'package:smile_front/app/modules/logged-home/ui/logged_user_home_page.dart';
import 'package:smile_front/app/shared/models/user_model.dart';

import 'domain/repositories/user_repository_interface.dart';
import 'external/user_datasource_impl.dart';
import 'infra/datasources/user_datasource.dart';
import 'infra/repository/user_repository_impl.dart';
import 'presenter/controllers/logged_home_controller.dart';

class LoggedUserHomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<UserDatasource>(
        (i) => UserDatasourceImpl(dioClient: i())),
    Bind.lazySingleton<UserRepositoryInterface>(
        (i) => UserRepositoryImpl(datasource: i())),
    Bind.lazySingleton<LoggedHomeController>((i) => LoggedHomeController(
        userRepository: i(),
        cpfRne: i.args!.data as String,
        futureActivityRepository: i())),
  ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => LoggedUserHomePage(
              user: args.data as UserModel,
            )),
    ModuleRoute('/filter-dashboard', module: DashboardModule())
  ];
}
