import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/app_guard.dart';
import 'package:smile_front/app/modules/login/login_module.dart';

import 'modules/auth/auth_guard.dart';
import 'modules/auth/auth_module.dart';
import 'modules/home/home_module.dart';
import 'modules/logged-home/logged_home_module.dart';

class AppModule extends Module {
  @override
  final List<Module> imports = [AuthModule()];
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(
      '/home',
      module: HomeModule(),
      guards: [AppGuard()],
    ),
    ModuleRoute(
      '/login',
      module: LoginModule(),
      guards: [AppGuard()],
    ),
    ModuleRoute(
      '/',
      module: LoggedHomeModule(),
      guards: [AuthGuard()],
      guardedRoute: '/login',
    ),
  ];
}
