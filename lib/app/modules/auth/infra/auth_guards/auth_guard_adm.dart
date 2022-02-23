import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/app_module.dart';
import 'package:smile_front/app/modules/auth/presenter/controllers/auth_controller.dart';

class AuthGuardAdm implements RouteGuard {
  @override
  Future<bool> canActivate(String path, ModularRoute router) async {
    await Modular.isModuleReady<AppModule>();
    var authController = Modular.get<AuthController>();
    if (!authController.isLogged) {
      await authController.refreshToken();
    }
    if (authController.accessLevel == 'ADMIN' && authController.isLogged) {
      return true;
    }
    return false;
  }

  @override
  String? get guardedRoute => '/logged-home/user-home';
}
