import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/forgot-password/domain/usecases/change_password.dart';
import 'package:smile_front/app/modules/forgot-password/presenter/controller/forgot_password_controller.dart';
import 'package:smile_front/app/modules/forgot-password/ui/change_password_page.dart';
import 'package:smile_front/app/modules/forgot-password/ui/forgot_password_page.dart';
import '../../shared/services/dio/smile_login_options.dart';
import 'domain/repository/forgot_password_datasource_interface.dart';
import 'domain/usecases/forgot_password.dart';
import 'external/forgot_password_datasourse_impl.dart';
import 'infra/datasources/forgot_password_datasource.dart';
import 'infra/repository/forgot_password_repository_impl.dart';

class ForgotPasswordModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<ForgotPasswordController>(
        (i) => ForgotPasswordController(
              analytics: i(),
              forgotPassword: i<ForgotPasswordInterface>(),
              changePassword: i<ChangePasswordInterface>(),
            ),
        export: true),
    Bind.lazySingleton<ChangePasswordInterface>(
        (i) => ChangePassword(repository: i()),
        export: true),
    Bind.lazySingleton<ForgotPasswordInterface>(
        (i) => ForgotPassword(repository: i()),
        export: true),
    Bind.lazySingleton<ForgotPasswordDatasource>(
        (i) => ForgotPasswordDatasourceImpl(dioClient: i()),
        export: true),
    Bind.lazySingleton<ForgotPasswordRepositoryInterface>(
        (i) => ForgotPasswordRepositoryImpl(datasource: i()),
        export: true),
    Bind.lazySingleton((i) => Dio(smileLoginOption)),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => const ForgotPasswordPage()),
    ChildRoute('escolher-senha',
        child: (_, args) => const ChangePasswordPage()),
  ];
}
