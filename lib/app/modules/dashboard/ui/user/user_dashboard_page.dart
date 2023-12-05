import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:smile_front/app/modules/dashboard/ui/user/widgets/mobile_widgets/activities_card/activities_card_all_activities_dashboard.dart';
import 'package:smile_front/app/modules/dashboard/ui/user/widgets/mobile_widgets/filter/user_filter_card_widget.dart';
import 'package:smile_front/app/modules/dashboard/ui/user/widgets/user_data/user_data_widget.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';
import 'package:smile_front/app/shared/themes/breakpoint.dart';
import 'package:smile_front/app/shared/widgets/text-header/text_header.dart';
import 'package:smile_front/generated/l10n.dart';
import '../../../../shared/entities/infra/enrollment_state_enum.dart';
import '../../../../shared/models/enrollments_model.dart';
import '../../../../shared/utils/utils.dart';
import '../../../../shared/widgets/bottom_navigation_bar/bottom_navigation_bar_controller.dart';
import '../../presenter/controllers/user/user_dashboard_controller.dart';
import 'widgets/next_activity/next_activity_card_widget.dart';

class UserDashboardPage extends StatefulWidget {
  const UserDashboardPage({Key? key}) : super(key: key);

  @override
  State<UserDashboardPage> createState() => _UserDashboardPageState();
}

class _UserDashboardPageState
    extends ModularState<UserDashboardPage, UserDashboardController> {
  var navBarController = Modular.get<NavigationBarController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Observer(builder: (context) {
        if (controller.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.requisitionError != null) {
          return RefreshIndicator(
            onRefresh: () {
              return controller.getUserSubscribedActivities();
            },
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width < breakpointTablet
                    ? 380
                    : 1165,
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: UserDataWidget(
                        logout: () {
                          navBarController.logout();
                        },
                      ),
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
          if (controller.allSubscribedActivitiesList.isNotEmpty) {
            return RefreshIndicator(
              onRefresh: () {
                return controller.getUserSubscribedActivities();
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
                            height: 8,
                          ),
                          if (controller.nextActivity.type != null)
                            TextHeader(
                              title: S.of(context).nextActivityTitle,
                              fontSize: MediaQuery.of(context).size.width < 500
                                  ? 24
                                  : MediaQuery.of(context).size.width > 1000
                                      ? 38
                                      : 30,
                              leftPadding:
                                  MediaQuery.of(context).size.width < 1000
                                      ? 12
                                      : 8,
                            ),
                          if (controller.nextActivity.type != null)
                            Observer(builder: (_) {
                              return NextActivityCardWidget(
                                isUser: true,
                                link: controller.nextActivity.link,
                                location: controller.nextActivity.place,
                                duration: controller.nextActivity.duration,
                                onTap: () {
                                  Modular.to.navigate('/user/home/more-info',
                                      arguments:
                                          controller.nextActivity.activityCode);
                                },
                                name: controller.nextActivity.title,
                                description:
                                    controller.nextActivity.description ?? '',
                                date: controller.nextActivity.startDate,
                              );
                            }),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Observer(builder: (_) {
                              return UserFilterCardWidget(
                                  onChangedEnrollmentFilter: (type) {
                                    controller.setEnrollmentFilter(type!);
                                  },
                                  enrollmentFilter: controller.enrollmentFilter,
                                  typeOnScreen: controller.typeOnScreen,
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
                            if (controller
                                .subscribedActivitiesOnScreen.isNotEmpty) {
                              return ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: controller
                                    .subscribedActivitiesOnScreen.length,
                                itemBuilder: (context, index) {
                                  var finalTime = controller
                                              .subscribedActivitiesOnScreen[
                                                  index]
                                              .startDate ==
                                          null
                                      ? ''
                                      : Utils.getActivityFinalTime(
                                          controller
                                              .subscribedActivitiesOnScreen[
                                                  index]
                                              .startDate!,
                                          controller
                                              .subscribedActivitiesOnScreen[
                                                  index]
                                              .duration);
                                  var hour = DateFormat('HH:mm').format(
                                      controller
                                          .subscribedActivitiesOnScreen[index]
                                          .startDate!);
                                  return ActivitiesCardAllActivitiesDashboard(
                                    onPressedSubscribe: () {
                                      controller.subscribeUserActivity(
                                          controller
                                              .subscribedActivitiesOnScreen[
                                                  index]
                                              .activityCode);
                                    },
                                    onPressedUnsubscribe: () {
                                      controller.unsubscribeUserActivity(
                                          controller
                                              .subscribedActivitiesOnScreen[
                                                  index]
                                              .activityCode);
                                    },
                                    isLoading: controller.isLoading,
                                    finalTime: finalTime,
                                    location: controller
                                        .subscribedActivitiesOnScreen[index]
                                        .place,
                                    title: controller
                                        .subscribedActivitiesOnScreen[index]
                                        .title,
                                    hour: hour,
                                    activityEnrollment: controller
                                            .subscribedActivitiesOnScreen[index]
                                            .enrollments ??
                                        EnrollmentsModel(
                                            state: EnrollmentStateEnum.NONE,
                                            dateSubscribed: DateTime.now()),
                                    acceptingNewEnrollments: controller
                                        .subscribedActivitiesOnScreen[index]
                                        .acceptingNewEnrollments,
                                    takenSlots: controller
                                        .subscribedActivitiesOnScreen[index]
                                        .takenSlots,
                                    totalSlots: controller
                                        .subscribedActivitiesOnScreen[index]
                                        .totalSlots,
                                    onTap: () {
                                      Modular.to.navigate(
                                        '/user/home/more-info',
                                        arguments: controller
                                            .subscribedActivitiesOnScreen[index]
                                            .activityCode,
                                      );
                                    },
                                    isExtensive: controller
                                        .subscribedActivitiesOnScreen[index]
                                        .isExtensive,
                                    date: controller
                                        .subscribedActivitiesOnScreen[index]
                                        .startDate!,
                                  );
                                },
                              );
                            } else {
                              return Text(S.of(context).activitiesNotFound,
                                  style: AppTextStyles.body.copyWith(
                                      fontSize:
                                          MediaQuery.of(context).size.width <
                                                  breakpointTablet
                                              ? 20
                                              : 25));
                            }
                          }),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Scaffold(
                body: RefreshIndicator(
              onRefresh: () {
                return controller.getUserSubscribedActivities();
              },
              child: Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width < breakpointTablet
                      ? MediaQuery.of(context).size.width
                      : 1165,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ListView(
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: UserDataWidget(
                            logout: () {
                              navBarController.logout();
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 200,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            S.of(context).noActivitiesEnrolledText,
                            textAlign: TextAlign.center,
                            style: AppTextStyles.titleH1.copyWith(
                                color: AppColors.brandingOrange, fontSize: 32),
                          ),
                        ),
                        const SizedBox(
                          height: 48,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: ElevatedButton(
                              onPressed: () async {
                                await navBarController.toggleIndex(2);
                                Modular.to
                                    .navigate('/user/home/all-activities');
                              },
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(20),
                                backgroundColor: MaterialStateProperty.all(
                                    AppColors.brandingOrange),
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
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.width <
                                                  1630
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
                    ),
                  ),
                ),
              ),
            ));
          }
        }
      }),
    );
  }
}
