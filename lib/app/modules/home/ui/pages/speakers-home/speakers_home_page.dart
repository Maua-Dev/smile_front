import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/home/presenter/controllers/speakers_home_controller.dart';
import 'package:smile_front/app/modules/home/ui/pages/speakers-home/widgets/speakers_card_widget.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import '../../../../../shared/themes/app_text_styles.dart';
import '../../../../../shared/widgets/text-header/text_header.dart';

class SpeakersHomePage extends StatefulWidget {
  const SpeakersHomePage({Key? key}) : super(key: key);

  @override
  _SpeakersHomePageState createState() => _SpeakersHomePageState();
}

class _SpeakersHomePageState
    extends ModularState<SpeakersHomePage, SpeakersHomeController> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: TextHeader(
            title: 'Principais Palestrantes',
            leftPadding: 32,
            color: AppColors.brandingOrange,
            fontSize: MediaQuery.of(context).size.width < 530 ? 28 : null,
          ),
        ),
        Observer(builder: (_) {
          if (controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 32),
              height: height * 0.75,
              width: width * 0.9,
              decoration: BoxDecoration(
                  color: AppColors.brandingPurple,
                  borderRadius: BorderRadius.circular(40)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SpeakersCardWidget(
                          linkPhoto: controller.listSpeakers[0].linkPhoto!,
                          name: controller.listSpeakers[0].name,
                          myIndex: 0,
                          indexToShow: controller.indexToShow,
                          onTap: () {
                            controller.toggleIndex(0);
                            setState(() {});
                          },
                        ),
                        SpeakersCardWidget(
                          linkPhoto: controller.listSpeakers[1].linkPhoto!,
                          name: controller.listSpeakers[1].name,
                          myIndex: 1,
                          indexToShow: controller.indexToShow,
                          onTap: () {
                            controller.toggleIndex(1);
                            setState(() {});
                          },
                        ),
                        SpeakersCardWidget(
                          linkPhoto: controller.listSpeakers[2].linkPhoto!,
                          name: controller.listSpeakers[2].name,
                          myIndex: 2,
                          indexToShow: controller.indexToShow,
                          onTap: () {
                            controller.toggleIndex(2);
                            setState(() {});
                          },
                        ),
                        SpeakersCardWidget(
                          linkPhoto: controller.listSpeakers[3].linkPhoto!,
                          name: controller.listSpeakers[3].name,
                          myIndex: 3,
                          indexToShow: controller.indexToShow,
                          onTap: () {
                            controller.toggleIndex(3);
                            setState(() {});
                          },
                        ),
                        SpeakersCardWidget(
                          linkPhoto: controller.listSpeakers[4].linkPhoto!,
                          name: controller.listSpeakers[4].name,
                          myIndex: 4,
                          indexToShow: controller.indexToShow,
                          onTap: () {
                            controller.toggleIndex(4);
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                  Flexible(
                    child: Text(
                      controller.listSpeakers[controller.indexToShow].bio,
                      style: AppTextStyles.button.copyWith(
                          fontSize: MediaQuery.of(context).size.width < 1300
                              ? 20
                              : 24,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            );
          }
        })
      ],
    );
  }
}
