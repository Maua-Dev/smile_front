import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/resend-confirmation/domain/usecases/resend_confirmation.dart';
import '../../shared/services/dio/smile_login_options.dart';
import 'domain/repository/resend_confirmation_datasource_interface.dart';
import 'external/resend_confirmation_datasourse_impl.dart';
import 'infra/datasources/resend_confirmation_datasource.dart';
import 'infra/repository/resend_confirmation_repository_impl.dart';
import 'presenter/controller/resend_confirmation_controller.dart';
import 'ui/resend_confirmation_page.dart';

class ResendConfirmationModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<ResendConfirmationController>(
        (i) => ResendConfirmationController(
              resendUserConfirmation: i<ResendConfirmationInterface>(),
            ),
        export: true),
    Bind.lazySingleton<ResendConfirmationDatasource>(
        (i) => ResendConfirmationDatasourceImpl(dioClient: i()),
        export: true),
    Bind.lazySingleton<ResendConfirmationRepositoryInterface>(
        (i) => ResendConfirmationRepositoryImpl(datasource: i()),
        export: true),
    Bind.lazySingleton<ResendConfirmationInterface>(
        (i) => ResendConfirmation(repository: i()),
        export: true),
    Bind.lazySingleton((i) => Dio(smileLoginOption)),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => const ResendConfirmationPage()),
  ];
}
