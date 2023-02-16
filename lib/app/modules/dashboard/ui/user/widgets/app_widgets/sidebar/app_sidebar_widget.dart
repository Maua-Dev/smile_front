import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/shared/entities/screen_variables.dart';

import '../../../../../../../shared/themes/app_colors.dart';
import '../../../../../../../shared/utils/screen_helper.dart';

class NavBarWidget extends StatelessWidget {
  NavBarWidget({super.key});

  final List<String> options = [
    "Perfil",
    "Atividades",
    "Certificados",
    "Ajuda"
  ];

  final List<String> routes = [
    '/user/home',
    '/user/home/all-activities',
    '/user/home/certificate',
    '/user/home/help'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Screen.height(context) * 0.1),
      child: Drawer(
        width: Screen.width(context) < cellphoneSize
            ? Screen.width(context) * 0.6
            : Screen.width(context) * 0.3,
        backgroundColor: AppColors.brandingBlue,
        child: ListView.builder(
          itemCount: options.length,
          itemBuilder: (BuildContext context, int index) {
            return SideBarContents(
              title: options[index],
              route: routes[index],
            );
          },
        ),
      ),
    );
  }
}

class SideBarContents extends StatelessWidget {
  const SideBarContents({super.key, required this.title, required this.route});

  final String title;
  final String route;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: GestureDetector(
        onTap: () async {
          Modular.to.navigate(route);
        },
        child: Container(
          decoration:
              BoxDecoration(color: AppColors.brandingBlue, boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 32, 32, 32),
              blurRadius: 3,
              offset: Offset(-5, 0),
            )
          ]),
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 14, bottom: 14),
            child: Text(
              title,
              style: const TextStyle(
                  color: Color.fromARGB(255, 228, 228, 228), fontSize: 22),
            ),
          ),
        ),
      ),
    );
  }
}