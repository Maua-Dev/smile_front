import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
          bottomNavigationBar: const BottomNavigationBarWidget(),
          body: Center(
            child: SizedBox(
                width: MediaQuery.of(context).size.width < 1000
                    ? MediaQuery.of(context).size.width
                    : 1000,
                child: RouterOutlet()),
          )),
    );
  }
}
