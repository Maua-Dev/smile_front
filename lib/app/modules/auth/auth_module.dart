import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/auth/presenter/controllers/auth_controller.dart';

import '../../shared/services/dio/smile_login_options.dart';
import 'external/auth_datasource_impl.dart';
import 'domain/repositories/auth_repository_interface.dart';
import 'infra/datasource/auth_datasource_interface.dart';
import 'infra/repositories/auth_repository_impl.dart';
import 'infra/repositories/secure_storage.dart';
import 'domain/repositories/secure_storage_interface.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<AuthController>(
        (i) => AuthController(
              authRepository: i<AuthRepositoryInterface>(),
              storage: i<SecureStorageInterface>(),
              analytics: i(),
            ),
        export: true),
    Bind.lazySingleton<AuthDatasourceInterface>(
        (i) => AuthDatasourceImpl(dioClient: i(), storage: i())),
    Bind.lazySingleton<AuthRepositoryInterface>(
        (i) => AuthRepositoryImpl(datasource: i())),
    AsyncBind<SecureStorageInterface>(
      (i) => SecureStorage.instance(),
    ),
    Bind.lazySingleton((i) => Dio(smileLoginOption))
  ];
}
