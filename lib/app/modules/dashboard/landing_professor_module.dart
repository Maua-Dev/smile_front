import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/dashboard/professor_module.dart';
import 'package:smile_front/app/modules/dashboard/ui/professor/landing_professor_page.dart';

import '../../shared/error/error_page.dart';
import '../../shared/widgets/bottom_navigation_bar/bottom_navigation_bar_controller.dart';

class LandingProfessorModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<NavigationBarController>(
        (i) => NavigationBarController(authController: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => const LandingProfessorPage(),
        children: [
          ModuleRoute('/home', module: ProfessorModule()),
        ]),
    WildcardRoute(child: (context, args) => const ErrorPage()),
  ];
}
