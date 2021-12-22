import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/logged-home/presenter/controllers/logged_home_controller.dart';
import 'package:smile_front/app/modules/logged-home/ui/widgets/appbar_logo_widget.dart';
import 'package:smile_front/app/modules/logged-home/ui/widgets/main_navigation_button_widget.dart';
import 'package:smile_front/app/modules/logged-home/ui/widgets/navigation_button_widget.dart';
import 'package:smile_front/app/modules/logged-home/ui/widgets/sponsorship_navigation_button.dart';
import 'package:smile_front/app/modules/logged-home/ui/widgets/timer_navigation_button_widget.dart';

class LoggedUserHomePage extends StatefulWidget {
  const LoggedUserHomePage({Key? key}) : super(key: key);

  @override
  _LoggedHomePageState createState() => _LoggedHomePageState();
}

class _LoggedHomePageState
    extends ModularState<LoggedUserHomePage, LoggedHomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AppbarLogoWidget(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Observer(builder: (_) {
                return MainNavigationButtonWidget(
                  userName: controller.user.name,
                  activityName: controller.activity.activityName,
                  activityDate: controller.activity.activityDate,
                  activityTime: controller.activity.activityTime,
                  activityRemainTime: controller.activity.activityRemainTime,
                );
              }),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      NavigationButtonWidget(
                        title: 'Atividades Inscritas',
                        icon: Icons.ac_unit_outlined,
                      ),
                      NavigationButtonWidget(
                        title: 'Todas as atividades',
                        icon: Icons.ac_unit_outlined,
                      ),
                    ],
                  ),
                  const TimerNavigationButtonWidget(),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  NavigationButtonWidget(
                    title: 'Certificados',
                    icon: Icons.ac_unit_outlined,
                  ),
                  NavigationButtonWidget(
                    title: 'Ajuda',
                    icon: Icons.help,
                  ),
                ],
              )
            ],
          ),
          const SponsorshipNavigationButton(),
        ],
      ),
    );
  }
}
