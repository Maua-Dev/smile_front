import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/home/presenter/controllers/about_home_controller.dart';
import 'package:smile_front/app/shared/widgets/text-header/text_header.dart';

import '../../../../../shared/widgets/text-header/text_header_scratched.dart';
import 'widgets/main_speakers_card.dart';

class AboutHomePage extends StatefulWidget {
  const AboutHomePage({Key? key}) : super(key: key);

  @override
  AboutHomeState createState() => AboutHomeState();
}

class AboutHomeState extends ModularState<AboutHomePage, AboutHomeController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 48,
        ),
        const TextHeaderScratched(title: 'PRINCIPAIS PALESTRANTES'),
        const SizedBox(
          height: 32,
        ),
        Observer(builder: (context) {
          if (controller.speakers.isEmpty) {
            return const SizedBox.shrink();
          }
          return MainSpeakersCard(
            speakers: controller.speakers,
            indexToShow: controller.indexToShow,
            toggleIndex: controller.toggleIndex,
          );
        }),
      ],
    );
  }
}
