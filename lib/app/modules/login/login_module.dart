import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/logged-home/external/user_datasource_impl.dart';
import 'package:smile_front/app/modules/logged-home/infra/datasources/user_datasource.dart';
import 'package:smile_front/app/modules/logged-home/infra/repository/user_repository_impl.dart';
import 'package:smile_front/app/modules/login/presenter/controllers/login_controller.dart';
import 'package:smile_front/app/modules/login/presenter/controllers/register_controller.dart';
import 'package:smile_front/app/modules/login/ui/login_page.dart';
import '../../shared/services/dio/smile_login_options.dart';
import '../auth/domain/repositories/auth_repository_interface.dart';
import '../auth/external/auth_datasource_impl.dart';
import '../auth/infra/datasource/auth_datasource.dart';
import '../auth/infra/repositories/auth_repository_impl.dart';
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
    Bind.lazySingleton<AuthDatasource>(
        (i) => AuthDatasourceImpl(dioClient: i())),
    Bind.lazySingleton<AuthRepositoryInterface>(
        (i) => AuthRepositoryImpl(datasource: i())),
    Bind.lazySingleton((i) => Dio(smileLoginOption))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const LoginPage()),
  ];
}
