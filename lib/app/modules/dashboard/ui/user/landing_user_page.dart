import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/dashboard/ui/widgets/vertical-nav-bar/vertical_nav_bar_widget.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';

import '../../../../shared/widgets/bottom_navigation_bar/bottom_navigation_bar.dart';

class LandingUserPage extends StatefulWidget {
  const LandingUserPage({Key? key}) : super(key: key);

  @override
  State<LandingUserPage> createState() => _LandingUserPageState();
}

class _LandingUserPageState extends State<LandingUserPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: MediaQuery.of(context).size.width < 1000
              ? const BottomNavigationBarWidget()
              : null,
          appBar: PreferredSize(
              preferredSize:
                  Size.fromHeight(MediaQuery.of(context).size.height * 0.05),
              child: AppBar(foregroundColor: AppColors.brandingPurple)),
          body: MediaQuery.of(context).size.width < 1000
              ? Center(
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width < 1000
                          ? MediaQuery.of(context).size.width
                          : 1000,
                      child: RouterOutlet()),
                )
              : Row(
                  children: [
                    const VerticalNavBarWidget(),
                    Flexible(
                      child: Center(
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width < 1000
                                ? MediaQuery.of(context).size.width
                                : 1000,
                            child: RouterOutlet()),
                      ),
                    ),
                  ],
                )),
    );
  }
}
