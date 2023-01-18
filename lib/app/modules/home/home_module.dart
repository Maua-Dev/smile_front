import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/home/presenter/controllers/speakers_home_controller.dart';
import 'package:smile_front/app/modules/home/ui/pages/home_page.dart';
import 'package:smile_front/app/modules/home/ui/pages/more_info_home_page.dart';
import 'package:smile_front/app/shared/error/error_page.dart';
import '../../shared/services/dio/smile_login_options.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SpeakersHomeController()),
    Bind.lazySingleton((i) => Dio(smileLoginOption))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
    ChildRoute('/home-more-info', child: (_, args) => const MoreInfoHomePage()),
    WildcardRoute(child: (context, args) => const ErrorPage()),
  ];
}
