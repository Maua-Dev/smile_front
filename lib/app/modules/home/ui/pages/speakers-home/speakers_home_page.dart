import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/home/presenter/controllers/speakers_home_controller.dart';
import 'package:smile_front/app/modules/home/ui/pages/speakers-home/widgets/speaker_panel_wigdet.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/generated/l10n.dart';
import '../../../../../shared/entities/screen_variables.dart';
import '../../../../../shared/themes/app_text_styles.dart';
import '../../../../../shared/utils/screen_helper.dart';
import '../../../domain/infra/speakers_enum.dart';
import '../widgets/header/h1_header_text_widget.dart';

class SpeakersHomePage extends StatefulWidget {
  const SpeakersHomePage({Key? key}) : super(key: key);

  @override
  State<SpeakersHomePage> createState() => _SpeakersHomePageState();
}

class _SpeakersHomePageState
    extends ModularState<SpeakersHomePage, SpeakersHomeController> {
  @override
  Widget build(BuildContext context) {
    if (Screen.width(context) > cellphoneSize) {
      return Column(
        children: [
          SizedBox(
            height: 100,
          ),
          SpeakerPanelWidget(
            title: S.of(context).speakersPanelTitle1,
            description: S.of(context).speakersPanelDescription1,
            indexToShow: controller.indexToShowPanel1,
            children: SpeakersEnum.values
                .take(4)
                .map(
                  (e) => MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        controller.toggleIndexPanel1(e.index);
                      },
                      child: Opacity(
                        opacity:
                            controller.indexToShowPanel1 == e.index ? 0.5 : 1.0,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 11,
                          height: MediaQuery.of(context).size.width / 11,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: NetworkImage(e.linkPhoto),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Observer(builder: (_) {
            return SpeakerPanelWidget(
              title: S.of(context).speakersPanelTitle2,
              description: S.of(context).speakersPanelDescription2,
              indexToShow: controller.indexToShowPanel2,
              children: SpeakersEnum.values
                  .skip(4)
                  .take(4)
                  .map(
                    (e) => MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          controller.toggleIndexPanel2(e.index);
                        },
                        child: Opacity(
                          opacity: controller.indexToShowPanel2 == e.index
                              ? 0.5
                              : 1.0,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 11,
                            height: MediaQuery.of(context).size.width / 11,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage: NetworkImage(e.linkPhoto),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            );
          }),
        ],
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Observer(builder: (_) {
          return Column(
            children: [
              H1HeaderTextWidget(
                title: S.of(context).speakersMainTitle,
              ),
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                    border:
                        Border.all(color: AppColors.brandingOrange, width: 7),
                    borderRadius: BorderRadius.circular(100000)),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: AppColors.gray.withOpacity(0.3), width: 7),
                      borderRadius: BorderRadius.circular(100000)),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(SpeakersEnum
                        .values[controller.indexToShowPanel1].linkPhoto),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(SpeakersEnum.values[controller.indexToShowPanel1].name,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.titleH1.copyWith(fontSize: 32)),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      SpeakersEnum
                          .values[controller.indexToShowPanel1].description,
                      style: AppTextStyles.body.copyWith(fontSize: 14),
                      textAlign: TextAlign.justify,
                    )
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    shrinkWrap: true,
                    mainAxisSpacing: 8,
                    children: SpeakersEnum.values
                        .map(
                          (e) => MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {
                                controller.toggleIndexPanel1(e.index);
                              },
                              child: Opacity(
                                opacity: controller.indexToShowPanel1 == e.index
                                    ? 0.5
                                    : 1.0,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  backgroundImage: NetworkImage(e.linkPhoto),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList()),
              )
            ],
          );
        }),
      );
    }
  }
}
