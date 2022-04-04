import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/home/presenter/controllers/speakers_home_controller.dart';
import 'package:smile_front/app/modules/home/ui/pages/speakers-home/widgets/speakers_card_widget.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
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
    return Observer(builder: (context) {
      if (controller.isLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      return Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          TextHeader(
            title: 'Principais Palestrantes',
            leftPadding: 32,
            color: AppColors.brandingOrange,
          ),
          const SizedBox(
            height: 32,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal:
                    MediaQuery.of(context).size.width < 1700 ? 64 : 128),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: controller.listSpeakers.length,
              itemBuilder: (context, index) {
                return SpeakersCardWidget(
                  socialName: controller.listSpeakers[index].name,
                  bio: controller.listSpeakers[index].bio,
                  linkPhoto: controller.listSpeakers[index].linkPhoto!,
                  isEven: index % 2 == 0 ? false : true,
                );
              },
            ),
          )
        ],
      );
    });
  }
}
