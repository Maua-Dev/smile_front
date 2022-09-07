import 'package:flutter/material.dart';
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
  State<SpeakersHomePage> createState() => _SpeakersHomePageState();
}

class _SpeakersHomePageState
    extends ModularState<SpeakersHomePage, SpeakersHomeController> {
  @override
  Widget build(BuildContext context) {
    var scrollController = ScrollController();

    final double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: TextHeader(
            title: 'Principais Palestrantes - 2022',
            leftPadding: 32,
            color: AppColors.brandingOrange,
            fontSize: width < 530 ? 24 : null,
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
              width: width * 0.9,
              decoration: BoxDecoration(
                  color: AppColors.brandingPurple,
                  borderRadius: BorderRadius.circular(40)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (width < 1000)
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
                  if (width < 1000)
                    SizedBox(
                      height: width < 500 ? 110 : 160,
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
                      height: width < 1380
                          ? 190
                          : width < 1750
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
                            fontSize: width < 1000 ? 22 : 32,
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
                          fontSize: width < 1000
                              ? 14
                              : width < 1500
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
