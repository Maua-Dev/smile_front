import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/dashboard/ui/widgets/activities_carousel_widget.dart';

import 'package:smile_front/app/shared/themes/app_colors.dart';
import '../../../../shared/widgets/text_header_scratched.dart';
import '../../domain/infra/activity_enum.dart';
import '../../presenter/controllers/adm/adm_dashboard_controller.dart';
import '../widgets/filter_chip_widget.dart';

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
            //filtros
            Padding(
              padding: const EdgeInsets.only(left: 72),
              child: SizedBox(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    FilterChipWidget(
                      activityType: ActivityEnum.CURSOS,
                    ),
                    FilterChipWidget(
                      activityType: ActivityEnum.ACADEMIA_DE_PROFESSORES,
                    ),
                    FilterChipWidget(
                      activityType: ActivityEnum.COMPETICOES_ACADEMICAS,
                    ),
                    FilterChipWidget(
                      activityType: ActivityEnum.CURSOS,
                    ),
                    FilterChipWidget(
                      activityType: ActivityEnum.CURSOS,
                    ),
                    FilterChipWidget(
                      activityType: ActivityEnum.CURSOS,
                    ),
                  ],
                ),
              ),
            ),
            Observer(builder: (_) {
              return Column(
                children: [
                  ActivitiesCarouselWidget(
                      list: controller.mondayActivitiesList,
                      weekday: 'Segunda'),
                  ActivitiesCarouselWidget(
                      list: controller.tuesdayActivitiesList, weekday: 'Terça'),
                  ActivitiesCarouselWidget(
                      list: controller.wednesdayActivitiesList,
                      weekday: 'Quarta'),
                  ActivitiesCarouselWidget(
                      list: controller.thursdayActivitiesList,
                      weekday: 'Quinta'),
                  ActivitiesCarouselWidget(
                      list: controller.fridayActivitiesList, weekday: 'Sexta'),
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
                          color: AppColors.brandingBlue,
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
                          color: AppColors.brandingBlue,
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
                            : Icons.add,
                        color: AppColors.brandingBlue,
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
