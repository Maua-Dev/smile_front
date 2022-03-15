import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/login/presenter/controllers/login_controller.dart';
import 'package:smile_front/app/modules/login/presenter/controllers/register_controller.dart';
import 'package:smile_front/app/modules/login/ui/forgot_password_page.dart';
import 'package:smile_front/app/modules/login/ui/login_page.dart';
import 'package:smile_front/app/modules/login/ui/register_page.dart';
import '../../shared/services/dio/smile_login_options.dart';
import '../auth/domain/repositories/auth_repository_interface.dart';
import '../auth/external/auth_datasource_impl.dart';
import '../auth/infra/datasource/auth_datasource.dart';
import '../auth/infra/repositories/auth_repository_impl.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => RegisterController(i())),
    Bind.lazySingleton((i) => LoginController(
          authController: i(),
        )),
    Bind.lazySingleton<AuthDatasource>(
        (i) => AuthDatasourceImpl(dioClient: i())),
    Bind.lazySingleton<AuthRepositoryInterface>(
        (i) => AuthRepositoryImpl(datasource: i()),
        export: true),
    Bind.lazySingleton((i) => Dio(smileLoginOption))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const LoginPage()),
    ChildRoute('/cadastro', child: (_, args) => const RegisterPage()),
    ChildRoute('/esqueci-minha-senha',
        child: (_, args) => const ForgotPassword()),
  ];
}
