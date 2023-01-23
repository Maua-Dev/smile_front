// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:smile_front/app/modules/auth/infra/repositories/secure_storage.dart';
import 'package:smile_front/app/modules/dashboard/ui/adm/widgets/activities_card/activities_card_widget.dart';
import 'package:smile_front/app/modules/dashboard/ui/adm/widgets/activities_card/column_builder_widget.dart';

import 'package:smile_front/app/shared/entities/card_activity.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';

import '../../../../../../shared/utils/utils.dart';

class ActivitiesColumnWidget extends StatelessWidget {
  final List<CardActivity> list;
  final List<ActivityModel> listToEdit;

  const ActivitiesColumnWidget({
    Key? key,
    required this.list,
    required this.listToEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var secureStorage = Modular.get<SecureStorage>();
    if (list.isNotEmpty) {
      return SizedBox(
        width: MediaQuery.of(context).size.width - 115,
        child: ColumnBuilder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            String date = DateFormat('dd/MM/yyyy').format(list[index].date!);
            String time = DateFormat('HH:mm').format(list[index].date!);
            String finalTime = Utils.getActivityFinalTime(
                list[index].date!, list[index].duration!);
            return Column(
              children: [
                ActivitiesCardWidget(
                  activityCode: list[index].activityCode,
                  date: date,
                  description: list[index].description,
                  enrolledUsersLength: list[index].enrolledUsers!,
                  totalParticipants: list[index].totalParticipants!,
                  name: list[index].title,
                  onPressed: () async {
                    var accessLevel = await secureStorage.getAccessLevel();
                    if (accessLevel == 'ADMIN') {
                      Modular.to.navigate(
                        '/adm/edit-activity',
                        arguments: listToEdit.firstWhere(
                            (element) => element.id == list[index].id),
                      );
                    }
                  },
                  time: time,
                  finalTime: finalTime,
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
