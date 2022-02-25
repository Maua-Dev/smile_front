import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:smile_front/app/modules/logged-home/presenter/controllers/logged_home_controller.dart';
import 'package:smile_front/app/modules/logged-home/ui/widgets/appbar_logo_widget.dart';
import 'package:smile_front/app/modules/logged-home/ui/widgets/main_navigation_button_widget.dart';
import 'package:smile_front/app/modules/logged-home/ui/widgets/navigation_button_widget.dart';
import 'package:smile_front/app/modules/logged-home/ui/widgets/sponsorship_navigation_button.dart';
import 'package:smile_front/app/modules/logged-home/ui/widgets/timer_navigation_button_widget.dart';

class LoggedAdmHomePage extends StatefulWidget {
  const LoggedAdmHomePage({Key? key}) : super(key: key);

  @override
  _LoggedAdmHomePageState createState() => _LoggedAdmHomePageState();
}

class _LoggedAdmHomePageState
    extends ModularState<LoggedAdmHomePage, LoggedHomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const AppbarLogoWidget(),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Observer(builder: (_) {
            String date =
                DateFormat('dd/MM/yyyy').format(controller.activity.date);
            String time = DateFormat('hh:mm').format(controller.activity.date);
            return MainNavigationButtonWidget(
              userName: controller.user.socialName,
              activityName: controller.activity.name,
              activityDate: date,
              activityTime: time,
              activityRemainTime: '13:00',
            );
          }),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NavigationButtonWidget(
                    title: 'Todas as atividades',
                    icon: Icons.ac_unit_outlined,
                    onPressed: () {
                      Modular.to.navigate('/logged-home/filter-dashboard',
                          arguments: controller.accessLevel);
                    },
                  ),
                  NavigationButtonWidget(
                    title: 'Atividades Inscritas',
                    icon: Icons.ac_unit_outlined,
                    onPressed: () {},
                  ),
                  NavigationButtonWidget(
                    title: 'Todas as atividades',
                    icon: Icons.ac_unit_outlined,
                    onPressed: () {},
                  ),
                ],
              ),
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
                  NavigationButtonWidget(
                    title: 'Todas as atividades',
                    icon: Icons.ac_unit_outlined,
                  ),
                ],
              ),
            ],
          ),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          TimerNavigationButtonWidget(
            time: controller.formatTime,
            userType: 'adm',
          ),
          const NavigationButtonWidget(
            title: 'Atividades Inscritas',
            icon: Icons.ac_unit_outlined,
          ),
          const NavigationButtonWidget(
            title: 'Todas as atividades',
            icon: Icons.ac_unit_outlined,
          ),
          const NavigationButtonWidget(
            title: 'Todas as atividades',
            icon: Icons.ac_unit_outlined,
          ),
        ]),
        const SponsorshipNavigationButton(),
      ]),
    );
  }
}
