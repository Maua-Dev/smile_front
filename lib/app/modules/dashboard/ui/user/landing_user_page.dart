import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/dashboard/ui/user/widgets/app_widgets/sidebar/app_sidebar_widget.dart';
import 'package:smile_front/app/shared/entities/screen_variables.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import '../../../../shared/utils/screen_helper.dart';
import '../../../../shared/widgets/bottom_navigation_bar/bottom_navigation_bar.dart';

class LandingUserPage extends StatefulWidget {
  const LandingUserPage({Key? key}) : super(key: key);

  @override
  State<LandingUserPage> createState() => _LandingUserPageState();
}

class _LandingUserPageState extends State<LandingUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawerScrimColor: Colors.transparent,
        bottomNavigationBar: Screen.width(context) < tabletSize
            ? const BottomNavigationBarWidget()
            : null,
        drawer: Screen.width(context) < tabletSize ? NavBarWidget() : null,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(Screen.height(context) * 0.1),
            child: AppBar(
                leading: Builder(builder: (context) {
                  return Padding(
                    padding: Screen.width(context) < cellphoneSize
                        ? const EdgeInsets.only(top: 16.0)
                        : const EdgeInsets.only(top: 8.0),
                    child: Screen.width(context) < tabletSize
                        ? IconButton(
                            splashRadius: 1,
                            onPressed: () => Scaffold.of(context).openDrawer(),
                            icon: Icon(
                              Icons.menu,
                              size: Screen.width(context) < cellphoneSize
                                  ? 40
                                  : 56,
                            ),
                            color: AppColors.white,
                          )
                        : null,
                  );
                }),
                foregroundColor: AppColors.brandingBlue)),
        body: MediaQuery.of(context).size.width < tabletSize
            ? SafeArea(
                child: Center(
                  child: SizedBox(
                      width: Screen.width(context) < 1024
                          ? Screen.width(context)
                          : 1024,
                      child: RouterOutlet()),
                ),
              )
            : SafeArea(
                child: Row(
                  children: [
                    // const VerticalNavBarWidget(),
                    Flexible(
                      child: Center(
                        child: SizedBox(
                            width: Screen.width(context) < 1024
                                ? Screen.width(context)
                                : 1000,
                            child: RouterOutlet()),
                      ),
                    ),
                  ],
                ),
              ));
  }
}
