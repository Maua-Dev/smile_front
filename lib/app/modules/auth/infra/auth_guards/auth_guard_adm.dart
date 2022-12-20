import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/app_module.dart';
import 'package:smile_front/app/modules/auth/presenter/controllers/auth_controller.dart';

class AuthGuardAdm extends RouteGuard {
  AuthGuardAdm() : super(redirectTo: '/login');
  @override
  Future<bool> canActivate(String path, ModularRoute route) async {
    await Modular.isModuleReady<AppModule>();
    var authController = Modular.get<AuthController>();
    if (!authController.isLogged) {
      await authController.verifyIfHaveTokens();
    }
    if (authController.accessLevel == 'ADMIN' && authController.isLogged) {
      return true;
    }
    return false;
  }
}
