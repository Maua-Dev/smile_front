import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/dashboard/ui/adm/widgets/app_bar/adm_app_bar_widget.dart';
import 'package:smile_front/app/modules/dashboard/ui/adm/widgets/activities_card/activities_column_widget.dart';
import 'package:smile_front/app/modules/dashboard/ui/adm/widgets/filter/filter_card_widget.dart';
import 'package:smile_front/app/modules/dashboard/ui/adm/widgets/side_bar/side_bar_widget.dart';
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
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(73),
          child: AdmAppBarWidget(appBarText: 'Página do Administrador')),
      body: Row(
        children: [
          const SideBarWidget(),
          SingleChildScrollView(
            child: Column(
              children: [
                /* Padding(
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
                            buttonTittle: S.of(context).initTitle.toUpperCase(),
                            onPressed: () {
                              Modular.to.navigate('/home');
                            },
                          ),
                          const SizedBox(
                            width: 32,
                          ),
                        ],
                      ),
                    ],
                  ),
                ), */
                /* Observer(builder: (_) {
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
                }), */
                /* const TextHeader(
                  title: 'Todas Atividades',
                  fontSize: 38,
                ), */
                const Padding(
                    padding: EdgeInsets.only(top: 150),
                    child: FilterCardWidget()),
                Observer(builder: (_) {
                  if (controller.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ActivitiesColumnWidget(
                      listAllActivities: controller.activitiesList,
                    );
                  }
                }),
                /* Observer(builder: (_) {
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
                }), */
              ],
            ),
          ),
        ],
      ),
      /* floatingActionButton: Observer(builder: (_) {
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
                    child: Observer(builder: (_) {
                      return FloatingActionButton(
                          backgroundColor: AppColors.brandingOrange,
                          child: controller.isLoadingCsv
                              ? const CircularProgressIndicator()
                              : const Icon(
                                  Icons.insert_chart_rounded,
                                  size: 35,
                                  color: Colors.white,
                                ),
                          onPressed: () {
                            controller.downloadCsv();
                          });
                    }),
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
      }), */
    );
  }
}
