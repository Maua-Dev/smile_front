import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/widgets/bottom_navigation_bar/bottom_navigation_bar_controller.dart';
import 'widgets/nav_bar_button_widget.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final String? accessLevel;

  const BottomNavigationBarWidget({Key? key, this.accessLevel})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Modular.get<NavigationBarController>();
    return Observer(builder: (context) {
      return Container(
        padding: MediaQuery.of(context).size.width < 1000
            ? const EdgeInsets.symmetric(horizontal: 0)
            : EdgeInsets.symmetric(
                horizontal: (MediaQuery.of(context).size.width - 1000.0) / 2),
        color: AppColors.brandingBlue,
        height: MediaQuery.of(context).size.height * 0.08,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavBarButtonWidget(
                indexToShow: controller.indexToShow,
                icon: Icons.home,
                myIndex: 0,
                onPressed: () {
                  controller.toggleIndex(0);
                  Modular.to.navigate('/home');
                },
              ),
              NavBarButtonWidget(
                indexToShow: controller.indexToShow,
                myIndex: 1,
                onPressed: () async {
                  controller.toggleIndex(1);
                  Modular.to.navigate('/user/home');
                },
                icon: Icons.person,
              ),
              NavBarButtonWidget(
                indexToShow: controller.indexToShow,
                myIndex: 2,
                onPressed: () async {
                  await controller.toggleIndex(2);
                  Modular.to.navigate('/user/home/all-activities');
                },
                icon: Icons.grid_on,
              ),
              NavBarButtonWidget(
                indexToShow: controller.indexToShow,
                myIndex: 3,
                onPressed: () async {
                  await controller.toggleIndex(3);
                  Modular.to.navigate('/user/home/certificate');
                },
                icon: Icons.assignment,
              ),
              NavBarButtonWidget(
                indexToShow: controller.indexToShow,
                myIndex: 4,
                onPressed: () async {
                  await controller.toggleIndex(4);
                  Modular.to.navigate('/user/home/help');
                },
                icon: Icons.help,
              ),
            ]),
      );
    });
  }
}
