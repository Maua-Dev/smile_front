import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/login/presenter/controllers/login_controller.dart';
import 'package:smile_front/app/modules/login/presenter/controllers/register_controller.dart';
import 'package:smile_front/app/modules/login/ui/login_page.dart';
import '../auth/external/access_level_datasource_impl.dart';
import '../auth/infra/datasource/access_level_datasource_interface.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => RegisterController(i())),
    Bind.lazySingleton((i) => LoginController(authController: i())),
    Bind.lazySingleton<AccessLevelDatasourceInterface>(
        (i) => AccessLevelDatasourceImpl(dioClient: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const LoginPage()),
  ];
}
