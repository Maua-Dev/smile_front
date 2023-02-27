import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/dashboard/domain/repositories/user_repository_interface.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/create_activity.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/delete_activity.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/get_all_activities.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/get_download_link_csv.dart';
import 'package:smile_front/app/modules/dashboard/external/user_datasource_impl.dart';
import 'package:smile_front/app/modules/dashboard/infra/datasources/user_datasource_interface.dart';
import 'package:smile_front/app/modules/dashboard/infra/repository/user_repository_impl.dart';
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
import '../auth/domain/usecases/login_with_email.dart';
import '../auth/domain/usecases/refresh_token.dart';
import 'domain/repositories/activities_repository_interface.dart';
import 'domain/usecases/edit_activity.dart';
import 'domain/usecases/get_responsible_professors.dart';
import 'external/activities_datasource_impl.dart';
import 'infra/datasources/activities_datasource_interface.dart';
import 'infra/repository/activities_repository_impl.dart';

class AdmModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<ActivitiesRepositoryInterface>(
        (i) => ActivitiesRepositoryImpl(datasource: i())),
    Bind.lazySingleton<UserRepositoryInterface>(
        (i) => UserRepositoryImpl(datasource: i())),
    Bind.lazySingleton<GetResponsibleProfessorsInterface>(
        (i) => GetResponsibleProfessorsList(repository: i())),
    Bind.lazySingleton<ActivitiesDatasourceInterface>(
        (i) => ActivitiesDatasourceImpl(
              storage: i<SecureStorageInterface>(),
            )),
    Bind.lazySingleton<UserDatasourceInterface>((i) => UserDatasourceImpl(
          storage: i<SecureStorageInterface>(),
        )),
    Bind.lazySingleton<CreateActivityInterface>(
        (i) => CreateActivity(repository: i())),
    Bind.lazySingleton<GetAllUserActivitiesInterface>(
        (i) => GetActivitiesList(repository: i())),
    Bind.lazySingleton<DeleteActivityInterface>(
        (i) => DeleteActivity(repository: i())),
    Bind.lazySingleton<EditActivityInterface>(
        (i) => EditActivity(repository: i())),
    Bind.lazySingleton<GetDownloadLinkCsvInterface>(
      (i) => GetDownloadLinkCsv(
        repository: i(),
      ),
    ),
    Bind.lazySingleton<CreateActivityController>(
      (i) => CreateActivityController(
        getResponsibleProfessors: i(),
        createActivity: i(),
      ),
    ),
    Bind.lazySingleton<AuthController>(
        (i) => AuthController(
              loginWithEmail: i<LoginWithEmailInterface>(),
              refreshToken: i<RefreshTokenInterface>(),
              storage: i<SecureStorageInterface>(),
              analytics: i(),
            ),
        export: true),
    Bind.lazySingleton<AdmDashboardController>(
        (i) => AdmDashboardController(
              getAllUserActivities: i(),
              getDownloadLinkCsv: i(),
              authController: i(),
              deleteActivity: i(),
            ),
        export: true),
    Bind.lazySingleton<EditActivityController>(
      (i) => EditActivityController(
        editActivity: i(),
        activityModel:
            i.args!.data as ActivityModel? ?? ActivityModel.newInstance(),
      ),
    ),
    Bind.lazySingleton((i) => Dio(smileOption)),
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
