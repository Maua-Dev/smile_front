import 'dart:async';

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
import 'package:smile_front/app/shared/models/user_model.dart';

class LoggedUserHomePage extends StatefulWidget {
  final UserModel user;
  const LoggedUserHomePage({Key? key, required this.user}) : super(key: key);

  @override
  _LoggedHomePageState createState() => _LoggedHomePageState();
}

class _LoggedHomePageState
    extends ModularState<LoggedUserHomePage, LoggedHomeController> {
  late Timer _timer;

  @override
  void initState() {
    _timer = Timer.periodic(
      const Duration(seconds: 20),
      (Timer t) => setState(() {
        controller.getTime();
      }),
    );

    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

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
                String date =
                    DateFormat('dd/MM/yyyy').format(controller.activity.date);
                String time =
                    DateFormat('hh:mm').format(controller.activity.date);
                return MainNavigationButtonWidget(
                  userName: widget.user.socialName,
                  activityName: controller.activity.name,
                  activityDate: date,
                  activityTime: time,
                  activityRemainTime: '13:00',
                  cardWidth: 664,
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
                          Modular.to.navigate('/user-home/filter-dashboard');
                        },
                      ),
                      const NavigationButtonWidget(
                        title: 'Atividades Inscritas',
                        icon: Icons.ac_unit_outlined,
                      ),
                    ],
                  ),
                  TimerNavigationButtonWidget(
                    time: controller.formatTime,
                  ),
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
