import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/auth/domain/repositories/auth_repository_interface.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/adm/adm_dashboard_controller.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/adm/edit_activity_controller.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/adm/create_activity_controller.dart';
import 'package:smile_front/app/modules/dashboard/ui/adm/adm_dashboard_page.dart';
import 'package:smile_front/app/modules/dashboard/ui/adm/edit_activity_page.dart';
import 'package:smile_front/app/modules/dashboard/ui/adm/create_activity_page.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';

import '../../shared/error/error_page.dart';
import '../../shared/services/dio/smile_activities_options.dart';
import '../auth/domain/repositories/secure_storage_interface.dart';
import '../auth/presenter/controllers/auth_controller.dart';
import 'domain/repositories/activities_repository_interface.dart';
import 'external/activities_datasource_impl.dart';
import 'infra/datasources/activities_datasource_interface.dart';
import 'infra/repository/activities_repository_impl.dart';

class AdmModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<AdmDashboardController>(
        (i) => AdmDashboardController(
              repository: i(),
              authController: i(),
            ),
        export: true),
    Bind.lazySingleton<EditActivityController>(
      (i) => EditActivityController(
        repository: i(),
        activityModel:
            i.args.data as ActivityModel? ?? ActivityModel.newInstance(),
      ),
    ),
    Bind.lazySingleton<CreateActivityController>(
      (i) => CreateActivityController(
        repository: i(),
      ),
    ),
    Bind.lazySingleton<ActivitiesDatasourceInterface>(
        (i) => ActivitiesDatasourceImpl(
              storage: i<SecureStorageInterface>(),
            )),
    Bind.lazySingleton<ActivitiesRepositoryInterface>(
        (i) => ActivitiesRepositoryImpl(datasource: i())),
    Bind.lazySingleton((i) => Dio(smileOption)),
    Bind.lazySingleton<AuthController>(
        (i) => AuthController(
              authRepository: i<AuthRepositoryInterface>(),
              storage: i<SecureStorageInterface>(),
              analytics: i(),
            ),
        export: true),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => const AdmDashboardPage()),
    ChildRoute('/create-activity',
        child: (_, args) => const CreateActivityPage()),
    ChildRoute('/edit-activity', child: (_, args) => const EditActivityPage()),
    WildcardRoute(child: (context, args) => const ErrorPage()),
  ];
}
