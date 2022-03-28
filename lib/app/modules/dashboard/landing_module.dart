import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/dashboard/ui/user/landing_user_page.dart';
import 'package:smile_front/app/modules/dashboard/user_module.dart';

class LandingModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => const LandingUserPage(),
        children: [
          ModuleRoute('/home', module: UserModule()),
        ]),
  ];
}
