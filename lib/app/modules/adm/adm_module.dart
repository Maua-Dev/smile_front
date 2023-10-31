import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/adm/domain/repositories/activity_admin_repository_interface.dart';
import 'package:smile_front/app/modules/adm/domain/usecases/get_admin_activities_usecase.dart';
import 'package:smile_front/app/modules/adm/external/http/admin_activities_datasource.dart';
import 'package:smile_front/app/modules/adm/infra/datasource/activity_datasource_interface.dart';
import 'package:smile_front/app/modules/adm/infra/repositories/activity_admin_repository_mock.dart';
import 'package:smile_front/app/modules/adm/presenter/controllers/adm_dashboard_controller.dart';

class AdmModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<ActivityDatasourceInterface>((i) => AdminActivitiesDatasource(i())),
    Bind<ActivityAdminRepositoryInterface>(
        (i) => ActivityAdminRepositoryMock()),
    Bind<AdmDashboardController>((i) => AdmDashboardController(i())),
    Bind<GetAdminActivitiesUsecaseInterface>(
        (i) => GetAdminActivitiesUsecase(repository: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    // ChildRoute(Modular.initialRoute,
    //     child: (_, args) => const AdmDashboardPage()),
  ];
}
