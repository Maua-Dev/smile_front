import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:smile_front/app/modules/dashboard/ui/adm/widgets/activities_card/activities_card_widget.dart';
import 'package:smile_front/app/modules/dashboard/ui/adm/widgets/app_bar/adm_app_bar_widget.dart';
import 'package:smile_front/app/modules/dashboard/ui/adm/widgets/filter/filter_card_widget.dart';
import 'package:smile_front/app/modules/dashboard/ui/adm/widgets/side_bar/side_bar_widget.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';
import 'package:smile_front/generated/l10n.dart';
import '../../../../shared/utils/utils.dart';
import '../../../../shared/widgets/dialogs/action_confirmation_dialog_widget.dart';
import '../../../auth/infra/repositories/secure_storage.dart';
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
    var secureStorage = Modular.get<SecureStorage>();
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(73),
          child: AdmAppBarWidget(
              appBarText: S.of(context).admDashboardAppBarTitle)),
      body: Row(
        children: [
          const SideBarWidget(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: Observer(builder: (_) {
                      return SizedBox(
                        width: 1165,
                        child: FilterCardWidget(
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
                          },
                        ),
                      );
                    })),
                Observer(builder: (_) {
                  if (controller.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (controller.activitiesList.isNotEmpty) {
                      return Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.activitiesList.length,
                          itemBuilder: (BuildContext context, int index) {
                            String date = DateFormat('dd/MM/yyyy').format(
                                controller.activitiesList[index].startDate!);
                            String time = DateFormat('HH:mm').format(
                                controller.activitiesList[index].startDate!);
                            String finalTime = Utils.getActivityFinalTime(
                                controller.activitiesList[index].startDate!,
                                controller.activitiesList[index].duration);
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 40),
                              child: Observer(builder: (_) {
                                return ActivitiesCardWidget(
                                  finalDateTime:
                                      Utils.getActivityFinalTimeDatetime(
                                          controller
                                              .activitiesList[index].startDate!,
                                          controller
                                              .activitiesList[index].duration),
                                  isLoading: controller.isLoading,
                                  isManualDropLoading:
                                      controller.isManualDropLoading,
                                  onPressedDropActivity:
                                      (activityCode, userId) {
                                    controller.dropActivity(
                                        activityCode, userId);
                                  },
                                  enrollments: controller
                                      .activitiesList[index].enrollments,
                                  isExtensive: controller
                                      .activitiesList[index].isExtensive,
                                  activityCode: controller
                                      .activitiesList[index].activityCode,
                                  date: date,
                                  description: controller
                                      .activitiesList[index].description,
                                  totalParticipants: controller
                                      .activitiesList[index].totalSlots,
                                  title: controller.activitiesList[index].title,
                                  time: time,
                                  finalTime: finalTime,
                                  onPressedDelete: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Observer(builder: (_) {
                                          return ActionConfirmationDialogWidget(
                                              isLoading: controller.isLoading,
                                              title:
                                                  'Tem certeza que deseja continuar?',
                                              content:
                                                  'Ao confirmar todos os dados antigos serão perdidos.',
                                              onPressed: () async {
                                                await controller
                                                    .deleteUserActivity(
                                                        controller
                                                            .activitiesList[
                                                                index]
                                                            .activityCode);
                                                Modular.to.pop();
                                              });
                                        });
                                      },
                                    );
                                  },
                                  onPressedEdit: () async {
                                    var accessLevel =
                                        await secureStorage.getRole();
                                    if (accessLevel == 'ADMIN') {
                                      Modular.to.navigate(
                                        '/adm/edit-activity',
                                        arguments: controller.activitiesList
                                            .firstWhere((element) =>
                                                element.activityCode ==
                                                controller.activitiesList[index]
                                                    .activityCode),
                                      );
                                    }
                                  },
                                );
                              }),
                            );
                          },
                        ),
                      );
                    } else {
                      return Text(S.of(context).activitiesNotFound,
                          style: AppTextStyles.body);
                    }
                  }
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
