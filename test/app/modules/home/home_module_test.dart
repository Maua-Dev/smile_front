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
import 'package:smile_front/app/modules/home/presenter/controllers/home2_controller.dart';
import 'package:smile_front/app/modules/home/presenter/controllers/home3_controller.dart';
import 'package:smile_front/app/modules/home/presenter/controllers/home4_controller.dart';

void main() {
  initModules([AppModule(), HomeModule()]);

  test('Home2Controller Injection', () {
    var test = Modular.get<Home2Controller>();
    expect(test.repository, isInstanceOf<Home2RepositoryInterface>());
  });

  test('LectureImagesRepositoryImpl Injection', () {
    var test = Modular.get<LectureImagesRepositoryImpl>();
    expect(test.datasource, isInstanceOf<LectureImagesDatasourceInterface>());
  });

  test('Home4Controller Injection', () {
    var test = Modular.get<Home4Controller>();
    expect(test.repository, isInstanceOf<LectureImagesRepositoryInterface>());
  });

  test('LectureImagesDatasourceImpl Injection', () {
    Modular.get<LectureImagesDatasourceImpl>();
  });

  test('Home2RepositoryImpl Injection', () {
    Modular.get<Home2RepositoryImpl>();
  });

  test('RectorsRepositoryImpl Injection', () {
    var test = Modular.get<RectorsRepositoryImpl>();
    expect(test.datasource, isInstanceOf<RectorsDatasourceInterface>());
  });

  test('Home3Controller Injection', () {
    var test = Modular.get<Home3Controller>();
    expect(test.repository, isInstanceOf<RectorsRepositoryInterface>());
  });

  test('RectorsDatasourceImpl Injection', () {
    Modular.get<RectorsDatasourceImpl>();
  });
}
