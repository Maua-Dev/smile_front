import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart';
import 'package:smile_front/app/modules/dashboard/external/activities_datasource_impl.dart';
import 'package:smile_front/app/modules/dashboard/infra/datasources/activities_datasource.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/all_activities_user_dashboard_controller.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/user_dashboard_controller.dart';
import 'package:smile_front/app/modules/dashboard/ui/user/all_activities_user_dashboard_page.dart';
import 'package:smile_front/app/modules/dashboard/ui/user/more_info_page.dart';
import 'package:smile_front/app/modules/dashboard/ui/user/user_dashboard_page.dart';
import 'package:smile_front/app/shared/entities/card_activity.dart';

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
              authController: i(),
            ),
        export: true),
    Bind.lazySingleton<ActivitiesDatasource>(
        (i) => ActivitiesDatasourceImpl(i())),
    Bind.lazySingleton<ActivitiesRepositoryInterface>(
        (i) => ActivitiesRepositoryImpl(datasource: i())),
    Bind.lazySingleton<UserDashboardController>(
      (i) => UserDashboardController(
        repository: i(),
        authController: i(),
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
    ChildRoute(Modular.initialRoute,
        child: (_, args) => const UserDashboardPage()),
    ChildRoute('/all-activities',
        child: (_, args) => const AllActivitiesUserDashboardPage()),
    ChildRoute('/more-info',
        child: (_, args) => MoreInfoPage(
              activity: args.data as CardActivity,
            )),
  ];
}
