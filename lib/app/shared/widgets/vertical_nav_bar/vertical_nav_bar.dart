// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/widgets/vertical_nav_bar/vertical_nav_bar_controller.dart';
import 'package:smile_front/app/shared/widgets/vertical_nav_bar/widgets/nav_bar_button_widget.dart';

class VerticalNavBar extends StatelessWidget {
  var controller = VerticalNavBarController();
  final String? accessLevel;

  VerticalNavBar({Key? key, this.accessLevel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Container(
        color: AppColors.brandingPurple,
        height: MediaQuery.of(context).size.height,
        width: 120,
        child: Padding(
          padding: const EdgeInsets.only(top: 32.0),
          child: Column(children: [
            NavBarButtonWidget(
              buttonText: 'INÍCIO',
              indexToShow: controller.indexToShow,
              icon: Icons.apps_outlined,
              myIndex: 0,
              onPressed: () {
                controller.toggleIndex(0);
                Modular.to.navigate('/user');
              },
            ),
            const SizedBox(
              height: 30,
            ),
            NavBarButtonWidget(
              buttonText: 'ATIVIDADES',
              indexToShow: controller.indexToShow,
              myIndex: 1,
              onPressed: () async {
                await controller.toggleIndex(1);
                Modular.to.navigate('/user/all-activities');
              },
              icon: Icons.library_books,
            ),
            const SizedBox(
              height: 30,
            ),
            // NavBarButtonWidget(
            //   buttonText: 'CERTIFICADOS',
            //   indexToShow: controller.indexToShow,
            //   myIndex: 2,
            //   onPressed: () {
            //     controller.toggleIndex(2);
            //     // Modular.to.navigate('/');
            //   },
            //   icon: Icons.assignment,
            // ),
          ]),
        ),
      );
    });
  }
}
