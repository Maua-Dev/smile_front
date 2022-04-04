import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/home/infra/repository/speakers_repository_impl.dart';
import 'package:smile_front/app/modules/home/presenter/controllers/speakers_home_controller.dart';
import 'package:smile_front/app/modules/home/presenter/controllers/activity_home_controller.dart';
import 'package:smile_front/app/modules/home/ui/pages/home_page.dart';
import 'external/speakers_datasource_impl.dart';
import 'infra/datasources/speakers_datasource_interface.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ActivityHomeController(i())),
    Bind.lazySingleton((i) => PageController()),
    Bind.lazySingleton<SpeakersRepositoryImpl>((i) => SpeakersRepositoryImpl()),
    Bind.lazySingleton((i) => ActivityHomeController(i())),
    Bind.lazySingleton((i) => SpeakersHomeController(repository: i())),
    Bind.lazySingleton<SpeakersDatasourceInterface>(
        (i) => SpeakersDatasourceImpl()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
  ];
}
