import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/auth/presenter/controllers/auth_controller.dart';

import 'domain/repositories/access_level_repository_interface.dart';
import 'external/access_level_datasource_impl.dart';
import 'infra/datasource/access_level_datasource_interface.dart';
import 'infra/repositories/access_level_repository_impl.dart';
import 'domain/repositories/auth_repository_interface.dart';
import 'infra/repositories/auth_repository_mock.dart';
import 'infra/repositories/secure_storage.dart';
import 'domain/repositories/secure_storage_interface.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<AuthController>(
        (i) => AuthController(
            authRepository: i<AuthRepositoryInterface>(),
            storage: i<SecureStorageInterface>(),
            repository: i()),
        export: true),
    Bind.lazySingleton<AuthRepositoryInterface>((i) => AuthRepositoryMock(),
        export: true),
    AsyncBind<SecureStorageInterface>((i) => SecureStorage.instance(),
        export: true),
    Bind.lazySingleton<AccessLevelDatasourceInterface>(
        (i) => AccessLevelDatasourceImpl(dioClient: i())),
    Bind.lazySingleton<AccessLevelRepositoryInterface>(
        (i) => AccessLevelRepositoryImpl(datasource: i())),
  ];
}
