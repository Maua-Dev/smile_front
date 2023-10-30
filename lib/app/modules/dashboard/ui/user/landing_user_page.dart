import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/dashboard/ui/user/widgets/mobile_widgets/sidebar/mobile_sidebar_widget.dart';
import 'package:smile_front/app/modules/dashboard/ui/user/widgets/vertical-nav-bar/vertical_nav_bar_widget.dart';
import 'package:smile_front/app/shared/entities/screen_variables.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import '../../../../shared/helpers/utils/screen_helper.dart';
import '../../../auth/presenter/controllers/auth_controller.dart';

class LandingUserPage extends StatefulWidget {
  const LandingUserPage({Key? key}) : super(key: key);

  @override
  State<LandingUserPage> createState() => _LandingUserPageState();
}

class _LandingUserPageState extends State<LandingUserPage> {
  @override
  Widget build(BuildContext context) {
    var authController = Modular.get<AuthController>();
    return Scaffold(
        // drawerScrimColor: Colors.transparent,
        endDrawerEnableOpenDragGesture: true,
        drawerEnableOpenDragGesture: true,
        drawer: Screen.width(context) < tabletSize
            ? DrawerDashboardWidget(
                isProfessor: authController.role == 'PROFESSOR')
            : null,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(Screen.height(context) * 0.1),
            child: AppBar(
                leading: Builder(builder: (context) {
                  return Screen.width(context) < tabletSize
                      ? IconButton(
                          splashRadius: 1,
                          onPressed: () => Scaffold.of(context).openDrawer(),
                          icon: const Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Icon(
                              Icons.menu,
                              size: 44,
                            ),
                          ),
                          color: AppColors.white,
                        )
                      : const SizedBox();
                }),
                foregroundColor: AppColors.brandingBlue)),
        body: MediaQuery.of(context).size.width < tabletSize
            ? Center(
                child: SizedBox(
                    width: Screen.width(context) < 1024
                        ? Screen.width(context)
                        : 1024,
                    child: RouterOutlet()),
              )
            : SafeArea(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 120.0),
                      child: Center(
                        child: RouterOutlet(),
                      ),
                    ),
                    VerticalNavBarWidget(
                      accessLevel: authController.role,
                    ),
                  ],
                ),
              ));
  }
}
