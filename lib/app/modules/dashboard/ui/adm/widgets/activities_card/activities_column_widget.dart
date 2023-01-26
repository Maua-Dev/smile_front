// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:smile_front/app/modules/auth/infra/repositories/secure_storage.dart';
import 'package:smile_front/app/modules/dashboard/ui/adm/widgets/activities_card/activities_card_widget.dart';
import 'package:smile_front/app/modules/dashboard/ui/adm/widgets/activities_card/column_builder_widget.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';

import '../../../../../../shared/utils/utils.dart';

class ActivitiesColumnWidget extends StatelessWidget {
  final List<ActivityModel> listAllActivities;

  const ActivitiesColumnWidget({
    Key? key,
    required this.listAllActivities,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var secureStorage = Modular.get<SecureStorage>();
    if (listAllActivities.isNotEmpty) {
      return SizedBox(
        width: MediaQuery.of(context).size.width - 115,
        child: ColumnBuilder(
          itemCount: listAllActivities.length,
          itemBuilder: (BuildContext context, int index) {
            String date = DateFormat('dd/MM/yyyy')
                .format(listAllActivities[index].schedule.date!);
            String time = DateFormat('HH:mm')
                .format(listAllActivities[index].schedule.date!);
            String finalTime = Utils.getActivityFinalTime(
                listAllActivities[index].schedule.date!,
                listAllActivities[index].schedule.duration!);
            return Column(
              children: [
                ActivitiesCardWidget(
                  activityCode: listAllActivities[index].activityCode,
                  date: date,
                  description: listAllActivities[index].description,
                  enrolledUsersLength:
                      listAllActivities[index].schedule.enrolledUsers!,
                  totalParticipants:
                      listAllActivities[index].schedule.totalParticipants!,
                  title: listAllActivities[index].title,
                  time: time,
                  finalTime: finalTime,
                  onPressedDelete: () {},
                  onPressedEdit: () async {
                    var accessLevel = await secureStorage.getAccessLevel();
                    if (accessLevel == 'ADMIN') {
                      Modular.to.navigate(
                        '/adm/edit-activity',
                        arguments: listAllActivities.firstWhere((element) =>
                            element.id == listAllActivities[index].id),
                      );
                    }
                  },
                )
              ],
            );
          },
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
