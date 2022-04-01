import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smile_front/app/app_module.dart';
import 'package:smile_front/app/modules/home/external/speakers_datasource_impl.dart';
import 'package:smile_front/app/modules/home/home_module.dart';
import 'package:smile_front/app/modules/home/infra/repository/speakers_repository_impl.dart';
import 'package:smile_front/app/modules/home/presenter/controllers/activity_home_controller.dart';

void main() {
  initModules([AppModule(), HomeModule()]);

  test('SpeakersRepositoryImpl Injection', () {
    Modular.get<SpeakersRepositoryImpl>();
  });

  test('ActivityHomeController Injection', () {
    var test = Modular.get<ActivityHomeController>();
    expect(test.repository, isInstanceOf<SpeakersRepositoryImpl>());
  });

  test('RectorsDatasourceImpl Injection', () {
    Modular.get<SpeakersDatasourceImpl>();
  });
}
