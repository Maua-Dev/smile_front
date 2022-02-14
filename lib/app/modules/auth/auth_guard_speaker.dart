import 'package:flutter_modular/flutter_modular.dart';
import '../../app_module.dart';
import 'auth_controller.dart';

class AuthGuardSpeaker implements RouteGuard {
  @override
  Future<bool> canActivate(String path, ModularRoute router) async {
    await Modular.isModuleReady<AppModule>();
    var authController = Modular.get<AuthController>();
    if (!authController.isLogged) {
      await authController.refreshToken();
    }
    if (authController.accessLevel == 1) {
      return authController.isLogged;
    }
    return false;
  }

  @override
  String? get guardedRoute => '/login';
}
