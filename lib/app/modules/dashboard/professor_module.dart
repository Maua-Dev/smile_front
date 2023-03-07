import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/more_info_responsible_activities_controller.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/professor/responsible_activities_controller.dart';
import 'package:smile_front/app/modules/dashboard/ui/user/pages/professor/more_info_responsible_activities_page.dart';
import 'package:smile_front/app/modules/dashboard/ui/user/pages/professor/responsible_activities_page.dart';

class ProfessorModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<ResponsibleActivitiesController>(
        (i) => ResponsibleActivitiesController(
              storage: i(),
              getUserSubscribedActivities: i(),
            ),
        export: true),
    Bind.lazySingleton<MoreInfoResponsibleActivitiesController>((i) =>
        MoreInfoResponsibleActivitiesController(
            postManualChangeAttendence: i(),
            generateConfirmationCode: i(),
            activityCode: i.args!.data as String,
            getActivitiesWithEnrollments: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => const ResponsibleActivitiesPage()),
    ChildRoute('/responsible-activities',
        child: (_, args) => const MoreInfoResponsibleActivitiesPage()),
  ];
}
