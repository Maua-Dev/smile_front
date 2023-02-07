import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/all_activities_user_dashboard_controller.dart';
import 'package:smile_front/app/modules/dashboard/ui/user/widgets/app_widgets/filter/app_filter_card_widget.dart';
import 'package:smile_front/app/modules/dashboard/ui/user/widgets/dropdown-field/dropdown_field_widget.dart';
import 'package:smile_front/app/modules/dashboard/ui/user/widgets/user_weekday/user_activity_card_widget.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/breakpoint.dart';
import '../../../../shared/utils/utils.dart';
import '../../../../shared/widgets/text-header/text_header.dart';
import '../../presenter/controllers/user/user_dashboard_controller.dart';
import 'widgets/app_widgets/activities_card/app_activities_card_widget.dart';
import 'widgets/user_weekday/user_weekday_filter_widget.dart';

class AllActivitiesUserDashboardPage extends StatefulWidget {
  const AllActivitiesUserDashboardPage({Key? key}) : super(key: key);

  @override
  State<AllActivitiesUserDashboardPage> createState() =>
      _AllActivitiesUserDashboardPageState();
}

class _AllActivitiesUserDashboardPageState extends ModularState<
    AllActivitiesUserDashboardPage, AllActivitiesUserDashboardController> {
  final subscribedActivitiesController = Modular.get<UserDashboardController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 16,
        ),
        TextHeader(
          title: MediaQuery.of(context).size.width < breakpointMobile
              ? 'Atividades'
              : "Todas as Atividades",
          color: MediaQuery.of(context).size.width < breakpointMobile
              ? AppColors.brandingOrange
              : AppColors.brandingBlue,
          fontSize: MediaQuery.of(context).size.width < breakpointMobile
              ? 24
              : MediaQuery.of(context).size.width > 1000
                  ? 38
                  : 30,
          leftPadding: 32,
        ),
        if (MediaQuery.of(context).size.width < breakpointMobile)
          const SizedBox(
            height: 16,
          ),
        if (MediaQuery.of(context).size.width < breakpointMobile)
          Observer(builder: (_) {
            return AppFilterCardWidget(
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
        if (MediaQuery.of(context).size.width < breakpointMobile)
          const SizedBox(
            height: 16,
          ),
        if (MediaQuery.of(context).size.width < breakpointMobile)
          Observer(builder: (_) {
            if (controller.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Flexible(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 342),
                  child: ListView.builder(
                    itemCount: controller.activitiesList.length,
                    itemBuilder: (context, index) {
                      var finalTime = controller
                                      .allActivitiesToCards[index].duration ==
                                  null ||
                              controller.allActivitiesToCards[index].date ==
                                  null
                          ? ''
                          : Utils.getActivityFinalTime(
                              controller.allActivitiesToCards[index].date!,
                              controller.allActivitiesToCards[index].duration!);
                      var hour = DateFormat('HH:mm')
                          .format(controller.allActivitiesToCards[index].date!);
                      return AppActivitiesCard(
                        finalTime: finalTime,
                        location:
                            controller.allActivitiesToCards[index].location,
                        title: controller.allActivitiesToCards[index].title,
                        hour: hour,
                      );
                    },
                  ),
                ),
              );
            }
          }),
        if (MediaQuery.of(context).size.width > breakpointMobile)
          UserWeekdayFilterWidget(
            onPressed: controller.toggleFilterActivityChipIndex,
          ),
        if (MediaQuery.of(context).size.width > breakpointMobile)
          const SizedBox(
            height: 16,
          ),
        if (MediaQuery.of(context).size.width > breakpointMobile)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: DropDownFieldWidget<ActivityEnum>(
              titulo: 'Tipo',
              items: ActivityEnum.values.map((ActivityEnum value) {
                return DropdownMenuItem<ActivityEnum>(
                  value: value,
                  child: Text(value.name),
                );
              }).toList(),
              onChanged: controller.getActivitiesByType,
              value: controller.activityType,
            ),
          ),
        const SizedBox(
          height: 16,
        ),
        if (MediaQuery.of(context).size.width > breakpointMobile)
          Observer(builder: (_) {
            if (controller.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Flexible(
                child: ListView.builder(
                  itemCount: controller.weekActivitiesList.length,
                  itemBuilder: (context, index) {
                    var finalTime =
                        controller.weekActivitiesList[index].duration == null ||
                                controller.weekActivitiesList[index].date ==
                                    null
                            ? ''
                            : Utils.getActivityFinalTime(
                                controller.weekActivitiesList[index].date!,
                                controller.weekActivitiesList[index].duration!);
                    var hour = DateFormat('HH:mm')
                        .format(controller.weekActivitiesList[index].date!);
                    return UserActivityCardWidget(
                      finalTime: finalTime,
                      location: controller.weekActivitiesList[index].location,
                      isOnline:
                          controller.weekActivitiesList[index].link == null
                              ? false
                              : true,
                      title: controller.weekActivitiesList[index].title,
                      hour: hour,
                      activityCode:
                          controller.weekActivitiesList[index].activityCode,
                      onTap: () {
                        var isRegistered = false;
                        var list = controller
                            .controller.subscribedActivitiesList
                            .where((element) =>
                                element.activityCode ==
                                controller
                                    .weekActivitiesList[index].activityCode)
                            .toList();
                        if (list.isNotEmpty) {
                          isRegistered = true;
                        }
                        Modular.to.navigate(
                          '/user/home/more-info',
                          arguments: [
                            controller.weekActivitiesList[index],
                            isRegistered
                          ],
                        );
                        controller.analytics.logViewActivity(
                            controller.weekActivitiesList[index].activityCode);
                      },
                    );
                  },
                ),
              );
            }
          }),
      ],
    );
  }
}
