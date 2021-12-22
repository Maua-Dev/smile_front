import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/home/presenter/controllers/home2_controller.dart';
import 'package:smile_front/app/modules/home/ui/pages/home2/widgets/main_speakers_card.dart';
import 'package:smile_front/app/shared/widgets/text_header_scratched.dart';

class Home2Page extends StatefulWidget {
  const Home2Page({Key? key}) : super(key: key);

  @override
  HomePage2State createState() => HomePage2State();
}

class HomePage2State extends ModularState<Home2Page, Home2Controller> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextHeaderScratched(title: 'PRINCIPAIS PALESTRANTES'),
        const SizedBox(
          height: 32,
        ),
        Observer(builder: (context) {
          if (controller.speakers.isEmpty) {
            return Container();
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
