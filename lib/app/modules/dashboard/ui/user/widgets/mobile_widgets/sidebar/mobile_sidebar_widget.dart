import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/shared/entities/screen_variables.dart';
import 'package:smile_front/generated/l10n.dart';
import '../../../../../../../shared/themes/app_colors.dart';
import '../../../../../../../shared/utils/screen_helper.dart';

class DrawerDashboardWidget extends StatelessWidget {
  DrawerDashboardWidget({super.key, required this.isProfessor});

  final bool isProfessor;

  final List<String> userOptions = [
    S.current.drawerHomeButton,
    S.current.drawerProfileButton,
    S.current.drawerActivitiesButton,
    S.current.drawerCertificatesButton,
    S.current.drawerHelpButton,
  ];

  final List<String> userRoutes = [
    '/home',
    '/user/home',
    '/user/home/all-activities',
    '/user/home/certificate',
    '/user/home/help'
  ];

  final List<String> professorOptions = [
    S.current.drawerHomeButton,
    S.current.drawerProfileButton,
    S.current.drawerActivitiesButton,
    S.current.drawerResponsibleActivitiesButton,
    S.current.drawerCertificatesButton,
    S.current.drawerHelpButton,
  ];

  final List<String> professorRoutes = [
    '/home',
    '/user/home',
    '/user/home/all-activities',
    '/user/home/professor',
    '/user/home/certificate',
    '/user/home/help'
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: Screen.width(context) < cellphoneSize
          ? Screen.width(context) * 0.6
          : Screen.width(context) * 0.3,
      backgroundColor: AppColors.brandingBlue,
      child: ListView.builder(
        itemCount:
            (isProfessor ? professorOptions.length : userOptions.length) + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) return SizedBox(height: Screen.height(context) * 0.1);
          var i = index - 1;
          return SideBarContents(
            title: isProfessor ? professorOptions[i] : userOptions[i],
            route: isProfessor ? professorRoutes[i] : userRoutes[i],
          );
        },
      ),
    );
  }
}

class SideBarContents extends StatelessWidget {
  final String title;
  final String route;
  const SideBarContents({
    super.key,
    required this.title,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: GestureDetector(
        onTap: () {
          Scaffold.of(context).closeDrawer();
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
