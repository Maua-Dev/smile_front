import 'package:flutter_modular/flutter_modular.dart';
import '../../../../app_module.dart';
import '../../presenter/controllers/auth_controller.dart';

class AuthGuardSpeaker extends RouteGuard {
  AuthGuardSpeaker() : super(redirectTo: '/login');
  @override
  Future<bool> canActivate(String path, ModularRoute route) async {
    await Modular.isModuleReady<AppModule>();
    var authController = Modular.get<AuthController>();
    if (!authController.isLogged) {
      await authController.verifyIfHaveTokens();
    }
    if (authController.accessLevel == 'SPEAKER') {
      return authController.isLogged;
    }
    return false;
  }
}
