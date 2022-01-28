import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/dashboard_controller.dart';
import 'package:smile_front/app/modules/dashboard/ui/widgets/activity_card_widget.dart';
import 'package:smile_front/app/shared/widgets/dashboard-appbar/dashboard_appbar_widget.dart';
import 'package:smile_front/app/shared/widgets/text_header_scratched.dart';
import 'package:smile_front/app/shared/widgets/vertical_nav_bar/vertical_nav_bar.dart';

class DashboardActivitiesPage extends StatefulWidget {
  const DashboardActivitiesPage({Key? key}) : super(key: key);

  @override
  _DashboardActivitiesPageState createState() =>
      _DashboardActivitiesPageState();
}

class _DashboardActivitiesPageState
    extends ModularState<DashboardActivitiesPage, DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Row(children: [
      VerticalNavBar(),
      Expanded(
        child: Column(
          children: [
            const DashboardAppbarWidget(),
            const TextHeaderScratched(title: 'Atividades'),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 64, vertical: 32),
                child: Observer(builder: (_) {
                  return GridView.builder(
                    itemCount: controller.activitiesList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 8,
                            childAspectRatio: 1.7),
                    itemBuilder: (context, index) => ActivityCardWidget(
                      name: controller.activitiesList[index].name,
                      date: controller.activitiesList[index].date,
                      description: controller.activitiesList[index].description,
                      maxParticipants:
                          controller.activitiesList[index].maxParticipants,
                      totalParticipants:
                          controller.activitiesList[index].totalParticipants,
                      time: controller.activitiesList[index].time,
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      )
    ]));
  }
}
