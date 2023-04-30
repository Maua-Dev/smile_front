import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/app_guard.dart';
import 'package:smile_front/app/modules/auth/infra/auth_guards/auth_guard_adm.dart';
import 'package:smile_front/app/modules/auth/infra/auth_guards/auth_guard_user.dart';
import 'package:smile_front/app/modules/dashboard/adm_module.dart';
import 'package:smile_front/app/modules/dashboard/faq_module.dart';
import 'package:smile_front/app/modules/dashboard/landing_module.dart';
import 'package:smile_front/app/modules/login/login_module.dart';
import 'package:smile_front/app/modules/register/register_module.dart';
import 'package:smile_front/app/shared/error/error_page.dart';

import 'modules/auth/auth_module.dart';
import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Module> imports = [AuthModule(), RegisterModule()];

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
      '/adm',
      module: AdmModule(),
      guards: [AuthGuardAdm()],
      guardedRoute: '/login',
    ),
    ModuleRoute(
      '/user',
      module: LandingModule(),
      guards: [AuthGuardUser()],
      guardedRoute: '/login',
    ),
    ModuleRoute(
      '/help',
      module: FaqModule(),
    ),
    WildcardRoute(child: (context, args) => const ErrorPage()),
  ];
}
