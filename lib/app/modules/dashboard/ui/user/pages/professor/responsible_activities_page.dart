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
import '../../../../../../shared/widgets/text-header/text_header.dart';
import '../../../../presenter/controllers/user/professor/responsible_activities_controller.dart';
import '../../widgets/mobile_widgets/activities_card/activities_card_professor_widget.dart';
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
        return RefreshIndicator(
          onRefresh: () {
            return controller.getFilteredActivities();
          },
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width < breakpointTablet
                  ? 380
                  : 1165,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  TextHeader(
                    title: 'Atividades Responsáveis',
                    color: MediaQuery.of(context).size.width < breakpointTablet
                        ? AppColors.brandingOrange
                        : AppColors.brandingBlue,
                    fontSize:
                        MediaQuery.of(context).size.width < breakpointTablet
                            ? 24
                            : MediaQuery.of(context).size.width > 1000
                                ? 38
                                : 30,
                  ),
                  const SizedBox(
                    height: 200,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      controller.requisitionError!,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.titleH1.copyWith(
                          color: AppColors.brandingOrange, fontSize: 32),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      } else {
        if (controller.allResponsibleActivities.isNotEmpty) {
          return RefreshIndicator(
            onRefresh: () {
              return controller.getFilteredActivities();
            },
            child: SingleChildScrollView(
              child: Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width < breakpointTablet
                      ? 380
                      : 1165,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      TextHeader(
                        title: 'Atividades Responsáveis',
                        color: AppColors.brandingOrange,
                        fontSize:
                            MediaQuery.of(context).size.width < breakpointTablet
                                ? 24
                                : MediaQuery.of(context).size.width > 1000
                                    ? 38
                                    : 30,
                        leftPadding:
                            MediaQuery.of(context).size.width < breakpointMobile
                                ? 24
                                : 0,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Observer(builder: (_) {
                          return UserFilterCardWidget(
                              enrollmentFilter: controller.enrollmentFilter,
                              onChangedEnrollmentFilter: (type) {
                                controller.setEnrollmentFilter(type!);
                              },
                              typeOnScreen: controller.typeOnScreen,
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
                          return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.activitiesToShow.length,
                            itemBuilder: (context, index) {
                              var finalTime = controller
                                          .activitiesToShow[index].startDate ==
                                      null
                                  ? ''
                                  : Utils.getActivityFinalTime(
                                      controller
                                          .activitiesToShow[index].startDate!,
                                      controller
                                          .activitiesToShow[index].duration);
                              var hour = DateFormat('HH:mm').format(controller
                                  .allResponsibleActivities[index].startDate!);
                              return ActivitiesCardProfessorWidget(
                                deliveryEnum: controller
                                    .activitiesToShow[index].deliveryEnum,
                                date: controller
                                    .activitiesToShow[index].startDate!,
                                isExtensive: controller
                                    .activitiesToShow[index].isExtensive,
                                mainColor: AppColors.brandingOrange,
                                isLoading: controller.isLoading,
                                finalTime: finalTime,
                                location:
                                    controller.activitiesToShow[index].place,
                                title: controller.activitiesToShow[index].title,
                                hour: hour,
                                onTap: () {
                                  Modular.to.navigate(
                                    '/user/home/professor/responsible-activities',
                                    arguments: controller
                                        .activitiesToShow[index].activityCode,
                                  );
                                },
                              );
                            },
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsets.only(top: 24),
                            child: Text(S.of(context).activitiesNotFound,
                                style: AppTextStyles.body.copyWith(
                                    fontSize:
                                        MediaQuery.of(context).size.width <
                                                breakpointTablet
                                            ? 20
                                            : 25)),
                          );
                        }
                      }),
                    ],
                  ),
                ),
              ),
            ),
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
