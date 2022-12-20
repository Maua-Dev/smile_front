import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/app_module.dart';

import '../../presenter/controllers/auth_controller.dart';

class AuthGuardUser extends RouteGuard {
  AuthGuardUser() : super(redirectTo: '/login');
  @override
  Future<bool> canActivate(String path, ModularRoute route) async {
    await Modular.isModuleReady<AppModule>();
    var authController = Modular.get<AuthController>();
    if (!authController.isLogged) {
      await authController.verifyIfHaveTokens();
    }
    if (authController.accessLevel == 'USER' && authController.isLogged) {
      return true;
    }
    return false;
  }
}
