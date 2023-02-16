import 'package:flutter_modular/flutter_modular.dart';

import '../../../../app_module.dart';
import '../../presenter/controllers/auth_controller.dart';

class AuthGuardProfessor implements RouteGuard {
  @override
  Future<bool> canActivate(String path, ModularRoute router) async {
    await Modular.isModuleReady<AppModule>();
    var authController = Modular.get<AuthController>();
    if (!authController.isLogged) {
      await authController.verifyIfHaveTokens();
    }
    if (authController.accessLevel == 'PROFESSOR' && authController.isLogged) {
      return true;
    }
    return false;
  }

  @override
  String? get guardedRoute => '/login';
}
