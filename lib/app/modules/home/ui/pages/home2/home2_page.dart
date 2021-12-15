import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/home/presenter/controllers/home2_controller.dart';
import 'package:smile_front/app/modules/home/ui/pages/home2/widgets/main_speakers_card.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

class Home2Page extends StatefulWidget {
  const Home2Page({Key? key}) : super(key: key);

  @override
  HomePage2State createState() => HomePage2State();
}

class HomePage2State extends ModularState<Home2Page, Home2Controller> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 64),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Text(
                    'PRINCIPAIS PALESTRANTES',
                    style: AppTextStyles.body
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    height: 5,
                    color: AppColors.brandingBlue,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Observer(builder: (context) {
            return MainSpeakersCard(
              speakers: controller.speakers,
              indexToShow: controller.indexToShow,
              toggleIndex: controller.toggleIndex,
            );
          }),
        ],
      ),
    );
  }
}
