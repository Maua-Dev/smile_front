import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/dashboard/ui/user/widgets/vertical-nav-bar/nav_bar_button_widget.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';

import '../../../../../../shared/widgets/bottom_navigation_bar/bottom_navigation_bar_controller.dart';

class VerticalNavBarWidget extends StatelessWidget {
  final String? accessLevel;

  const VerticalNavBarWidget({Key? key, this.accessLevel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Modular.get<NavigationBarController>();
    return Observer(builder: (context) {
      return Container(
        color: AppColors.brandingBlue,
        height: MediaQuery.of(context).size.height,
        width: 120,
        child: Padding(
          padding: const EdgeInsets.only(top: 32.0),
          child: Column(children: [
            VerticalNavBarButtonWidget(
              buttonText: 'INÍCIO',
              indexToShow: controller.indexToShow,
              icon: Icons.home,
              myIndex: 0,
              onPressed: () {
                controller.toggleIndex(0);
                Modular.to.navigate('/home');
              },
            ),
            const SizedBox(
              height: 32,
            ),
            VerticalNavBarButtonWidget(
              buttonText: 'PERFIL',
              indexToShow: controller.indexToShow,
              myIndex: 1,
              onPressed: () async {
                await controller.toggleIndex(1);
                Modular.to.navigate('/user/home');
              },
              icon: Icons.person,
            ),
            const SizedBox(
              height: 32,
            ),
            VerticalNavBarButtonWidget(
              buttonText: 'ATIVIDADES',
              indexToShow: controller.indexToShow,
              myIndex: 2,
              onPressed: () async {
                await controller.toggleIndex(2);
                Modular.to.navigate('/user/home/all-activities');
              },
              icon: Icons.grid_on,
            ),
            const SizedBox(
              height: 32,
            ),
            VerticalNavBarButtonWidget(
              buttonText: 'CERTIFICADOS',
              indexToShow: controller.indexToShow,
              myIndex: 3,
              onPressed: () async {
                await controller.toggleIndex(3);
                Modular.to.navigate('/user/home/certificate');
              },
              icon: Icons.assignment,
            ),
            const SizedBox(
              height: 32,
            ),
            VerticalNavBarButtonWidget(
              buttonText: 'AJUDA',
              indexToShow: controller.indexToShow,
              myIndex: 4,
              onPressed: () async {
                await controller.toggleIndex(4);
                Modular.to.navigate('/user/home/help');
              },
              icon: Icons.help,
            ),
          ]),
        ),
      );
    });
  }
}
