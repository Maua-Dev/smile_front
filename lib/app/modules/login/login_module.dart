import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/forgot-password/forgot_password_module.dart';
import 'package:smile_front/app/modules/login/presenter/controllers/login_controller.dart';
import 'package:smile_front/app/modules/login/ui/login_page.dart';
import 'package:smile_front/app/modules/register/register_module.dart';
import 'package:smile_front/app/shared/error/error_page.dart';
import '../../shared/services/dio/smile_login_options.dart';
import '../auth/domain/repositories/auth_repository_interface.dart';
import '../auth/external/auth_datasource_impl.dart';
import '../auth/infra/datasource/auth_datasource_interface.dart';
import '../auth/infra/repositories/auth_repository_impl.dart';
import '../resend-confirmation/resend_confirmation_module.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton(
        (i) => LoginController(
              authController: i(),
              analytics: i(),
            ),
        export: true),
    Bind.lazySingleton<AuthDatasourceInterface>(
        (i) => AuthDatasourceImpl(storage: i())),
    Bind.lazySingleton<AuthRepositoryInterface>(
        (i) => AuthRepositoryImpl(datasource: i()),
        export: true),
    Bind.lazySingleton((i) => Dio(smileLoginOption)),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const LoginPage()),
    ModuleRoute('/cadastro', module: RegisterModule()),
    ModuleRoute('/esqueci-minha-senha', module: ForgotPasswordModule()),
    ModuleRoute('/reenviar-email', module: ResendConfirmationModule()),
    WildcardRoute(child: (context, args) => const ErrorPage()),
  ];
}
