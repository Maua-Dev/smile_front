import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:smile_front/app/modules/dashboard/ui/adm/widgets/activities_card/activities_card_widget.dart';
import 'package:smile_front/app/modules/dashboard/ui/adm/widgets/app_bar/adm_app_bar_widget.dart';
import 'package:smile_front/app/modules/dashboard/ui/adm/widgets/filter/filter_card_widget.dart';
import 'package:smile_front/app/modules/dashboard/ui/adm/widgets/side_bar/side_bar_widget.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';
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
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(73),
          child: AdmAppBarWidget(appBarText: 'Página do Administrador')),
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
                    child: FilterCardWidget(onChangedActivitiesFilter: (type) {
                      controller.setFilterType(type!);
                      controller.allFilters();
                    }, onChangedDateFilter: (date) {
                      controller.setFilterDate(date!);
                      controller.allFilters();
                    }, onChangedTimeFilter: (hour) {
                      controller.setFilterHour(hour!);
                      controller.allFilters();
                    }, resetFilters: () {
                      controller.resetFilters();
                    })),
                Observer(builder: (_) {
                  if (controller.isLoading) {
                    return const Expanded(
                        child: Center(
                      child: CircularProgressIndicator(),
                    ));
                  } else {
                    if (controller.activitiesList.isNotEmpty) {
                      return SizedBox(
                        width: 1165,
                        height: MediaQuery.of(context).size.height - 260,
                        child: ListView.builder(
                          itemCount: controller.activitiesList.length,
                          itemBuilder: (BuildContext context, int index) {
                            String date = DateFormat('dd/MM/yyyy').format(
                                controller
                                    .activitiesList[index].schedule.date!);
                            String time = DateFormat('HH:mm').format(controller
                                .activitiesList[index].schedule.date!);
                            String finalTime = Utils.getActivityFinalTime(
                                controller.activitiesList[index].schedule.date!,
                                controller
                                    .activitiesList[index].schedule.duration!);
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 40),
                              child: Observer(builder: (_) {
                                return ActivitiesCardWidget(
                                  activityCode: controller
                                      .activitiesList[index].activityCode,
                                  date: date,
                                  description: controller
                                      .activitiesList[index].description,
                                  enrolledUsersLength: controller
                                      .activitiesList[index]
                                      .schedule
                                      .enrolledUsers!,
                                  totalParticipants: controller
                                      .activitiesList[index]
                                      .schedule
                                      .totalParticipants!,
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
                                                            .id);
                                                Modular.to.pop();
                                              });
                                        });
                                      },
                                    );
                                  },
                                  onPressedEdit: () async {
                                    var accessLevel =
                                        await secureStorage.getAccessLevel();
                                    if (accessLevel == 'ADMIN') {
                                      Modular.to.navigate(
                                        '/adm/edit-activity',
                                        arguments: controller.activitiesList
                                            .firstWhere((element) =>
                                                element.id ==
                                                controller
                                                    .activitiesList[index].id),
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
                      return Text('Atividade não encontrada',
                          style: AppTextStyles.body.copyWith(fontSize: 30));
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
