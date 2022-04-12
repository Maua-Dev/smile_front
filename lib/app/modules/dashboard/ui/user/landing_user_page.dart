import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';

import '../../../../shared/widgets/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'widgets/vertical-nav-bar/vertical_nav_bar_widget.dart';

class LandingUserPage extends StatefulWidget {
  const LandingUserPage({Key? key}) : super(key: key);

  @override
  State<LandingUserPage> createState() => _LandingUserPageState();
}

class _LandingUserPageState extends State<LandingUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: MediaQuery.of(context).size.width < 1024
            ? const BottomNavigationBarWidget()
            : null,
        appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.height * 0.05),
            child: AppBar(foregroundColor: AppColors.brandingPurple)),
        body: MediaQuery.of(context).size.width < 1024
            ? SafeArea(
                child: Center(
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width < 1024
                          ? MediaQuery.of(context).size.width
                          : 1024,
                      child: RouterOutlet()),
                ),
              )
            : SafeArea(
                child: Row(
                  children: [
                    const VerticalNavBarWidget(),
                    Flexible(
                      child: Center(
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width < 1024
                                ? MediaQuery.of(context).size.width
                                : 1000,
                            child: RouterOutlet()),
                      ),
                    ),
                  ],
                ),
              ));
  }
}
