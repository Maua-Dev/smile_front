import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/shared/widgets/vertical_nav_bar/vertical_nav_bar.dart';

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
        body: Row(
          children: [
            VerticalNavBar(),
            Flexible(child: RouterOutlet()),
          ],
        ),
      ),
    );
  }
}
