import 'package:flutter/material.dart';
import 'package:smile_front/app/modules/home/ui/pages/home1/home1_page.dart';
import 'package:smile_front/app/modules/home/ui/pages/home2/home2_page.dart';
import 'package:smile_front/app/modules/home/ui/pages/home3/home3_page.dart';
import 'package:smile_front/app/modules/home/ui/pages/home4/home4_page.dart';
import 'package:smile_front/app/modules/home/ui/pages/widgets/action_textbutton_widget.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.brandingBlue,
          title: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Image.asset(
              'assets/images/logo_smile.png',
              fit: BoxFit.cover,
              height: 40,
            ),
          ),
          actions: [
            ActionTextButtonWidget(
              title: 'HOME',
              onPressed: () {
                controller.animateToPage(0,
                    duration: const Duration(milliseconds: 1500),
                    curve: Curves.easeInOut);
              },
            ),
            ActionTextButtonWidget(
              title: 'SOBRE',
              onPressed: () {
                controller.animateToPage(1,
                    duration: const Duration(milliseconds: 1500),
                    curve: Curves.easeInOut);
              },
            ),
            ActionTextButtonWidget(
              title: 'ATIVIDADES',
              onPressed: () {
                controller.animateToPage(2,
                    duration: const Duration(milliseconds: 1500),
                    curve: Curves.easeInOut);
              },
            ),
            ActionTextButtonWidget(
              title: 'CALENDÁRIO',
              onPressed: () {
                controller.animateToPage(3,
                    duration: const Duration(milliseconds: 1500),
                    curve: Curves.easeInOut);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: ActionTextButtonWidget(
                title: 'LOGIN',
                widthSize: 160,
                backgroundColor: AppColors.brandingOrange,
              ),
            )
          ]),
      body: PageView(
        controller: controller,
        pageSnapping: false,
        scrollDirection: Axis.vertical,
        children: const [Home1Page(), Home2Page(), Home3Page(), Home4Page()],
      ),
    );
  }
}
