import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/logged-home/external/user_datasource_impl.dart';
import 'package:smile_front/app/modules/logged-home/infra/datasources/user_datasource.dart';
import 'package:smile_front/app/modules/logged-home/infra/repository/user_repository_impl.dart';
import 'package:smile_front/app/modules/login/presenter/controllers/login_controller.dart';
import 'package:smile_front/app/modules/login/presenter/controllers/register_controller.dart';
import 'package:smile_front/app/modules/login/ui/login_page.dart';

import '../auth/domain/repositories/access_level_repository_interface.dart';
import '../auth/external/access_level_datasource_impl.dart';
import '../auth/infra/datasource/access_level_datasource.dart';
import '../auth/infra/repositories/access_level_repository_impl.dart';
import '../logged-home/domain/repositories/user_repository_interface.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => RegisterController(i())),
    Bind.lazySingleton(
        (i) => LoginController(authController: i(), repository: i())),
    Bind.lazySingleton<UserRepositoryInterface>(
        (i) => UserRepositoryImpl(datasource: i())),
    Bind.lazySingleton<UserDatasource>(
        (i) => UserDatasourceImpl(dioClient: i())),
    Bind.lazySingleton<AccessLevelRepositoryInterface>(
        (i) => AccessLevelRepositoryImpl(datasource: i())),
    Bind.lazySingleton<AccessLevelDatasource>(
        (i) => AccessLevelDatasourceImpl(dioClient: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const LoginPage()),
  ];
}
