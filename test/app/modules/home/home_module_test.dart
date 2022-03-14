import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smile_front/app/app_module.dart';
import 'package:smile_front/app/modules/home/domain/repositories/home2_repository_interface.dart';
import 'package:smile_front/app/modules/home/domain/repositories/lecture_images_repository_interface.dart';
import 'package:smile_front/app/modules/home/domain/repositories/rectors_repository_interface.dart';
import 'package:smile_front/app/modules/home/external/lecture_images_datasource_impl.dart';
import 'package:smile_front/app/modules/home/external/rectors_datasource_impl.dart';
import 'package:smile_front/app/modules/home/home_module.dart';
import 'package:smile_front/app/modules/home/infra/datasources/lecture_images_datasource_interface.dart';
import 'package:smile_front/app/modules/home/infra/datasources/rectors_datasource_interface.dart';
import 'package:smile_front/app/modules/home/infra/repository/home2_repository_impl.dart';
import 'package:smile_front/app/modules/home/infra/repository/lecture_images_repository_impl.dart';
import 'package:smile_front/app/modules/home/infra/repository/rectors_repository_impl.dart';
import 'package:smile_front/app/modules/home/presenter/controllers/about_home_controller.dart';
import 'package:smile_front/app/modules/home/presenter/controllers/activity_home_controller.dart';
import 'package:smile_front/app/modules/home/presenter/controllers/calendar_home_controller.dart';

void main() {
  initModules([AppModule(), HomeModule()]);

  test('Home2Controller Injection', () {
    var test = Modular.get<AboutHomeController>();
    expect(test.repository, isInstanceOf<SpeakersRepositoryInterface>());
  });

  test('LectureImagesRepositoryImpl Injection', () {
    var test = Modular.get<LectureImagesRepositoryImpl>();
    expect(test.datasource, isInstanceOf<LectureImagesDatasourceInterface>());
  });

  test('Home4Controller Injection', () {
    var test = Modular.get<CalendarHomeController>();
    expect(test.repository, isInstanceOf<LectureImagesRepositoryInterface>());
  });

  test('LectureImagesDatasourceImpl Injection', () {
    Modular.get<LectureImagesDatasourceImpl>();
  });

  test('Home2RepositoryImpl Injection', () {
    Modular.get<SpeakersRepositoryImpl>();
  });

  test('RectorsRepositoryImpl Injection', () {
    var test = Modular.get<RectorsRepositoryImpl>();
    expect(test.datasource, isInstanceOf<RectorsDatasourceInterface>());
  });

  test('Home3Controller Injection', () {
    var test = Modular.get<ActivityHomeController>();
    expect(test.repository, isInstanceOf<RectorsRepositoryInterface>());
  });

  test('RectorsDatasourceImpl Injection', () {
    Modular.get<RectorsDatasourceImpl>();
  });
}
