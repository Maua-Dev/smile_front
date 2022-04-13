import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart';
import 'package:smile_front/app/modules/dashboard/external/activities_datasource_impl.dart';
import 'package:smile_front/app/modules/dashboard/infra/datasources/activities_datasource.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/all_activities_user_dashboard_controller.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/help_controller.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/more_info_controller.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/user_dashboard_controller.dart';
import 'package:smile_front/app/modules/dashboard/ui/user/all_activities_user_dashboard_page.dart';
import 'package:smile_front/app/modules/dashboard/ui/user/help_page.dart';
import 'package:smile_front/app/modules/dashboard/ui/user/more_info_page.dart';
import 'package:smile_front/app/modules/dashboard/ui/user/user_dashboard_page.dart';
import 'package:smile_front/app/shared/entities/card_activity.dart';

import '../../shared/services/dio/smile_activities_options.dart';
import '../auth/domain/repositories/auth_repository_interface.dart';
import '../auth/domain/repositories/secure_storage_interface.dart';
import '../auth/presenter/controllers/auth_controller.dart';
import 'domain/repositories/faq_repository_interface.dart';
import 'external/faq_datasource_impl.dart';
import 'infra/datasources/faq_datasource.dart';
import 'infra/repository/activities_repository_impl.dart';
import 'infra/repository/faq_repository_impl.dart';

class UserModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<AllActivitiesUserDashboardController>(
        (i) => AllActivitiesUserDashboardController(
              repository: i(),
              authController: i(),
            ),
        export: true),
    Bind.lazySingleton<ActivitiesDatasource>((i) => ActivitiesDatasourceImpl(
          storage: i<SecureStorageInterface>(),
        )),
    Bind.lazySingleton<HelpController>((i) => HelpController(i())),
    Bind.lazySingleton<ActivitiesRepositoryInterface>(
        (i) => ActivitiesRepositoryImpl(datasource: i())),
    Bind.lazySingleton<FaqDatasource>((i) => FaqDatasourceImpl()),
    Bind.lazySingleton<FaqRepositoryInterface>(
        (i) => FaqRepositoryImpl(datasource: i())),
    Bind.lazySingleton<UserDashboardController>(
      (i) => UserDashboardController(
        repository: i(),
        secureStorage: i(),
      ),
    ),
    Bind.lazySingleton<MoreInfoController>(
      (i) => MoreInfoController(
          repository: i(),
          activity: i.args!.data[0] as CardActivity,
          registered: i.args!.data[1] as bool),
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
    ChildRoute('/more-info', child: (_, args) => const MoreInfoPage()),
    ChildRoute('/help', child: (_, args) => const HelpPage()),
  ];
}
