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
                if (controller.allResponsibleActivities.isNotEmpty) {
                  return Flexible(
                      child: ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth:
                            MediaQuery.of(context).size.width < breakpointTablet
                                ? 342
                                : 1165),
                    child: ListView.builder(
                      itemCount: controller.allResponsibleActivities.length,
                      itemBuilder: (context, index) {
                        var finalTime = controller
                                    .allResponsibleActivities[index]
                                    .startDate ==
                                null
                            ? ''
                            : Utils.getActivityFinalTime(
                                controller
                                    .allResponsibleActivities[index].startDate!,
                                controller
                                    .allResponsibleActivities[index].duration);
                        var hour = DateFormat('HH:mm').format(controller
                            .allResponsibleActivities[index].startDate!);
                        return MobileActivitiesCardUserDashboard(
                          mainColor: AppColors.brandingOrange,
                          isLoading: controller.isLoading,
                          finalTime: finalTime,
                          location:
                              controller.allResponsibleActivities[index].place,
                          title:
                              controller.allResponsibleActivities[index].title,
                          hour: hour,
                          onTap: () {
                            Modular.to.navigate(
                              '/user/home/more-info',
                              arguments:
                                  controller.allResponsibleActivities[index],
                            );
                          },
                        );
                      },
                    ),
                  ));
                } else {
                  return Text(S.of(context).activitiesNotFound,
                      style: AppTextStyles.body.copyWith(
                          fontSize: MediaQuery.of(context).size.width <
                                  breakpointTablet
                              ? 20
                              : 25));
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
              const SizedBox(
                height: 48,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      await navBarController.toggleIndex(2);
                      Modular.to.navigate('/user/home/all-activities');
                    },
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(20),
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.brandingOrange),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 16),
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          S.of(context).signUp.toUpperCase(),
                          style: AppTextStyles.button.copyWith(
                            fontSize: MediaQuery.of(context).size.width < 1630
                                ? 20
                                : 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ));
        }
      }
    });
  }
}
