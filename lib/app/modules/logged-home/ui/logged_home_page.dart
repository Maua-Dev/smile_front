import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/logged-home/presenter/controllers/logged_home_controller.dart';
import 'package:smile_front/app/modules/logged-home/ui/widgets/main_navigation_button_widget.dart';
import 'package:smile_front/app/modules/logged-home/ui/widgets/navigation_button_widget.dart';
import 'package:smile_front/app/modules/logged-home/ui/widgets/sponsorship_navigation_button.dart';
import 'package:smile_front/app/modules/logged-home/ui/widgets/timer_navigation_button_widget.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

class LoggedHomePage extends StatefulWidget {
  const LoggedHomePage({Key? key}) : super(key: key);

  @override
  _LoggedHomePageState createState() => _LoggedHomePageState();
}

class _LoggedHomePageState
    extends ModularState<LoggedHomePage, LoggedHomeController> {
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 240),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Text(
                        '<',
                        style: AppTextStyles.buttonBold.copyWith(
                            color: AppColors.brandingBlue, fontSize: 50),
                      ),
                    ),
                    Text('>',
                        style: AppTextStyles.buttonBold.copyWith(
                            color: AppColors.lightBlue, fontSize: 50)),
                  ],
                ),
                Image.asset(
                  'assets/images/logo_smile.png',
                  fit: BoxFit.cover,
                  height: 40,
                ),
              ],
            ),
          ),
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
