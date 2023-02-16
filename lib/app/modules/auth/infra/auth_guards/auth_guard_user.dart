import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/app_module.dart';

import '../../presenter/controllers/auth_controller.dart';

class AuthGuardUser implements RouteGuard {
  @override
  Future<bool> canActivate(String path, ModularRoute router) async {
    await Modular.isModuleReady<AppModule>();
    var authController = Modular.get<AuthController>();
    if (!authController.isLogged) {
      await authController.verifyIfHaveTokens();
    }
    if ((authController.role == 'STUDENT' ||
            authController.role == 'EXTERNAL' ||
            authController.role == 'INTERNAL_STUDENT' ||
            authController.role == 'EMPLOYEE') &&
        authController.isLogged) {
      return true;
    }
    return false;
  }

  @override
  String? get guardedRoute => '/login';
}
