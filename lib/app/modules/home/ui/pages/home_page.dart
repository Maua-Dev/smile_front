import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/home/ui/pages/about-home/about_home_page.dart';
import 'package:smile_front/app/modules/home/ui/pages/activity-home/activity_home_page.dart';
import 'package:smile_front/app/modules/home/ui/pages/main-home/main_home_page.dart';
import 'package:smile_front/app/modules/home/ui/pages/previous_editions-home/previous_editions_home_page.dart';
import 'package:smile_front/app/modules/home/ui/pages/widgets/action_textbutton_widget.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import '../../../../app_module.dart';
import '../../../../shared/utils/assets_url.dart';

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
    return Scaffold(
      appBar: AppBar(
          elevation: 40,
          backgroundColor: AppColors.brandingPurple,
          centerTitle: false,
          leadingWidth: 0,
          title: Padding(
            padding: const EdgeInsets.only(left: 64.0),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.contain,
                      alignment: Alignment.centerLeft,
                      image: NetworkImage(
                        smileLogoUrl,
                      ))),
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
                title: 'EDIÇÕES',
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
        children: const [
          MainHomePage(),
          AboutHomePage(),
          ActivityHomePage(),
          PreviousEditionsHomePage(),
        ],
      ),
    );
  }
}
