import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/home/infra/repository/lecture_images_repository_impl.dart';
import 'package:smile_front/app/modules/home/presenter/controllers/home4_controller.dart';
import 'package:smile_front/app/modules/home/ui/pages/home3/home3_page.dart';
import 'package:smile_front/app/modules/home/ui/pages/home4/home4_page.dart';

import 'domain/repositories/lecture_images_repository.dart';
import 'external/lecture_images_datasource_impl.dart';
import 'infra/datasources/lecture_images_datasource.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<LectureImagesRepository>(
        (i) => LectureImagesRepositoryImpl(datasource: i())),
    Bind.lazySingleton((i) => Home4Controller(repository: i())),
    Bind.lazySingleton<LectureImagesDatasource>(
        (i) => LectureImagesDatasourceImpl()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const Home3Page()),
    ChildRoute('/home4', child: (_, args) => const Home4Page()),
  ];
}
