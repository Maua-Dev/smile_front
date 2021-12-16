import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/logged-home/presenter/controllers/logged_home_controller.dart';
import 'package:smile_front/app/modules/logged-home/ui/widgets/main_navigation_button_widget.dart';
import 'package:smile_front/app/modules/logged-home/ui/widgets/navigation_button_widget.dart';
import 'package:smile_front/app/modules/logged-home/ui/widgets/timer_navigation_button_widget.dart';

class LoggedHomePage extends StatefulWidget {
  const LoggedHomePage({Key? key}) : super(key: key);

  @override
  _LoggedHomePageState createState() => _LoggedHomePageState();
}

class _LoggedHomePageState
    extends ModularState<LoggedHomePage, LoggedHomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
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
          const NavigationButtonWidget(
            title: 'Atividades Escritas',
            icon: Icons.ac_unit_outlined,
          ),
          const TimerNavigationButtonWidget(),
        ],
      ),
    );
  }
}
