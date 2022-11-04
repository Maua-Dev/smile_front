import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/home/presenter/controllers/speakers_home_controller.dart';
import 'package:smile_front/app/modules/home/ui/pages/speakers-home/widgets/speakers_card_widget.dart';
import 'package:smile_front/app/shared/entities/screen_variables.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import '../../../../../shared/themes/app_text_styles.dart';
import '../../../../../shared/widgets/text-header/text_header.dart';
import '../../../../../shared/utils/screen_helper.dart';

class SpeakersHomePage extends StatefulWidget {
  const SpeakersHomePage({Key? key}) : super(key: key);

  @override
  State<SpeakersHomePage> createState() => _SpeakersHomePageState();
}

class _SpeakersHomePageState
    extends ModularState<SpeakersHomePage, SpeakersHomeController> {
  @override
  Widget build(BuildContext context) {
    var scrollController = ScrollController();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: TextHeader(
            title: 'Principais Palestrantes - 2022',
            leftPadding: Screen.width(context) > 530 ? 32 : 24,
            color: AppColors.brandingOrange,
            fontSize: Screen.width(context) < cellphoneSize
                ? Screen.width(context) < 530
                    ? 24
                    : 45
                : null,
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
              width: Screen.width(context) * 0.9,
              decoration: BoxDecoration(
                  color: AppColors.brandingBlue,
                  borderRadius: BorderRadius.circular(40)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (Screen.width(context) < tabletSize)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Center(
                        child: Text(
                          'DESLIZE PARA VER MAIS >>>',
                          style: AppTextStyles.titleH1.copyWith(
                              fontSize: 18, color: AppColors.brandingOrange),
                        ),
                      ),
                    ),
                  if (Screen.width(context) < tabletSize)
                    SizedBox(
                      height: Screen.width(context) < 500 ? 110 : 160,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.listSpeakers.length,
                        controller: scrollController,
                        itemBuilder: (context, index) {
                          return SpeakersCardWidget(
                            linkPhoto:
                                controller.listSpeakers[index].linkPhoto!,
                            name: controller.listSpeakers[index].name,
                            myIndex: index,
                            indexToShow: controller.indexToShow,
                            onTap: () {
                              controller.toggleIndex(index);
                              setState(() {});
                            },
                          );
                        },
                      ),
                    )
                  else
                    SizedBox(
                      height: Screen.width(context) < tabletSize
                          ? 190
                          : Screen.width(context) < 1750
                              ? 210
                              : 250,
                      child: Center(
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.listSpeakers.length,
                          controller: scrollController,
                          itemBuilder: (context, index) {
                            return SpeakersCardWidget(
                              linkPhoto:
                                  controller.listSpeakers[index].linkPhoto!,
                              name: controller.listSpeakers[index].name,
                              myIndex: index,
                              indexToShow: controller.indexToShow,
                              onTap: () {
                                controller.toggleIndex(index);
                                setState(() {});
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        controller.listSpeakers[controller.indexToShow].name,
                        style: AppTextStyles.button.copyWith(
                            fontSize: Screen.width(context) < 1000 ? 22 : 32,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      controller.listSpeakers[controller.indexToShow].bio,
                      textAlign: TextAlign.justify,
                      style: AppTextStyles.button.copyWith(
                          fontSize: Screen.width(context) < 1000
                              ? 14
                              : Screen.width(context) < 1500
                                  ? 16
                                  : 18,
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
