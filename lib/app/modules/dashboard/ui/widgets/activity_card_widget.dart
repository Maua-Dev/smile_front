import 'package:flutter/material.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

class ActivityCardWidget extends StatelessWidget {
  final String name;
  final String description;
  final String date;
  final String time;
  final String maxParticipants;
  final String totalParticipants;
  final Function()? onTap;
  const ActivityCardWidget(
      {Key? key,
      required this.name,
      required this.description,
      required this.date,
      required this.time,
      required this.maxParticipants,
      required this.totalParticipants,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.2,
          ),
          height: MediaQuery.of(context).size.height * 0.23,
          width: Size.infinite.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 0.5,
                blurRadius: 8,
                offset: const Offset(12, 12), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  name,
                  style: AppTextStyles.buttonBold
                      .copyWith(fontSize: 22, color: Colors.black),
                ),
                Flexible(
                  child: RichText(
                    overflow: TextOverflow.clip,
                    text: TextSpan(
                        style: AppTextStyles.button
                            .copyWith(fontSize: 16, color: Colors.black),
                        text: description),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
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
                              color: AppColors.brandingBlue,
                              size: MediaQuery.of(context).size.width < 1200
                                  ? 10
                                  : 20,
                            ),
                          ),
                          Text(date,
                              style: AppTextStyles.button.copyWith(
                                  fontSize: 18, color: AppColors.brandingBlue))
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: Icon(
                              Icons.access_time_outlined,
                              color: AppColors.brandingBlue,
                              size: MediaQuery.of(context).size.width < 1200
                                  ? 10
                                  : 20,
                            ),
                          ),
                          Text(time,
                              style: AppTextStyles.button.copyWith(
                                  fontSize: 18, color: AppColors.brandingBlue))
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: Icon(
                              Icons.person,
                              color: AppColors.brandingBlue,
                              size: MediaQuery.of(context).size.width < 1200
                                  ? 10
                                  : 20,
                            ),
                          ),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: '$totalParticipants/',
                                style: AppTextStyles.button.copyWith(
                                    fontSize: 18,
                                    color: AppColors.brandingBlue)),
                            TextSpan(
                                text: maxParticipants,
                                style: AppTextStyles.button.copyWith(
                                    fontSize: 18,
                                    color: AppColors.brandingBlue,
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
