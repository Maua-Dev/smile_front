import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/home/infra/repository/home2_repository.dart';
import 'package:smile_front/app/modules/home/infra/repository/lecture_images_repository_impl.dart';
import 'package:smile_front/app/modules/home/presenter/controllers/home2_controller.dart';
import 'package:smile_front/app/modules/home/presenter/controllers/home4_controller.dart';
import 'package:smile_front/app/modules/home/ui/pages/home1/home1_page.dart';
import 'package:smile_front/app/modules/home/ui/pages/home2/home2_page.dart';
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
    Bind.lazySingleton<Home2Repository>((i) => Home2Repository()),
    Bind.lazySingleton((i) => Home2Controller(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const Home1Page()),
    ChildRoute('/home4', child: (_, args) => const Home4Page()),
    ChildRoute('/home2', child: (_, args) => const Home2Page()),
  ];
}
