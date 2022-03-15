import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/ui/widgets/activities_carousel_widget.dart';
import 'package:smile_front/app/modules/dashboard/ui/widgets/filter_chip_widget.dart';

import 'package:smile_front/app/shared/themes/app_colors.dart';
import '../../../../shared/widgets/text_header_scratched.dart';
import '../../presenter/controllers/adm/adm_dashboard_controller.dart';

class AdmDashboardPage extends StatefulWidget {
  const AdmDashboardPage({Key? key}) : super(key: key);

  @override
  State<AdmDashboardPage> createState() => _AdmDashboardPageState();
}

class _AdmDashboardPageState
    extends ModularState<AdmDashboardPage, AdmDashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            const TextHeaderScratched(
              title: 'Próximas Atividades',
            ),
            Observer(builder: (_) {
              return ActivitiesCarouselWidget(
                  textColor: Colors.white,
                  cardColor: AppColors.brandingOrange,
                  list: controller.nextActivitiesList);
            }),
            const TextHeaderScratched(title: 'Todas Atividades'),
            Padding(
              padding: const EdgeInsets.only(left: 72.0, top: 20, bottom: 20),
              child: SizedBox(
                  height: 50,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: ActivityEnum.values.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return Observer(builder: (_) {
                          return FilterChipWidget(
                              onTap: () => controller
                                  .toggleFilterActivityChipIndex(index),
                              selected:
                                  controller.filterActivityChipIndexSelected ==
                                      index,
                              activityType: ActivityEnum.values[index]);
                        });
                      })),
            ),
            Observer(builder: (_) {
              return Column(
                children: [
                  ActivitiesCarouselWidget(
                      list: controller.mondayActivitiesList, weekday: 1),
                  ActivitiesCarouselWidget(
                      list: controller.tuesdayActivitiesList, weekday: 2),
                  ActivitiesCarouselWidget(
                      list: controller.wednesdayActivitiesList, weekday: 3),
                  ActivitiesCarouselWidget(
                      list: controller.thursdayActivitiesList, weekday: 4),
                  ActivitiesCarouselWidget(
                      list: controller.fridayActivitiesList, weekday: 5),
                ],
              );
            }),
          ],
        ),
      )),
      floatingActionButton: Observer(builder: (_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (controller.isFloatActionButtonOpen)
              Padding(
                padding: const EdgeInsets.only(right: 36.0),
                child: SizedBox(
                  width: 70,
                  child: FittedBox(
                    child: FloatingActionButton(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.insert_chart_rounded,
                          size: 35,
                          color: AppColors.brandingPurple,
                        ),
                        onPressed: () {}),
                  ),
                ),
              ),
            const SizedBox(
              height: 20,
            ),
            if (controller.isFloatActionButtonOpen)
              Padding(
                padding: const EdgeInsets.only(right: 36.0),
                child: SizedBox(
                  width: 70,
                  child: FittedBox(
                    child: FloatingActionButton(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.edit,
                          size: 35,
                          color: AppColors.brandingPurple,
                        ),
                        onPressed: () {}),
                  ),
                ),
              ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 36.0, bottom: 36.0),
              child: SizedBox(
                width: 100,
                child: FittedBox(
                  child: FloatingActionButton(
                      backgroundColor: Colors.white,
                      child: Icon(
                        controller.isFloatActionButtonOpen
                            ? Icons.close
                            : Icons.keyboard_arrow_up_rounded,
                        color: AppColors.brandingPurple,
                      ),
                      onPressed: () {
                        controller.toggleFloatActionButton();
                      }),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
