import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/dashboard/ui/dashboard_activities_page.dart';
// import 'package:smile_front/app/modules/dashboard_user/ui/certificates_page.dart';
// import 'package:smile_front/app/modules/dashboard_user/ui/activities_page.dart';
// import 'package:smile_front/app/modules/dashboard_user/ui/reports_page.dart';
// import 'package:smile_front/app/modules/dashboard_user/ui/users_page.dart';
import 'package:smile_front/app/shared/widgets/vertical_nav_bar/vertical_nav_bar.dart';
import 'package:smile_front/app/shared/widgets/vertical_nav_bar/vertical_nav_bar_controller.dart';

class IndexPages extends StatefulWidget {
  const IndexPages({Key? key}) : super(key: key);

  @override
  _IndexPagesState createState() => _IndexPagesState();
}

class _IndexPagesState
    extends ModularState<IndexPages, VerticalNavBarController> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Row(
      children: [
        const VerticalNavBar(
          isAdmin: false,
        ),
        Observer(builder: (_) {
          if (controller.indexToShow == 1) {
            return const Expanded(child: DashboardActivitiesPage());
          } else if (controller.indexToShow == 2) {
            return const Expanded(child: DashboardActivitiesPage());
          } else if (controller.indexToShow == 3) {
            return const Expanded(child: DashboardActivitiesPage());
          } else if (controller.indexToShow == 4) {
            return const Expanded(child: DashboardActivitiesPage());
          }
          return Container();
        })
      ],
    ));
  }
}
