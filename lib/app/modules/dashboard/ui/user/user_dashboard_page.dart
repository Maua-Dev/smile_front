import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/shared/widgets/text_header_scratched.dart';
import '../../../../shared/themes/app_colors.dart';
import '../../presenter/controllers/user/user_dashboard_controller.dart';
import '../widgets/activities_carousel_widget.dart';
import '../widgets/logout_button_widget.dart';
import '../widgets/next_activity_card_widget.dart';
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 72.0),
              child: Observer(builder: (_) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextHeaderScratched(
                      title: 'Olá, ${controller.userName}',
                      fontSize: 50,
                    ),
                    LogoutButtonWidget(
                      backgroundColor: AppColors.brandingOrange,
                      buttonTittle: 'Sair',
                      onPressed: () {
                        controller.logout();
                      },
                    ),
                  ],
                );
              }),
            ),
            const SizedBox(
              height: 48,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 72.0),
              child: TextHeaderScratched(
                title: 'Próxima Atividade',
                fontSize: 38,
              ),
            ),
            Observer(builder: (_) {
              return NextActivityCardWidget(
                onTap: () {
                  moreInfoDialogWidget(context, controller.nextActivity);
                },
                cardColor: AppColors.brandingOrange,
                textColor: Colors.white,
                name: controller.nextActivity.title,
                description: controller.nextActivity.description,
                date: controller.nextActivity.schedule[0].date,
                totalParticipants:
                    controller.nextActivity.schedule[0].totalParticipants,
              );
            }),
            const TextHeaderScratched(
              title: 'Minhas Atividades',
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
    );
  }
}
