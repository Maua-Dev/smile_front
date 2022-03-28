import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:smile_front/app/shared/widgets/text-header/text_header.dart';
import '../../presenter/controllers/user/user_dashboard_controller.dart';
import '../widgets/next_activity_card_widget.dart';
import '../widgets/user_weekday/user_activity_card_widget.dart';
import '../widgets/user_weekday/user_weekday_filter_widget.dart';
import 'more_info_dialog_widget.dart';

class UserDashboardPage extends StatefulWidget {
  const UserDashboardPage({Key? key}) : super(key: key);

  @override
  _UserDashboardPageState createState() => _UserDashboardPageState();
}

class _UserDashboardPageState
    extends ModularState<UserDashboardPage, UserDashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 72.0),
            child: TextHeader(
              title: 'Sua Próxima Atividade',
              fontSize: MediaQuery.of(context).size.width < 1000 ? 30 : 38,
              leftPadding: MediaQuery.of(context).size.width < 1000 ? 12 : 24,
            ),
          ),
          Observer(builder: (_) {
            return NextActivityCardWidget(
              isUser: true,
              link: controller.nextActivity.schedule[0].link,
              location: controller.nextActivity.schedule[0].location,
              duration: controller.nextActivity.schedule[0].duration,
              onTap: () {
                moreInfoDialogWidget(context, controller.nextActivity);
              },
              name: controller.nextActivity.title,
              description: controller.nextActivity.description,
              date: controller.nextActivity.schedule[0].date,
            );
          }),
          TextHeader(
            title: 'Seu Calendário',
            fontSize: MediaQuery.of(context).size.width < 1000 ? 30 : 38,
            leftPadding: MediaQuery.of(context).size.width < 1000 ? 12 : 24,
          ),
          UserWeekdayFilterWidget(
            onPressed: controller.toggleFilterActivityChipIndex,
          ),
          Observer(builder: (_) {
            return Flexible(
              child: ListView.builder(
                itemCount: controller.weekActivitiesList.length,
                itemBuilder: (context, index) {
                  var hour = DateFormat('HH:mm')
                      .format(controller.weekActivitiesList[index].date!);
                  return UserActivityCardWidget(
                    title: controller.weekActivitiesList[index].title,
                    hour: hour,
                    activityCode:
                        controller.weekActivitiesList[index].activityCode,
                    onTap: () {},
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
