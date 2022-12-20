import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_test/modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smile_front/app/app_module.dart';
import 'package:smile_front/app/modules/home/external/speakers_datasource_impl.dart';
import 'package:smile_front/app/modules/home/home_module.dart';
import 'package:smile_front/app/modules/home/infra/repository/speakers_repository_impl.dart';
import 'package:smile_front/app/modules/home/presenter/controllers/activity_home_controller.dart';
import 'package:smile_front/app/modules/home/presenter/controllers/speakers_home_controller.dart';

void main() {
  initModules([AppModule(), HomeModule()]);

  test('ActivityHomeController Injection', () {
    Modular.get<ActivityHomeController>();
  });

  test('SpeakersRepositoryImpl Injection', () {
    Modular.get<SpeakersRepositoryImpl>();
  });

  test('SpeakersHomeController Injection', () {
    Modular.get<SpeakersHomeController>();
  });

  test('SpeakersDatasourceImpl Injection', () {
    Modular.get<SpeakersDatasourceImpl>();
  });

  test('Dio Injection', () {
    Modular.get<Dio>();
  });
}
