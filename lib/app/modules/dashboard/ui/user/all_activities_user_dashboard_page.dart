import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/all_activities_user_dashboard_controller.dart';
import 'package:smile_front/app/modules/dashboard/ui/user/widgets/mobile_widgets/filter/user_filter_card_widget.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';
import 'package:smile_front/generated/l10n.dart';
import '../../../../shared/entities/infra/enrollment_state_enum.dart';
import '../../../../shared/models/enrollments_model.dart';
import '../../../../shared/themes/breakpoint.dart';
import '../../../../shared/utils/utils.dart';
import '../../../../shared/widgets/text-header/text_header.dart';
import 'widgets/mobile_widgets/activities_card/activities_card_all_activities_dashboard.dart';

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
    return Container(
      color: Colors.white,
      child: RefreshIndicator(
        onRefresh: () {
          return controller.getActivities();
        },
        child: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width < breakpointTablet
                  ? MediaQuery.of(context).size.width
                  : 1165,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    TextHeader(
                      title: S.of(context).allActivitiesTitle,
                      color: AppColors.brandingBlue,
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
                      height: 16,
                    ),
                    Observer(builder: (_) {
                      return UserFilterCardWidget(
                          typeOnScreen: controller.typeOnScreen,
                          typeFilter: controller.typeFilter,
                          dateFilter: controller.dateFilter,
                          hourFilter: controller.hourFilter,
                          enrollmentFilter: controller.enrollmentFilter,
                          onChangedEnrollmentFilter: (type) {
                            controller.setEnrollmentFilter(type!);
                          },
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
                    const SizedBox(
                      height: 16,
                    ),
                    Observer(builder: (_) {
                      if (controller.isLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (controller.requisitionError != null) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 200,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                controller.requisitionError!,
                                textAlign: TextAlign.center,
                                style: AppTextStyles.titleH1.copyWith(
                                    color: AppColors.brandingOrange,
                                    fontSize: 32),
                              ),
                            ),
                          ],
                        );
                      } else {
                        if (controller.activitiesOnScreen.isNotEmpty) {
                          return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.activitiesOnScreen.length,
                            itemBuilder: (context, index) {
                              var finalTime = controller
                                          .activitiesOnScreen[index]
                                          .startDate ==
                                      null
                                  ? ''
                                  : Utils.getActivityFinalTime(
                                      controller
                                          .activitiesOnScreen[index].startDate!,
                                      controller
                                          .activitiesOnScreen[index].duration);
                              var hour = DateFormat('HH:mm').format(controller
                                  .activitiesOnScreen[index].startDate!);
                              return Observer(builder: (_) {
                                return ActivitiesCardAllActivitiesDashboard(
                                  deliveryEnum: controller
                                      .activitiesOnScreen[index].deliveryEnum,
                                  onPressedSubscribe: () {
                                    controller.subscribeUserActivity(controller
                                        .activitiesOnScreen[index]
                                        .activityCode);
                                  },
                                  onPressedUnsubscribe: () {
                                    controller.unsubscribeUserActivity(
                                        controller.activitiesOnScreen[index]
                                            .activityCode);
                                  },
                                  isLoading: controller.isLoading,
                                  finalTime: finalTime,
                                  location: controller
                                      .activitiesOnScreen[index].place,
                                  title: controller
                                      .activitiesOnScreen[index].title,
                                  hour: hour,
                                  activityEnrollment: controller
                                          .activitiesOnScreen[index]
                                          .enrollments ??
                                      EnrollmentsModel(
                                          state: EnrollmentStateEnum.NONE,
                                          dateSubscribed: DateTime.now()),
                                  acceptingNewEnrollments: controller
                                      .activitiesOnScreen[index]
                                      .acceptingNewEnrollments,
                                  takenSlots: controller
                                      .activitiesOnScreen[index].takenSlots,
                                  totalSlots: controller
                                      .activitiesOnScreen[index].totalSlots,
                                  onTap: () {
                                    Modular.to.navigate(
                                      '/user/home/more-info',
                                      arguments: controller
                                          .activitiesOnScreen[index]
                                          .activityCode,
                                    );
                                  },
                                  isExtensive: controller
                                      .activitiesOnScreen[index].isExtensive,
                                  date: controller
                                      .activitiesOnScreen[index].startDate!,
                                );
                              });
                            },
                          );
                        } else {
                          return Observer(builder: (_) {
                            return Text(S.of(context).activitiesNotFound,
                                style: AppTextStyles.body.copyWith(
                                    fontSize:
                                        MediaQuery.of(context).size.width <
                                                breakpointTablet
                                            ? 20
                                            : 25));
                          });
                        }
                      }
                    }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
