import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smile_front/app/app_module.dart';
import 'package:smile_front/app/modules/resend-confirmation/external/resend_confirmation_datasourse_impl.dart';
import 'package:smile_front/app/modules/resend-confirmation/infra/repository/resend_confirmation_repository_impl.dart';
import 'package:smile_front/app/modules/resend-confirmation/presenter/controller/resend_confirmation_controller.dart';
import 'package:smile_front/app/modules/resend-confirmation/resend_confirmation_module.dart';

void main() {
  initModules([
    ResendConfirmationModule(),
    AppModule(),
  ]);

  test('ResendConfirmationController Injection', () {
    Modular.get<ResendConfirmationController>();
  });

  test('ResendConfirmationDatasourceImpl Injection', () {
    Modular.get<ResendConfirmationDatasourceImpl>();
  });

  test('ResendConfirmationRepositoryImpl Injection', () {
    Modular.get<ResendConfirmationRepositoryImpl>();
  });

  test('Dio Injection', () {
    Modular.get<Dio>();
  });
}
