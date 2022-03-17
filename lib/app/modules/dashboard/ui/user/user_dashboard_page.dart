import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:smile_front/app/modules/dashboard/ui/widgets/activity_card_widget.dart';
import 'package:smile_front/app/shared/widgets/dashboard-appbar/dashboard_appbar_widget.dart';
import 'package:smile_front/app/shared/widgets/text_header_scratched.dart';
import 'package:smile_front/app/shared/widgets/vertical_nav_bar/vertical_nav_bar.dart';
import '../../../../shared/themes/app_colors.dart';
import '../../presenter/controllers/user/user_dashboard_controller.dart';
import '../widgets/activities_carousel_widget.dart';

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
      body: Row(
        children: [
          VerticalNavBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 72.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        TextHeaderScratched(
                          title: 'Próximas Atividades',
                          fontSize: 50,
                        ),
                        DashboardAppbarWidget(),
                      ],
                    ),
                  ),
                  Observer(builder: (_) {
                    var activity = controller.nextActivity;
                    var date = DateFormat('dd/MM/yyyy')
                        .format(activity.schedule[0].date!);
                    var time =
                        DateFormat('HH:mm').format(activity.schedule[0].date!);
                    return ActivityCardWidget(
                      onTap: () async {
                        Modular.to.navigate(
                          '/user',
                        );
                      },
                      cardColor: AppColors.brandingOrange,
                      textColor: Colors.white,
                      name: activity.title,
                      description: activity.description,
                      date: date,
                      time: time,
                      totalParticipants: activity.schedule[0].totalParticipants,
                    );
                  }),
                  const TextHeaderScratched(
                    title: 'Todas Atividades',
                    fontSize: 38,
                  ),
                  Observer(builder: (_) {
                    return Column(
                      children: [
                        ActivitiesCarouselWidget(
                          list: controller.mondayActivitiesList,
                          weekday: 0,
                        ),
                        ActivitiesCarouselWidget(
                          list: controller.tuesdayActivitiesList,
                          weekday: 1,
                        ),
                        ActivitiesCarouselWidget(
                          list: controller.wednesdayActivitiesList,
                          weekday: 2,
                        ),
                        ActivitiesCarouselWidget(
                          list: controller.thursdayActivitiesList,
                          weekday: 3,
                        ),
                        ActivitiesCarouselWidget(
                          list: controller.fridayActivitiesList,
                          weekday: 4,
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
