import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/ui/adm/widgets/activities_carousel/activities_carousel_widget.dart';
import 'package:smile_front/app/modules/dashboard/ui/shared/widgets/logout_button_widget.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import '../../../../shared/widgets/text-header/text_header.dart';
import '../../presenter/controllers/adm/adm_dashboard_controller.dart';
import 'widgets/filter/filter_chip_widget.dart';

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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 72.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TextHeader(
                    title: 'Próximas Atividades',
                    fontSize: 50,
                  ),
                  Row(
                    children: [
                      LogoutButtonWidget(
                        backgroundColor: AppColors.brandingOrange,
                        buttonTittle: 'Home',
                        onPressed: () {
                          Modular.to.navigate('/home');
                        },
                      ),
                      const SizedBox(
                        width: 32,
                      ),
                      LogoutButtonWidget(
                        backgroundColor: AppColors.brandingOrange,
                        buttonTittle: 'Sair',
                        onPressed: () {
                          controller.logout();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Observer(builder: (_) {
              if (controller.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ActivitiesCarouselWidget(
                  cardColor: AppColors.brandingOrange,
                  list: controller.nextActivitiesList,
                  listToEdit: controller.activitiesList,
                  isNextActivity: true,
                );
              }
            }),
            const TextHeader(
              title: 'Todas Atividades',
              fontSize: 38,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 72.0, top: 20, right: 72),
              child: SizedBox(
                  height: 50,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: MediaQuery.of(context).size.width < 1650
                          ? ActivityEnum.values.length - 6
                          : ActivityEnum.values.length - 4,
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
            Padding(
              padding: const EdgeInsets.only(left: 72.0, bottom: 20, right: 72),
              child: SizedBox(
                  height: 50,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          MediaQuery.of(context).size.width < 1650 ? 6 : 4,
                      itemBuilder: (BuildContext ctx, index) {
                        return Observer(builder: (_) {
                          return FilterChipWidget(
                              onTap: () =>
                                  controller.toggleFilterActivityChipIndex(
                                      MediaQuery.of(context).size.width < 1650
                                          ? index + 6
                                          : index + 8),
                              selected: MediaQuery.of(context).size.width < 1650
                                  ? controller
                                          .filterActivityChipIndexSelected ==
                                      index + 6
                                  : controller
                                          .filterActivityChipIndexSelected ==
                                      index + 8,
                              activityType: ActivityEnum.values[
                                  MediaQuery.of(context).size.width < 1650
                                      ? index + 6
                                      : index + 8]);
                        });
                      })),
            ),
            Observer(builder: (_) {
              if (controller.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Column(
                  children: [
                    ActivitiesCarouselWidget(
                      list: controller.mondayActivitiesList,
                      listToEdit: controller.activitiesList,
                      weekday: 0,
                    ),
                    ActivitiesCarouselWidget(
                      list: controller.tuesdayActivitiesList,
                      listToEdit: controller.activitiesList,
                      weekday: 1,
                    ),
                    ActivitiesCarouselWidget(
                      list: controller.wednesdayActivitiesList,
                      listToEdit: controller.activitiesList,
                      weekday: 2,
                    ),
                    ActivitiesCarouselWidget(
                      list: controller.thursdayActivitiesList,
                      listToEdit: controller.activitiesList,
                      weekday: 3,
                    ),
                    ActivitiesCarouselWidget(
                      list: controller.fridayActivitiesList,
                      listToEdit: controller.activitiesList,
                      weekday: 4,
                    ),
                    ActivitiesCarouselWidget(
                      list: controller.saturdayActivitiesList,
                      listToEdit: controller.activitiesList,
                      weekday: 5,
                    ),
                    ActivitiesCarouselWidget(
                      list: controller.sundayActivitiesList,
                      listToEdit: controller.activitiesList,
                      weekday: 6,
                    ),
                  ],
                );
              }
            }),
          ],
        ),
      ),
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
                        backgroundColor: AppColors.brandingOrange,
                        child: const Icon(
                          Icons.insert_chart_rounded,
                          size: 35,
                          color: Colors.white,
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
                        backgroundColor: AppColors.brandingOrange,
                        child: const Icon(
                          Icons.edit,
                          size: 35,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Modular.to.navigate('/adm/create-activity');
                        }),
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
                      backgroundColor: AppColors.brandingOrange,
                      child: Icon(
                        controller.isFloatActionButtonOpen
                            ? Icons.close
                            : Icons.keyboard_arrow_up_rounded,
                        color: Colors.white,
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
