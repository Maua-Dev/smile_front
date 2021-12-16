import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/logged-home/ui/logged_home_page.dart';

import 'domain/repositories/future_activity_repository.dart';
import 'external/future_activity_datasource_impl.dart';
import 'infra/datasources/future_activity_datasource.dart';
import 'infra/repository/future_activity_repository_impl.dart';

class LoggedHomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<FutureActivityDatasource>(
        (i) => FutureActivityDatasourceImpl()),
    Bind.lazySingleton<FutureActivityRepository>(
        (i) => FutureActivityRepositoryImpl(datasource: i())),
  ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => const LoggedHomePage()),
  ];
}
