// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:smile_front/app/modules/dashboard/ui/adm/widgets/subscriber_list_dialog/subscriber_list_dialog.dart';
import 'package:smile_front/app/shared/models/enrollments_model.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

class ActivitiesCardWidget extends StatelessWidget {
  final String title;
  final String activityCode;
  final String description;
  final String date;
  final String time;
  final String finalTime;
  final List<EnrollmentsModel> enrollments;
  final int enrolledUsersLength;
  final int totalParticipants;
  final bool isExtensive;
  final Function() onPressedEdit;
  final Function() onPressedDelete;
  final Function(String, String) onPressed;
  const ActivitiesCardWidget({
    Key? key,
    required this.onPressed,
    required this.title,
    required this.activityCode,
    required this.description,
    required this.date,
    required this.time,
    required this.finalTime,
    required this.enrollments,
    required this.enrolledUsersLength,
    required this.totalParticipants,
    required this.isExtensive,
    required this.onPressedEdit,
    required this.onPressedDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1165,
      height: 204,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            spreadRadius: 0.5,
            blurRadius: 3,
            offset: const Offset(5, 5), // changes position of shadow
          ),
        ],
      ),
      child: Row(children: [
        SizedBox(
          width: 773,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 39,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: AppColors.brandingBlue,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 680,
                            child: Text('$activityCode - $title',
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    overflow: TextOverflow.ellipsis)),
                          ),
                          if (isExtensive)
                            Icon(
                              Icons.star_border_outlined,
                              size: 33,
                              color: AppColors.brandingOrange,
                            ),
                        ],
                      ),
                    ),
                  ),
                  Text(description,
                      maxLines: 3,
                      style: AppTextStyles.body.copyWith(
                          fontSize: 20, overflow: TextOverflow.ellipsis)),
                ]),
          ),
        ),
        Container(
            width: 390,
            height: 204,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.brandingBlue,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: 33,
                            color: AppColors.white,
                          ),
                          Text(date,
                              style: AppTextStyles.body.copyWith(
                                  fontSize: 18, color: AppColors.white))
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.watch_later_outlined,
                            size: 33,
                            color: AppColors.white,
                          ),
                          Text('$time - $finalTime',
                              style: AppTextStyles.body.copyWith(
                                  fontSize: 18, color: AppColors.white))
                        ],
                      ),
                    ]),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Observer(builder: (_) {
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SubscriberListDialog(
                                      onPressed: onPressed,
                                      activityTitle: '$activityCode - $title',
                                      isExtensive: isExtensive,
                                      participants:
                                          '$enrolledUsersLength/$totalParticipants',
                                      enrollments: enrollments,
                                      activityCode: activityCode,
                                    );
                                  });
                            },
                            child: Container(
                              width: 147,
                              height: 44,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.4),
                                    spreadRadius: 0.5,
                                    blurRadius: 3,
                                    offset: const Offset(
                                        5, 5), // changes position of shadow
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(15),
                                color: const Color.fromARGB(255, 46, 66, 138),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.person,
                                    size: 33,
                                    color: AppColors.white,
                                  ),
                                  Observer(builder: (_) {
                                    return Text(
                                        '$enrolledUsersLength/$totalParticipants',
                                        style: AppTextStyles.body.copyWith(
                                            fontSize: 18,
                                            color: AppColors.white));
                                  }),
                                  Icon(
                                    Icons.keyboard_arrow_right,
                                    size: 42,
                                    color: AppColors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                      Observer(builder: (_) {
                        return IconButton(
                            onPressed: onPressedEdit,
                            icon: Icon(Icons.mode_edit_outline_sharp,
                                size: 28, color: AppColors.brandingOrange));
                      }),
                      Observer(builder: (_) {
                        return IconButton(
                            onPressed: onPressedDelete,
                            icon: Icon(Icons.delete,
                                size: 28, color: AppColors.brandingOrange));
                      })
                    ])
              ],
            ))
      ]),
    );
  }
}
