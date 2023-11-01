import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smile_front/app/modules/adm/domain/entities/activity_admin.dart';
import 'package:smile_front/app/shared/helpers/utils/utils.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';
import 'package:smile_front/generated/l10n.dart';

class AdmActivityCardWidget extends StatelessWidget {
  final ActivityAdmin activityAdmin;
  const AdmActivityCardWidget({super.key, required this.activityAdmin});

  @override
  Widget build(BuildContext context) {
    String date = DateFormat('dd/MM/yyyy').format(activityAdmin.startDate);
    String time = DateFormat('HH:mm').format(activityAdmin.startDate);
    String finalTime = Utils.getActivityFinalTime(
        activityAdmin.startDate, activityAdmin.duration);

    return Container(
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
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: AppColors.brandingBlue,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$activityAdmin.activityCode - $activityAdmin.title',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (activityAdmin.isExtensive)
                        Tooltip(
                          triggerMode: TooltipTriggerMode.tap,
                          message: S.of(context).isExtensiveTooltip,
                          child: Icon(
                            Icons.star,
                            size: 33,
                            color: AppColors.brandingOrange,
                          ),
                        )
                    ],
                  ),
                ),
                Text(
                  activityAdmin.description,
                  maxLines: 3,
                  style: AppTextStyles.headline1.copyWith(
                    fontSize: 20,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Column(
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
                            style: AppTextStyles.headline1
                                .copyWith(fontSize: 18, color: AppColors.white))
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
                            style: AppTextStyles.headline1
                                .copyWith(fontSize: 18, color: AppColors.white))
                      ],
                    ),
                  ]),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          size: 33,
                          color: AppColors.white,
                        ),
                        Text(
                          '$activityAdmin.enrolledUsersLength/$activityAdmin.totalParticipants',
                          style: AppTextStyles.headline1
                              .copyWith(fontSize: 18, color: AppColors.white),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          size: 42,
                          color: AppColors.white,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.mode_edit_outline_sharp,
                          size: 28, color: AppColors.brandingOrange)),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.delete,
                          size: 28, color: AppColors.brandingOrange)),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
