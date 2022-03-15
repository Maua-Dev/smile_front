// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/widgets/vertical_nav_bar/vertical_nav_bar_controller.dart';

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
          padding: const EdgeInsets.only(top: 100.0),
          child: Column(children: [
            TextButton(
              onPressed: () {
                controller.toggleIndex(0);
                Modular.to.navigate('/user');
              },
              child: Column(
                children: [
                  Icon(
                    Icons.apps_outlined,
                    color: controller.indexToShow == 0
                        ? AppColors.brandingOrange
                        : Colors.white,
                    size: 55,
                  ),
                  Text(
                    'MENU',
                    style: TextStyle(
                        color: controller.indexToShow == 0
                            ? AppColors.brandingOrange
                            : Colors.white,
                        fontSize: 15),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {
                controller.toggleIndex(1);
                // Modular.to.navigate('/');
              },
              child: Column(
                children: [
                  Icon(
                    Icons.mic,
                    color: controller.indexToShow == 1
                        ? AppColors.brandingOrange
                        : Colors.white,
                    size: 55,
                  ),
                  Text(
                    'ATIVIDADES',
                    style: TextStyle(
                        color: controller.indexToShow == 1
                            ? AppColors.brandingOrange
                            : Colors.white,
                        fontSize: 15),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {
                controller.toggleIndex(2);
                // Modular.to.navigate('/');
              },
              child: Column(
                children: [
                  Icon(
                    Icons.person,
                    color: controller.indexToShow == 2
                        ? AppColors.brandingOrange
                        : Colors.white,
                    size: 55,
                  ),
                  Text(
                    'USUÁRIOS',
                    style: TextStyle(
                        color: controller.indexToShow == 2
                            ? AppColors.brandingOrange
                            : Colors.white,
                        fontSize: 15),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {
                controller.toggleIndex(3);
                // Modular.to.navigate('/');
              },
              child: Column(
                children: [
                  Icon(
                    Icons.assignment_turned_in,
                    color: controller.indexToShow == 3
                        ? AppColors.brandingOrange
                        : Colors.white,
                    size: 55,
                  ),
                  Text(
                    'CERTIFICADOS',
                    style: TextStyle(
                        color: controller.indexToShow == 3
                            ? AppColors.brandingOrange
                            : Colors.white,
                        fontSize: 15),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {
                controller.toggleIndex(4);
                // Modular.to.navigate('/');
              },
              child: Column(
                children: [
                  Icon(
                    Icons.insert_chart_rounded,
                    color: controller.indexToShow == 4
                        ? AppColors.brandingOrange
                        : Colors.white,
                    size: 55,
                  ),
                  Text(
                    'RELATÓRIOS',
                    style: TextStyle(
                        color: controller.indexToShow == 4
                            ? AppColors.brandingOrange
                            : Colors.white,
                        fontSize: 15),
                  )
                ],
              ),
            ),
          ]),
        ),
      );
    });
  }
}
