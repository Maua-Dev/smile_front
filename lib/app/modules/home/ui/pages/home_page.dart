import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/home/ui/pages/home1/home1_page.dart';
import 'package:smile_front/app/modules/home/ui/pages/home2/home2_page.dart';
import 'package:smile_front/app/modules/home/ui/pages/home3/home3_page.dart';
import 'package:smile_front/app/modules/home/ui/pages/home4/home4_page.dart';
import 'package:smile_front/app/modules/home/ui/pages/widgets/action_textbutton_widget.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';

import '../../../../app_module.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

double appBarFontSize(size) {
  if (size >= 1280) {
    return 25;
  }
  if (size < 1280 && size >= 960) {
    return 20;
  }
  return 18;
}

class _HomePageState extends State<HomePage> {
  final controller = PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    return Padding(
      padding: size > 1920
          ? EdgeInsets.symmetric(horizontal: size - 1920)
          : EdgeInsets.zero,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: AppColors.brandingPurple,
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
                paddingHorizontal: 16,
                paddingVertical: 8,
                onPressed: () {
                  controller.animateToPage(0,
                      duration: const Duration(milliseconds: 1500),
                      curve: Curves.easeInOut);
                },
                fontSize: appBarFontSize(size),
              ),
              ActionTextButtonWidget(
                  title: 'SOBRE',
                  paddingHorizontal: 16,
                  paddingVertical: 8,
                  onPressed: () {
                    controller.animateToPage(1,
                        duration: const Duration(milliseconds: 1500),
                        curve: Curves.easeInOut);
                  },
                  fontSize: appBarFontSize(size)),
              ActionTextButtonWidget(
                  title: 'ATIVIDADES',
                  paddingHorizontal: 16,
                  paddingVertical: 8,
                  onPressed: () {
                    controller.animateToPage(2,
                        duration: const Duration(milliseconds: 1500),
                        curve: Curves.easeInOut);
                  },
                  fontSize: appBarFontSize(size)),
              ActionTextButtonWidget(
                  title: 'CALENDÁRIO',
                  paddingHorizontal: 16,
                  paddingVertical: 8,
                  onPressed: () {
                    controller.animateToPage(3,
                        duration: const Duration(milliseconds: 1500),
                        curve: Curves.easeInOut);
                  },
                  fontSize: appBarFontSize(size)),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: ActionTextButtonWidget(
                    title: 'LOGIN',
                    paddingHorizontal: 16,
                    paddingVertical: 8,
                    widthSize: 160,
                    backgroundColor: AppColors.brandingOrange,
                    onPressed: () async {
                      await Modular.isModuleReady<AppModule>();
                      Modular.to.navigate('/login');
                    },
                    fontSize: appBarFontSize(size)),
              )
            ]),
        body: PageView(
          controller: controller,
          pageSnapping: false,
          scrollDirection: Axis.vertical,
          children: const [Home1Page(), Home2Page(), Home3Page(), Home4Page()],
        ),
      ),
    );
  }
}
