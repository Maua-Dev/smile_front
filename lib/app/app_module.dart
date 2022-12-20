import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/app_guard.dart';
import 'package:smile_front/app/modules/auth/infra/auth_guards/auth_guard_adm.dart';
import 'package:smile_front/app/modules/auth/infra/auth_guards/auth_guard_user.dart';
import 'package:smile_front/app/modules/dashboard/adm_module.dart';
import 'package:smile_front/app/modules/dashboard/landing_module.dart';
import 'package:smile_front/app/modules/login/login_module.dart';
import 'package:smile_front/app/modules/register/register_module.dart';
import 'package:smile_front/app/shared/error/error_page.dart';
import 'package:smile_front/app/shared/services/firebase-analytics/firebase_analytics_service.dart';
import 'modules/auth/auth_module.dart';
import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [AuthModule(), RegisterModule()];

  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => FirebaseAnalyticsService()),
      ];

  @override
  List<ModularRoute> get routes => [
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
        ),
        ModuleRoute(
          '/user',
          module: LandingModule(),
          guards: [AuthGuardUser()],
        ),
        WildcardRoute(child: (context, args) => const ErrorPage()),
      ];
}
