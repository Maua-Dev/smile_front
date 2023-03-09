import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smile_front/app/app_module.dart';
import 'package:smile_front/app/modules/forgot-password/external/forgot_password_datasourse_impl.dart';
import 'package:smile_front/app/modules/forgot-password/forgot_password_module.dart';
import 'package:smile_front/app/modules/forgot-password/infra/repository/forgot_password_repository_impl.dart';
import 'package:smile_front/app/modules/forgot-password/presenter/controller/forgot_password_controller.dart';

void main() {
  initModules([
    ForgotPasswordModule(),
    AppModule(),
  ]);

  setUp(() async {
    await Modular.isModuleReady<AppModule>();
  });

  test('ForgotPasswordController Injection', () {
    Modular.get<ForgotPasswordController>();
  });

  test('ForgotPasswordDatasourceImpl Injection', () {
    Modular.get<ForgotPasswordDatasourceImpl>();
  });

  test('ForgotPasswordRepositoryImpl Injection', () {
    Modular.get<ForgotPasswordRepositoryImpl>();
  });

  test('Dio Injection', () {
    Modular.get<Dio>();
  });
}
