import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/register/presenter/controllers/register_controller.dart';
import 'package:smile_front/app/modules/register/ui/register_page.dart';

import '../../shared/services/dio/smile_login_options.dart';
import 'domain/repositories/register_informations_repository_interface.dart';
import 'external/register_datasource_impl.dart';
import 'infra/datasources/register_datasource.dart';
import 'infra/repository/register_repository_impl.dart';

class RegisterModule extends Module {
  @override
  final List<Bind> binds = [
    // Bind.lazySingleton<RegisterController>(
    //     (i) => RegisterController(
    //         registerUserRepository: i<RegisterRepositoryInterface>()),
    //     export: true),
    // // Bind.lazySingleton<RegisterRepositoryInterface>(
    // //     (i) => RegisterRepositoryMock(),
    // //     export: true),
    // Bind.lazySingleton<RegisterDatasource>(
    //     (i) => RegisterDatasourceImpl(dioClient: i()),
    //     export: true),
    // Bind.lazySingleton<RegisterRepositoryInterface>(
    //     (i) => RegisterRepositoryImpl(datasource: i()),
    //     export: true),
    // Bind.lazySingleton((i) => Dio(smileLoginOption)),

    Bind.lazySingleton<RegisterController>(
        (i) => RegisterController(
              registerUserRepository: i<RegisterRepositoryInterface>(),
            ),
        export: true),
    Bind.lazySingleton<RegisterDatasource>(
        (i) => RegisterDatasourceImpl(dioClient: i()),
        export: true),
    Bind.lazySingleton<RegisterRepositoryInterface>(
        (i) => RegisterRepositoryImpl(datasource: i()),
        export: true),
    Bind.lazySingleton((i) => Dio(smileLoginOption))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const RegisterPage()),
  ];
}
