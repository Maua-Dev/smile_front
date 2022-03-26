import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/home/presenter/controllers/activity_home_controller.dart';

import '../../../../../shared/widgets/text-header/text_header_scratched.dart';
import 'widgets/main_speakers_card.dart';

class ActivityHomePage extends StatefulWidget {
  const ActivityHomePage({Key? key}) : super(key: key);

  @override
  ActivityHomeState createState() => ActivityHomeState();
}

class ActivityHomeState
    extends ModularState<ActivityHomePage, ActivityHomeController> {
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
