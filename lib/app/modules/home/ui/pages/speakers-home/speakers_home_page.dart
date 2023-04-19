import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/home/presenter/controllers/speakers_home_controller.dart';
import 'package:smile_front/app/modules/home/ui/pages/speakers-home/widgets/speaker_panel_mobile_widget.dart';
import 'package:smile_front/app/modules/home/ui/pages/speakers-home/widgets/speaker_panel_web_wigdet.dart';
import 'package:smile_front/generated/l10n.dart';
import '../../../../../shared/entities/screen_variables.dart';
import '../../../../../shared/utils/screen_helper.dart';
import '../../../domain/infra/speakers_enum.dart';

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
          const SizedBox(
            height: 100,
          ),
          SpeakerPanelWebWidget(
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
            return SpeakerPanelWebWidget(
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
        child: Column(
          children: [
            Observer(builder: (_) {
              return SpeakerPanelMobileWidget(
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
                            opacity: controller.indexToShowPanel1 == e.index
                                ? 0.5
                                : 1.0,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / 6,
                              height: MediaQuery.of(context).size.width / 6,
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
            Observer(builder: (_) {
              return SpeakerPanelMobileWidget(
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
                            controller.toggleIndexPanel1(e.index);
                          },
                          child: Opacity(
                            opacity: controller.indexToShowPanel1 == e.index
                                ? 0.5
                                : 1.0,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / 6,
                              height: MediaQuery.of(context).size.width / 6,
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
        ),
      );
    }
  }
}
