import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/auth/repositories/auth_repository_interface.dart';
import 'package:smile_front/app/modules/auth/repositories/auth_repository_mock.dart';
import 'package:smile_front/app/modules/auth/repositories/secure_storage_interface.dart';
import './auth_controller.dart';
import 'repositories/secure_storage.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<AuthController>(
        (i) => AuthController(
            repository: i<IAuthRepository>(), storage: i<ISecureStorage>()),
        export: true),
    Bind.lazySingleton<IAuthRepository>((i) => AuthRepositoryMock(),
        export: true),
    AsyncBind<ISecureStorage>((i) => SecureStorage.instance(), export: true)
  ];
}
