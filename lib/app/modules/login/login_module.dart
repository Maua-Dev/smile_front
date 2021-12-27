import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/login/presenter/controllers/login_controller.dart';
import 'package:smile_front/app/modules/login/presenter/controllers/register_controller.dart';
import 'package:smile_front/app/modules/login/ui/login_page.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => RegisterController()),
    Bind.lazySingleton((i) => LoginController(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const LoginPage()),
  ];
}
