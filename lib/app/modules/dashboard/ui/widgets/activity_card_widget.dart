import 'package:flutter/material.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

class ActivityCardWidget extends StatelessWidget {
  final String name;
  final String activityCode;
  final String description;
  final String date;
  final String time;
  final int? totalParticipants;
  final Color? cardColor;
  final Color? textColor;
  final Function()? onTap;
  const ActivityCardWidget({
    Key? key,
    required this.name,
    required this.description,
    this.onTap,
    this.cardColor,
    this.textColor,
    required this.activityCode,
    required this.date,
    required this.time,
    this.totalParticipants,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          constraints: const BoxConstraints(
            minWidth: 350,
          ),
          width: MediaQuery.of(context).size.height * 0.2,
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: BoxDecoration(
            color: cardColor ?? Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                spreadRadius: 0.5,
                blurRadius: 3,
                offset: const Offset(5, 5), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$activityCode - $name',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.buttonBold
                      .copyWith(fontSize: 22, color: textColor ?? Colors.black),
                ),
                Flexible(
                  child: Text(
                    description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.button.copyWith(
                      fontSize: 16,
                      color: textColor ?? Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: Icon(
                              Icons.calendar_today,
                              color: textColor ?? AppColors.brandingPurple,
                              size: 20,
                            ),
                          ),
                          Text(date,
                              style: AppTextStyles.button.copyWith(
                                  fontSize: 18,
                                  color: textColor ?? AppColors.brandingPurple))
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: Icon(
                              Icons.access_time_outlined,
                              color: textColor ?? AppColors.brandingPurple,
                              size: 20,
                            ),
                          ),
                          Text(time,
                              style: AppTextStyles.button.copyWith(
                                  fontSize: 18,
                                  color: textColor ?? AppColors.brandingPurple))
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: Icon(
                              Icons.person,
                              color: textColor ?? AppColors.brandingPurple,
                              size: 20,
                            ),
                          ),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: '0/',
                                style: AppTextStyles.button.copyWith(
                                    fontSize: 18,
                                    color:
                                        textColor ?? AppColors.brandingPurple)),
                            TextSpan(
                                text: totalParticipants.toString(),
                                style: AppTextStyles.button.copyWith(
                                    fontSize: 18,
                                    color:
                                        textColor ?? AppColors.brandingPurple,
                                    fontWeight: FontWeight.bold)),
                          ])),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
