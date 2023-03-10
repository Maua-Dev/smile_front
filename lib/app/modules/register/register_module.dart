import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/register/presenter/controllers/register_controller.dart';
import 'package:smile_front/app/modules/register/ui/pages/register_page.dart';
import 'package:smile_front/app/modules/register/ui/pages/success_register_page.dart';
import 'package:smile_front/app/modules/register/ui/pages/verify_email_page.dart';
import 'package:smile_front/app/modules/register/domain/usecases/register_user.dart';
import '../../shared/services/dio/smile_login_options.dart';
import 'domain/repositories/register_informations_repository_interface.dart';
import 'external/register_datasource_impl.dart';
import 'infra/datasources/register_datasource_interface.dart';
import 'infra/repository/register_repository_impl.dart';

class RegisterModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<RegisterController>(
        (i) => RegisterController(
              registerUser: i<RegisterUserInterface>(),
            ),
        export: true),
    Bind.lazySingleton<RegisterDatasourceInterface>(
        (i) => RegisterDatasourceImpl(dioClient: i()),
        export: true),
    Bind.lazySingleton<RegisterRepositoryInterface>(
        (i) => RegisterRepositoryImpl(datasource: i()),
        export: true),
    Bind.lazySingleton<RegisterUserInterface>(
        (i) => RegisterUser(repository: i()),
        export: true),
    Bind.lazySingleton((i) => Dio(smileLoginOption))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const RegisterPage()),
    ChildRoute('/email', child: (_, args) => const VerifyEmailPage()),
    ChildRoute('/sucesso', child: (_, args) => const SuccessRegisterPage()),
  ];
}
