import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/home/infra/repository/speakers_repository_impl.dart';
import 'package:smile_front/app/modules/home/infra/repository/lecture_images_repository_impl.dart';
import 'package:smile_front/app/modules/home/presenter/controllers/about_home_controller.dart';
import 'package:smile_front/app/modules/home/presenter/controllers/previous_editions_home_controller.dart';
import 'package:smile_front/app/modules/home/ui/pages/home_page.dart';
import 'package:smile_front/app/modules/home/presenter/controllers/activity_home_controller.dart';
import 'domain/repositories/lecture_images_repository_interface.dart';
import 'domain/repositories/rectors_repository_interface.dart';
import 'external/lecture_images_datasource_impl.dart';
import 'external/rectors_datasource_impl.dart';
import 'infra/datasources/lecture_images_datasource_interface.dart';
import 'infra/datasources/rectors_datasource_interface.dart';
import 'infra/repository/rectors_repository_impl.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AboutHomeController(i())),
    Bind.lazySingleton<LectureImagesRepositoryInterface>(
        (i) => LectureImagesRepositoryImpl(datasource: i())),
    Bind.lazySingleton((i) => PreviousEditionsHomeController(repository: i())),
    Bind.lazySingleton<LectureImagesDatasourceInterface>(
        (i) => LectureImagesDatasourceImpl()),
    Bind.lazySingleton<SpeakersRepositoryImpl>((i) => SpeakersRepositoryImpl()),
    Bind.lazySingleton((i) => AboutHomeController(i())),
    Bind.lazySingleton<RectorsRepositoryInterface>(
        (i) => RectorsRepositoryImpl(datasource: i())),
    Bind.lazySingleton((i) => ActivityHomeController(repository: i())),
    Bind.lazySingleton<RectorsDatasourceInterface>(
        (i) => RectorsDatasourceImpl()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
  ];
}
