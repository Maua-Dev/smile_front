import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/shared/widgets/vertical_nav_bar/vertical_nav_bar.dart';
import 'package:smile_front/app/shared/widgets/vertical_nav_bar/vertical_nav_bar_controller.dart';

class DashboardModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<VerticalNavBarController>(
      (i) => VerticalNavBarController(),
    )
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => const VerticalNavBar()),
  ];
}
