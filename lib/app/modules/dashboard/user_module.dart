import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart';
import 'package:smile_front/app/modules/dashboard/external/activities_datasource_impl.dart';
import 'package:smile_front/app/modules/dashboard/infra/datasources/activities_datasource.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/all_activities_user_dashboard_controller.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/user_dashboard_controller.dart';
import 'package:smile_front/app/modules/dashboard/ui/user/all_activities_user_dashboard_page.dart';
import 'package:smile_front/app/modules/dashboard/ui/user/user_dashboard_page.dart';

import '../../shared/services/dio/smile_activities_options.dart';
import '../auth/domain/repositories/auth_repository_interface.dart';
import '../auth/domain/repositories/secure_storage_interface.dart';
import '../auth/presenter/controllers/auth_controller.dart';
import 'infra/repository/activities_repository_impl.dart';

class UserModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<AllActivitiesUserDashboardController>(
        (i) => AllActivitiesUserDashboardController(
              repository: i(),
            ),
        export: true),
    Bind.lazySingleton<ActivitiesDatasource>(
        (i) => ActivitiesDatasourceImpl(i())),
    Bind.lazySingleton<ActivitiesRepositoryInterface>(
        (i) => ActivitiesRepositoryImpl(datasource: i())),
    Bind.lazySingleton<UserDashboardController>(
      (i) => UserDashboardController(
        repository: i(),
        activityType: i.args!.data[0] as ActivityEnum,
      ),
    ),
    Bind.lazySingleton((i) => Dio(smileOption)),
    Bind.lazySingleton<AuthController>(
        (i) => AuthController(
              authRepository: i<AuthRepositoryInterface>(),
              storage: i<SecureStorageInterface>(),
            ),
        export: true),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/activities-dashboard',
        child: (_, args) => const UserDashboardPage()),
    ChildRoute(Modular.initialRoute,
        child: (_, args) => const AllActivitiesUserDashboardPage()),
  ];
}
