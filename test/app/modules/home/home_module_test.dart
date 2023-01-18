import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smile_front/app/app_module.dart';
import 'package:smile_front/app/modules/home/home_module.dart';
import 'package:smile_front/app/modules/home/presenter/controllers/speakers_home_controller.dart';

void main() {
  initModules([AppModule(), HomeModule()]);

  test('SpeakersHomeController Injection', () {
    Modular.get<SpeakersHomeController>();
  });

  test('Dio Injection', () {
    Modular.get<Dio>();
  });
}
