import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/home/ui/pages/speakers-home/speakers_home_page.dart';
import 'package:smile_front/app/modules/home/ui/pages/sponsors_editions-home/sponsors_home_page.dart';
import 'package:smile_front/app/modules/home/ui/pages/widgets/action_textbutton_widget.dart';
import 'package:smile_front/app/modules/home/ui/pages/widgets/video_card_widget.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';
import '../../../../app_module.dart';
import '../../../../shared/utils/s3_assets_url.dart';
import 'activities-home/activities_home_page.dart';
import 'main-home/main_home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, ScrollController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 40,
          backgroundColor: AppColors.brandingPurple,
          centerTitle: false,
          leadingWidth: 0,
          title: Padding(
            padding: const EdgeInsets.only(left: 32.0),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.contain,
                      alignment: Alignment.centerLeft,
                      image: NetworkImage(
                        smileeeLogoUrl,
                      ))),
            ),
          ),
          actions: [
            ActionTextButtonWidget(
              title: 'HOME',
              paddingHorizontal:
                  MediaQuery.of(context).size.width < 1300 ? 8 : 16,
              paddingVertical: 8,
              onPressed: () {
                controller.animateTo(controller.position.minScrollExtent,
                    duration: const Duration(milliseconds: 1500),
                    curve: Curves.easeInOut);
              },
            ),
            ActionTextButtonWidget(
              title: 'PALESTRANTES',
              paddingHorizontal:
                  MediaQuery.of(context).size.width < 1300 ? 8 : 16,
              paddingVertical: 8,
              onPressed: () {
                controller.animateTo(
                    MediaQuery.of(context).size.height -
                        55 +
                        (MediaQuery.of(context).size.height * 0.5 + 48),
                    duration: const Duration(milliseconds: 1500),
                    curve: Curves.easeInOut);
              },
            ),
            ActionTextButtonWidget(
              title: 'ATIVIDADES',
              paddingHorizontal:
                  MediaQuery.of(context).size.width < 1300 ? 8 : 16,
              paddingVertical: 8,
              onPressed: () {
                controller.animateTo(
                    MediaQuery.of(context).size.height < 1080
                        ? MediaQuery.of(context).size.height * 2 +
                            (1080 - MediaQuery.of(context).size.height) -
                            55 +
                            (MediaQuery.of(context).size.height * 0.5 + 48)
                        : MediaQuery.of(context).size.height * 2 -
                            55 +
                            (MediaQuery.of(context).size.height * 0.5 + 48),
                    duration: const Duration(milliseconds: 1500),
                    curve: Curves.easeInOut);
              },
            ),
            ActionTextButtonWidget(
              title: 'PATROCINADORES',
              paddingHorizontal:
                  MediaQuery.of(context).size.width < 1300 ? 8 : 16,
              paddingVertical: 8,
              onPressed: () {
                controller.animateTo(controller.position.maxScrollExtent,
                    duration: const Duration(milliseconds: 1500),
                    curve: Curves.easeInOut);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: ActionTextButtonWidget(
                title: 'LOGIN',
                textStyle: AppTextStyles.buttonBold.copyWith(
                    color: Colors.white,
                    fontSize:
                        MediaQuery.of(context).size.width < 1300 ? 20 : 24),
                paddingHorizontal:
                    MediaQuery.of(context).size.width < 1300 ? 8 : 16,
                paddingVertical: 8,
                widthSize: 160,
                backgroundColor: AppColors.brandingOrange,
                onPressed: () async {
                  await Modular.isModuleReady<AppModule>();
                  Modular.to.navigate('/login');
                },
              ),
            )
          ]),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width < 2200
              ? MediaQuery.of(context).size.width
              : 2200,
          child: ListView(
            controller: controller,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height - 55,
                child: const MainHomePage(),
              ),
              const Center(
                  child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: VideoCardWidget(),
              )),
              SizedBox(
                  height: MediaQuery.of(context).size.height < 1080
                      ? MediaQuery.of(context).size.height +
                          (1080 - MediaQuery.of(context).size.height)
                      : MediaQuery.of(context).size.height,
                  child: const SpeakersHomePage()),
              const ActivitiesHomePage(),
              const SponsorsHomePage(),
            ],
          ),
        ),
      ),
    );
  }
}
