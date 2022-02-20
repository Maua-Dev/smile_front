import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/user_pages/domain/repositories/activities_repository_interface.dart';
import 'package:smile_front/app/modules/user_pages/external/activities_datasource_impl.dart';
import 'package:smile_front/app/modules/user_pages/infra/datasources/activities_datasource.dart';
import 'package:smile_front/app/modules/user_pages/presenter/controllers/subscribed_activities_controller.dart';
import 'package:smile_front/app/modules/user_pages/ui/index_pages.dart';
import 'package:smile_front/app/shared/widgets/vertical_nav_bar/vertical_nav_bar_controller.dart';

// import '../auth/repositories/secure_storage_interface.dart';
import 'infra/repository/activities_repository_impl.dart';

class UserPagesModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<ActivitiesDatasource>((i) => ActivitiesDatasourceImpl()),
    Bind.lazySingleton<ActivitiesRepositoryInterface>(
        (i) => ActivitiesRepositoryImpl(datasource: i())),
    Bind.lazySingleton<SubscribedActivitiesController>(
      (i) => SubscribedActivitiesController(repository: i()),
    ),
    // Bind.lazySingleton<VerticalNavBarController>(
    //     (i) => VerticalNavBarController(storage: i<ISecureStorage>()))
    Bind.lazySingleton<VerticalNavBarController>(
        (i) => VerticalNavBarController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const IndexPages()),
  ];
}
