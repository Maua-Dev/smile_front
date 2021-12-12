import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/home/ui/pages/home2/home2_controller.dart';
import 'package:smile_front/app/modules/home/ui/pages/home2/home2_page.dart';
import 'package:smile_front/app/modules/home/ui/pages/home2/repositories/home2_repository.dart';
import 'package:smile_front/app/modules/home/ui/pages/home2/repositories/home2_repository_interface.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => Home2Controller(i())),
    Bind.lazySingleton<IHome2Repository>((i) => Home2Repository()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const Home2Page()),
  ];
}
