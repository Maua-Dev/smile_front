import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/home/infra/repository/lecture_images_repository_impl.dart';
import 'package:smile_front/app/modules/home/presenter/controllers/home3_controller.dart';
import 'package:smile_front/app/modules/home/presenter/controllers/home4_controller.dart';
import 'package:smile_front/app/modules/home/ui/pages/home_page.dart';

import 'domain/repositories/lecture_images_repository.dart';
import 'domain/repositories/rectors_repository.dart';
import 'external/lecture_images_datasource_impl.dart';
import 'external/rectors_datasource_impl.dart';
import 'infra/datasources/lecture_images_datasource.dart';
import 'infra/datasources/rectors_datasource.dart';
import 'infra/repository/rectors_repository_impl.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<LectureImagesRepository>(
        (i) => LectureImagesRepositoryImpl(datasource: i())),
    Bind.lazySingleton((i) => Home4Controller(repository: i())),
    Bind.lazySingleton<LectureImagesDatasource>(
        (i) => LectureImagesDatasourceImpl()),
    Bind.lazySingleton<RectorsRepository>(
        (i) => RectorsRepositoryImpl(datasource: i())),
    Bind.lazySingleton((i) => Home3Controller(repository: i())),
    Bind.lazySingleton<RectorsDatasource>((i) => RectorsDatasourceImpl()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
  ];
}
