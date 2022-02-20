import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/user_pages/presenter/controllers/subscribed_activities_controller.dart';
import 'package:smile_front/app/shared/widgets/dashboard-appbar/dashboard_appbar_widget.dart';
import 'package:smile_front/app/shared/widgets/text_header_scratched.dart';

import 'widgets/header_table_widget.dart';
import 'widgets/row_table_widget.dart';

class SubscribedActivitiesPage extends StatefulWidget {
  const SubscribedActivitiesPage({Key? key}) : super(key: key);

  @override
  _ActivitiesPageState createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends ModularState<SubscribedActivitiesPage,
    SubscribedActivitiesController> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          const DashboardAppbarWidget(),
          const TextHeaderScratched(title: 'Atividades Inscritas'),
          const Padding(
            padding:
                EdgeInsets.only(top: 32.0, left: 32, right: 32, bottom: 16),
            child: HeaderTableWidget(),
          ),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 4),
          //   child: RowTableWidget(),
          // ),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 4),
          //   child: RowTableWidget(),
          // )

          Observer(builder: (_) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 38.0),
                itemCount: controller.activitiesList.length,
                itemBuilder: (BuildContext context, int index) {
                  return RowTableWidget(
                    id: controller.activitiesList[index].id,
                    name: controller.activitiesList[index].name,
                    activityType: controller.activitiesList[index].activityType,
                    date: controller.activitiesList[index].date,
                    description: controller.activitiesList[index].description,
                    maxParticipants:
                        controller.activitiesList[index].maxParticipants,
                    totalParticipants:
                        controller.activitiesList[index].totalParticipants,
                    time: controller.activitiesList[index].time,
                    unsubscribeActivityFunction: controller.unsubscribeActivity,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 4,
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
