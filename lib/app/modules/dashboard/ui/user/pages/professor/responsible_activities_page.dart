import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

import '../../../../../../../generated/l10n.dart';
import '../../../../../../shared/themes/app_colors.dart';
import '../../../../../../shared/themes/app_text_styles.dart';
import '../../../../../../shared/themes/breakpoint.dart';
import '../../../../../../shared/utils/utils.dart';
import '../../../../../../shared/widgets/bottom_navigation_bar/bottom_navigation_bar_controller.dart';
import '../../../../presenter/controllers/user/professor/responsible_activities_controller.dart';
import '../../widgets/mobile_widgets/activities_card/activities_card_user_dashboard_widget.dart';
import '../../widgets/mobile_widgets/filter/user_filter_card_widget.dart';
import '../../widgets/user_data/user_data_widget.dart';

class ResponsibleActivitiesPage extends StatefulWidget {
  const ResponsibleActivitiesPage({super.key});

  @override
  State<ResponsibleActivitiesPage> createState() =>
      _ResponsibleActivitiesPageState();
}

class _ResponsibleActivitiesPageState extends ModularState<
    ResponsibleActivitiesPage, ResponsibleActivitiesController> {
  var navBarController = Modular.get<NavigationBarController>();
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      if (controller.isLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (controller.requisitionError != null) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            UserDataWidget(
              logout: () {
                navBarController.logout();
              },
            ),
            const SizedBox(
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                controller.requisitionError!,
                textAlign: TextAlign.center,
                style: AppTextStyles.titleH1
                    .copyWith(color: AppColors.brandingOrange, fontSize: 32),
              ),
            ),
          ],
        );
      } else {
        if (controller.allResponsibleActivities.isNotEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              UserDataWidget(
                mainColor: AppColors.brandingOrange,
                logout: () {
                  navBarController.logout();
                },
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Observer(builder: (_) {
                  return UserFilterCardWidget(
                      mainColor: AppColors.brandingOrange,
                      typeFilter: controller.typeFilter,
                      dateFilter: controller.dateFilter,
                      hourFilter: controller.hourFilter,
                      resetFilters: () => controller.resetFilters(),
                      onChangedActivitiesFilter: (type) {
                        controller.setTypeFilter(type!);
                      },
                      onChangedDateFilter: (date) {
                        controller.setDateFilter(date!);
                      },
                      onChangedTimeFilter: (hour) {
                        controller.setHourFilter(hour!);
                      });
                }),
              ),
              Observer(builder: (_) {
                if (controller.activitiesToShow.isNotEmpty) {
                  return Flexible(
                      child: ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth:
                            MediaQuery.of(context).size.width < breakpointTablet
                                ? 342
                                : 1165),
                    child: ListView.builder(
                      itemCount: controller.activitiesToShow.length,
                      itemBuilder: (context, index) {
                        var finalTime = controller
                                    .activitiesToShow[index].startDate ==
                                null
                            ? ''
                            : Utils.getActivityFinalTime(
                                controller.activitiesToShow[index].startDate!,
                                controller.activitiesToShow[index].duration);
                        var hour = DateFormat('HH:mm').format(controller
                            .allResponsibleActivities[index].startDate!);
                        return MobileActivitiesCardUserDashboard(
                          date: controller.activitiesToShow[index].startDate!,
                          isExtensive:
                              controller.activitiesToShow[index].isExtensive,
                          mainColor: AppColors.brandingOrange,
                          isLoading: controller.isLoading,
                          finalTime: finalTime,
                          location: controller.activitiesToShow[index].place,
                          title: controller.activitiesToShow[index].title,
                          hour: hour,
                          onTap: () {
                            Modular.to.navigate(
                              '/user/home/more-info',
                              arguments: controller.activitiesToShow[index],
                            );
                          },
                        );
                      },
                    ),
                  ));
                } else {
                  return Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: Text(S.of(context).activitiesNotFound,
                        style: AppTextStyles.body.copyWith(
                            fontSize: MediaQuery.of(context).size.width <
                                    breakpointTablet
                                ? 20
                                : 25)),
                  );
                }
              }),
            ],
          );
        } else {
          return Scaffold(
              body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              UserDataWidget(
                mainColor: AppColors.brandingOrange,
                logout: () {
                  navBarController.logout();
                },
              ),
              const SizedBox(
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  S.of(context).noResponsibleActivitiesText,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.titleH1
                      .copyWith(color: AppColors.brandingOrange, fontSize: 32),
                ),
              ),
            ],
          ));
        }
      }
    });
  }
}
