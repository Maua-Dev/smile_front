import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/home/presenter/controllers/activity_home_controller.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

import '../../../../../shared/themes/app_colors.dart';
import '../../../../../shared/widgets/text-header/text_header.dart';

class ActivitiesHomePage extends StatefulWidget {
  const ActivitiesHomePage({Key? key}) : super(key: key);

  @override
  ActivityHomeState createState() => ActivityHomeState();
}

class ActivityHomeState
    extends ModularState<ActivitiesHomePage, ActivityHomeController> {
  @override
  Widget build(BuildContext context) {
    int extraindex = -2;
    return Column(
      children: [
        const SizedBox(
          height: 24,
        ),
        TextHeader(
            title: 'Atividades',
            leftPadding: 32,
            color: AppColors.brandingOrange),
        const SizedBox(
          height: 32,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width < 1500 ? 64 : 128),
          child: ListView.builder(
            shrinkWrap: true,
            controller: ScrollController(),
            itemCount: ActivityEnum.values.length ~/ 2,
            itemBuilder: (context, index) {
              extraindex += 2;
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width:
                          MediaQuery.of(context).size.width < 1160 ? 400 : 500,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ActivityEnum.values[extraindex].name,
                            textAlign: TextAlign.justify,
                            style: AppTextStyles.buttonBold.copyWith(
                                color: AppColors.brandingOrange,
                                fontSize:
                                    MediaQuery.of(context).size.width < 1350
                                        ? 24
                                        : 30),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            ActivityEnum.values[extraindex].description,
                            textAlign: TextAlign.justify,
                            style: AppTextStyles.body.copyWith(
                                color: Colors.black,
                                fontSize:
                                    MediaQuery.of(context).size.width < 1350
                                        ? 12
                                        : 16),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 32,
                    ),
                    SizedBox(
                      width:
                          MediaQuery.of(context).size.width < 1160 ? 400 : 500,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ActivityEnum.values[extraindex + 1].name,
                            style: AppTextStyles.buttonBold.copyWith(
                                color: AppColors.brandingOrange,
                                fontSize:
                                    MediaQuery.of(context).size.width < 1350
                                        ? 24
                                        : 30),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            ActivityEnum.values[extraindex + 1].description,
                            textAlign: TextAlign.justify,
                            style: AppTextStyles.body.copyWith(
                                color: Colors.black,
                                fontSize:
                                    MediaQuery.of(context).size.width < 1350
                                        ? 12
                                        : 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
