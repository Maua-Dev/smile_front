import 'package:flutter_modular/flutter_modular.dart';
import '../../../../app_module.dart';
import '../../presenter/controllers/auth_controller.dart';

class AuthGuard implements RouteGuard {
  @override
  Future<bool> canActivate(String path, ModularRoute router) async {
    await Modular.isModuleReady<AppModule>();
    var authController = Modular.get<AuthController>();
    if (!authController.isLogged) {
      await authController.refreshToken();
    }
    if (authController.isLogged && authController.accessLevel == 'ADMIN') {
      Modular.to.navigate('/adm');
    }
    if (authController.isLogged && authController.accessLevel == 'USER') {
      Modular.to.navigate('/user');
    }
    return true;
  }

  @override
  String? get guardedRoute => '/login';
}
