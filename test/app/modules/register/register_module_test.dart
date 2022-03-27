import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smile_front/app/modules/register/domain/repositories/register_informations_repository_interface.dart';
import 'package:smile_front/app/modules/register/infra/datasources/register_datasource.dart';
import 'package:smile_front/app/modules/register/presenter/controllers/register_controller.dart';
import 'package:smile_front/app/modules/register/register_module.dart';

void main() {
  initModules([RegisterModule()]);
  test('RegisterController Injection', () {
    Modular.get<RegisterController>();
  });

  test('RegisterDatasource Injection', () {
    Modular.get<RegisterDatasource>();
  });

  test('RegisterRepositoryInterface Injection', () {
    Modular.get<RegisterRepositoryInterface>();
  });

  test('Dio Injection', () {
    Modular.get<Dio>();
  });
}