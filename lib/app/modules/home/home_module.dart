import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/home/infra/repository/speakers_repository_impl.dart';
import 'package:smile_front/app/modules/home/presenter/controllers/speakers_home_controller.dart';
import 'package:smile_front/app/modules/home/presenter/controllers/activity_home_controller.dart';
import 'package:smile_front/app/modules/home/ui/pages/home_page.dart';
import 'package:smile_front/app/modules/home/ui/pages/more_info_home_page.dart';
import '../../shared/services/dio/smile_login_options.dart';
import 'external/speakers_datasource_impl.dart';
import 'infra/datasources/speakers_datasource_interface.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ActivityHomeController(i())),
    Bind.lazySingleton<SpeakersRepositoryImpl>((i) => SpeakersRepositoryImpl()),
    Bind.lazySingleton((i) => SpeakersHomeController(repository: i())),
    Bind.lazySingleton<SpeakersDatasourceInterface>(
        (i) => SpeakersDatasourceImpl()),
    Bind.lazySingleton((i) => Dio(smileLoginOption))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
    ChildRoute('/home-more-info', child: (_, args) => const MoreInfoHomePage())
  ];
}
