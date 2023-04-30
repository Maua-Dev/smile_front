import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/help_controller.dart';

import 'domain/repositories/faq_repository_interface.dart';
import 'domain/usecases/get_faq_information.dart';
import 'external/faq_datasource_impl.dart';
import 'infra/datasources/faq_datasource_interface.dart';
import 'infra/repository/faq_repository_impl.dart';
import 'ui/user/help_page.dart';

class FaqModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<FaqDatasourceInterface>((i) => FaqDatasourceImpl()),
    Bind.lazySingleton<FaqRepositoryInterface>(
        (i) => FaqRepositoryImpl(datasource: i())),
    Bind.lazySingleton<GetAllFaqInformationInterface>(
        (i) => GetAllInformation(repository: i())),
    Bind.lazySingleton<HelpController>((i) => HelpController(
          getAllFaqInformation: i(),
        )),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => const HelpPage(),
      transition: TransitionType.rightToLeft,
    ),
  ];
}
