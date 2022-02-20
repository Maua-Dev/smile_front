import 'package:flutter/material.dart';
import 'package:smile_front/app/modules/user_pages/ui/widgets/confirm_delete_modal.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';

import '../../domain/infra/activity_enum.dart';

class RowTableWidget extends StatelessWidget {
  final String id;
  final String name;
  final String description;
  final String date;
  final String time;
  final int maxParticipants;
  final int totalParticipants;
  final ActivityEnum activityType;
  final Future<dynamic> Function(String, String) unsubscribeActivityFunction;

  const RowTableWidget({
    Key? key,
    required this.id,
    required this.name,
    required this.description,
    required this.date,
    required this.time,
    required this.maxParticipants,
    required this.totalParticipants,
    required this.activityType,
    required this.unsubscribeActivityFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.lightBlue, borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.3,
            height: 70,
            child: Text(
              name,
              style: TextStyle(color: AppColors.brandingBlue),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.1,
            height: 70,
            child: Text(
              date,
              style: TextStyle(color: AppColors.brandingBlue),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.1,
            height: 70,
            child: Text(
              time,
              style: TextStyle(color: AppColors.brandingBlue),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.2,
            height: 70,
            child: Text(
              activityType.name,
              style: TextStyle(color: AppColors.brandingBlue),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.05,
            height: 70,
            child: Text(
              '$totalParticipants / $maxParticipants',
              style: TextStyle(color: AppColors.brandingBlue),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.05,
              height: 70,
              child: ConfirmDeleteModal(
                activityId: id,
                userId: name,
                unsubscribeActivityFunction: unsubscribeActivityFunction,
              )),
        ],
      ),
    );
  }
}
