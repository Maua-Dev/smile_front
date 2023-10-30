import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/dashboard/ui/user/landing_user_page.dart';
import 'package:smile_front/app/modules/dashboard/user_module.dart';

import '../../shared/helpers/errors/error_page.dart';
import '../../shared/widgets/bottom_navigation_bar/bottom_navigation_bar_controller.dart';

class LandingModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<NavigationBarController>((i) =>
        NavigationBarController(authController: i(), secureStorage: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => const LandingUserPage(),
        children: [
          ModuleRoute(
            '/home',
            module: UserModule(),
          ),
        ]),
    WildcardRoute(child: (context, args) => const ErrorPage()),
  ];
}
