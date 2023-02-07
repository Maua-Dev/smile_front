import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/all_activities_user_dashboard_controller.dart';
import 'package:smile_front/app/modules/dashboard/ui/user/widgets/dropdown-field/dropdown_field_widget.dart';
import 'package:smile_front/app/modules/dashboard/ui/user/widgets/mobile-responsive/filter_mobile_card_widget.dart';
import 'package:smile_front/app/modules/dashboard/ui/user/widgets/user_weekday/user_activity_card_widget.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';
import 'package:smile_front/app/shared/themes/breakpoint.dart';
import '../../../../shared/utils/utils.dart';
import '../../../../shared/widgets/text-header/text_header.dart';
import '../../presenter/controllers/user/user_dashboard_controller.dart';
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
          const FilterMobileCardWidget(),
        if (MediaQuery.of(context).size.width < breakpointMobile)
          const SizedBox(
            height: 16,
          ),
        if (MediaQuery.of(context).size.width < breakpointMobile)
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(15),
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    spreadRadius: 0.5,
                    blurRadius: 3,
                    offset: const Offset(5, 5), // changes position of shadow
                  ),
                ]),
            width: 342,
            height: 76,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: 70,
                      height: 76,
                      decoration: BoxDecoration(
                          color: AppColors.brandingBlue,
                          borderRadius: BorderRadius.circular(15)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text('13:00', style: AppTextStyles.bold),
                      )),
                  Column(
                    children: [
                      Row(children: [
                        SizedBox(
                          width: 215,
                          height: 34,
                          child: Text(
                              'Digitalização no contexto da Indústria 4.0',
                              maxLines: 2,
                              style: AppTextStyles.bold.copyWith(
                                  fontSize: 16, color: AppColors.brandingBlue)),
                        ),
                        Icon(Icons.star, color: AppColors.brandingOrange)
                      ]),
                      Row(children: [
                        Column(
                          children: [
                            Text('Término: 14:50',
                                style: AppTextStyles.bold.copyWith(
                                    fontSize: 12, color: Colors.black)),
                            Text('Local: H244',
                                style: AppTextStyles.bold.copyWith(
                                    fontSize: 12, color: Colors.black)),
                          ],
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(AppColors.white),
                            ),
                            onPressed: () {},
                            child: Text('Inscrever-se',
                                style: AppTextStyles.bold.copyWith(
                                    fontSize: 12,
                                    color: AppColors.brandingOrange)))
                      ])
                    ],
                  )
                ]),
          ),
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
                              controller.weekActivitiesList[index].date == null
                          ? ''
                          : Utils.getActivityFinalTime(
                              controller.weekActivitiesList[index].date!,
                              controller.weekActivitiesList[index].duration!);
                  var hour = DateFormat('HH:mm')
                      .format(controller.weekActivitiesList[index].date!);
                  return UserActivityCardWidget(
                    finalTime: finalTime,
                    location: controller.weekActivitiesList[index].location,
                    isOnline: controller.weekActivitiesList[index].link == null
                        ? false
                        : true,
                    title: controller.weekActivitiesList[index].title,
                    hour: hour,
                    activityCode:
                        controller.weekActivitiesList[index].activityCode,
                    onTap: () {
                      var isRegistered = false;
                      var list = controller.controller.subscribedActivitiesList
                          .where((element) =>
                              element.activityCode ==
                              controller.weekActivitiesList[index].activityCode)
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
