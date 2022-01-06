import 'package:flutter_modular/flutter_modular.dart';
import 'app_module.dart';

class AppGuard implements RouteGuard {
  @override
  Future<bool> canActivate(String path, ModularRoute router) async {
    await Modular.isModuleReady<AppModule>();
    return true;
  }

  @override
  String? get guardedRoute => null;
}
