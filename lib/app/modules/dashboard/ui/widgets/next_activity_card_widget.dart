import 'package:flutter/material.dart';

import '../../../../shared/themes/app_colors.dart';
import '../../../../shared/themes/app_text_styles.dart';

class NextActivityCardWidget extends StatelessWidget {
  final String name;
  final String description;
  final String date;
  final String time;
  final int? totalParticipants;
  final Color? cardColor;
  final Color? textColor;
  final Function()? onTap;
  const NextActivityCardWidget({
    Key? key,
    required this.name,
    required this.description,
    required this.date,
    required this.time,
    required this.totalParticipants,
    this.onTap,
    this.cardColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 72, left: 72, bottom: 48, top: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.2,
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
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  name,
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
                    mainAxisAlignment: MainAxisAlignment.end,
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
                      const SizedBox(
                        width: 16,
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
                      const SizedBox(
                        width: 16,
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
                                text: '$totalParticipants',
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
