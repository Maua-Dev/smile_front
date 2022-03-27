import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/shared/widgets/text-header/text_header.dart';
import '../../../../shared/themes/app_colors.dart';
import '../../presenter/controllers/user/user_dashboard_controller.dart';
import '../widgets/next_activity_card_widget.dart';
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
      body: SingleChildScrollView(
        child: Column(
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
            TextHeader(
              title: 'Seu Calendário',
              fontSize: MediaQuery.of(context).size.width < 1000 ? 30 : 38,
              leftPadding: MediaQuery.of(context).size.width < 1000 ? 12 : 24,
            ),
            Observer(builder: (_) {
              return Column(
                children: const [
                  UserWeekdayFilterWidget(),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
