import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/dashboard/dashboard_module.dart';
import 'package:smile_front/app/modules/logged-user-home/presenter/controllers/logged_home_controller.dart';
import 'package:smile_front/app/modules/logged-user-home/ui/logged_user_home_page.dart';
import 'package:smile_front/app/shared/models/user_model.dart';
import 'domain/repositories/user_repository_interface.dart';
import 'external/user_datasource_impl.dart';
import 'infra/datasources/user_datasource.dart';
import 'infra/repository/user_repository_impl.dart';

class LoggedUserHomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<UserDatasource>((i) => UserDatasourceImpl(i())),
    Bind.lazySingleton<UserRepositoryInteface>((i) => UserRepositoryImpl(i())),
    Bind.lazySingleton<LoggedHomeController>((i) => LoggedHomeController(
        loggedHomeRepository: i(),
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
