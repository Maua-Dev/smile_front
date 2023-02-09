import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/all_activities_user_dashboard_controller.dart';
import 'package:smile_front/app/modules/dashboard/ui/user/widgets/mobile_widgets/filter/mobile_filter_card_widget.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/breakpoint.dart';
import '../../../../shared/utils/utils.dart';
import '../../../../shared/widgets/text-header/text_header.dart';
import 'widgets/mobile_widgets/activities_card/mobile_activities_card_widget.dart';

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
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        TextHeader(
          title: MediaQuery.of(context).size.width < breakpointTablet
              ? 'Atividades'
              : 'Todas as Atividades',
          color: MediaQuery.of(context).size.width < breakpointTablet
              ? AppColors.brandingOrange
              : AppColors.brandingBlue,
          fontSize: MediaQuery.of(context).size.width < breakpointTablet
              ? 24
              : MediaQuery.of(context).size.width > 1000
                  ? 38
                  : 30,
          leftPadding: 32,
        ),
        const SizedBox(
          height: 16,
        ),
        Observer(builder: (_) {
          return MobileFilterCardWidget(
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
        const SizedBox(
          height: 16,
        ),
        Observer(builder: (_) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Flexible(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxWidth:
                        MediaQuery.of(context).size.width < breakpointTablet
                            ? 342
                            : 1165),
                child: ListView.builder(
                  itemCount: controller.activitiesOnScreen.length,
                  itemBuilder: (context, index) {
                    var finalTime = controller
                                .activitiesOnScreen[index].activity.startDate ==
                            null
                        ? ''
                        : Utils.getActivityFinalTime(
                            controller
                                .activitiesOnScreen[index].activity.startDate!,
                            controller
                                .activitiesOnScreen[index].activity.duration);
                    var hour = DateFormat('HH:mm').format(controller
                        .activitiesOnScreen[index].activity.startDate!);
                    return MobileActivitiesCard(
                      onPressedSubscribe: () {
                        controller.subscribeUserActivity(controller
                            .activitiesOnScreen[index].activity.activityCode);
                      },
                      finalTime: finalTime,
                      location:
                          controller.activitiesOnScreen[index].activity.place,
                      title:
                          controller.activitiesOnScreen[index].activity.title,
                      hour: hour,
                      onTap: () {
                        Modular.to.navigate(
                          '/user/home/more-info',
                          arguments: controller.activitiesOnScreen[index],
                        );
                        controller.analytics.logViewActivity(controller
                            .activitiesOnScreen[index].activity.activityCode);
                      },
                    );
                  },
                ),
              ),
            );
          }
        }),
      ],
    );
  }
}
