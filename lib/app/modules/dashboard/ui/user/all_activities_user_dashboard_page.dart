import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/all_activities_user_dashboard_controller.dart';

import '../../../../shared/themes/app_colors.dart';
import '../../../../shared/widgets/dashboard-appbar/dashboard_appbar_widget.dart';
import '../../../../shared/widgets/text_header_scratched.dart';
import '../../../../shared/widgets/vertical_nav_bar/vertical_nav_bar.dart';
import '../../domain/infra/activity_enum.dart';
import '../widgets/activities_carousel_widget.dart';
import '../widgets/filter_chip_widget.dart';
import '../widgets/logout_button_widget.dart';

class AllActivitiesUserDashboardPage extends StatefulWidget {
  const AllActivitiesUserDashboardPage({Key? key}) : super(key: key);

  @override
  State<AllActivitiesUserDashboardPage> createState() =>
      _AllActivitiesUserDashboardPageState();
}

class _AllActivitiesUserDashboardPageState extends ModularState<
    AllActivitiesUserDashboardPage, AllActivitiesUserDashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          VerticalNavBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const DashboardAppbarWidget(),
                  const SizedBox(
                    height: 32,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 72.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const TextHeaderScratched(
                          title: 'Próximas Atividades',
                          fontSize: 50,
                        ),
                        LogoutButtonWidget(
                          backgroundColor: AppColors.brandingOrange,
                          buttonTittle: 'Sair',
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  Observer(builder: (_) {
                    return ActivitiesCarouselWidget(
                      cardColor: AppColors.brandingOrange,
                      list: controller.nextActivitiesList,
                      isNextActivity: true,
                    );
                  }),
                  const TextHeaderScratched(
                    title: 'Todas Atividades',
                    fontSize: 38,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 72.0, top: 20),
                    child: SizedBox(
                        height: 50,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: ActivityEnum.values.length - 3,
                            itemBuilder: (BuildContext ctx, index) {
                              return Observer(builder: (_) {
                                return FilterChipWidget(
                                    onTap: () => controller
                                        .toggleFilterActivityChipIndex(index),
                                    selected: controller
                                            .filterActivityChipIndexSelected ==
                                        index,
                                    activityType: ActivityEnum.values[index]);
                              });
                            })),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 72.0, bottom: 20),
                    child: SizedBox(
                        height: 50,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (BuildContext ctx, index) {
                              return Observer(builder: (_) {
                                return FilterChipWidget(
                                    onTap: () => controller
                                        .toggleFilterActivityChipIndex(
                                            index + 8),
                                    selected: controller
                                            .filterActivityChipIndexSelected ==
                                        index + 8,
                                    activityType:
                                        ActivityEnum.values[index + 8]);
                              });
                            })),
                  ),
                  Observer(builder: (_) {
                    return Column(
                      children: [
                        ActivitiesCarouselWidget(
                          list: controller.mondayActivitiesList,
                          weekday: 0,
                        ),
                        ActivitiesCarouselWidget(
                          list: controller.tuesdayActivitiesList,
                          weekday: 1,
                        ),
                        ActivitiesCarouselWidget(
                          list: controller.wednesdayActivitiesList,
                          weekday: 2,
                        ),
                        ActivitiesCarouselWidget(
                          list: controller.thursdayActivitiesList,
                          weekday: 3,
                        ),
                        ActivitiesCarouselWidget(
                          list: controller.fridayActivitiesList,
                          weekday: 4,
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
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
