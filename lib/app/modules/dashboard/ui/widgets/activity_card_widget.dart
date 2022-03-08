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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.lightBlue,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              width: Size.infinite.width,
              decoration: BoxDecoration(
                  color: AppColors.brandingBlue,
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: AppTextStyles.buttonBold.copyWith(fontSize: 22),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Flexible(
                      child: RichText(
                        overflow: TextOverflow.clip,
                        text: TextSpan(
                            style: AppTextStyles.button.copyWith(
                              fontSize: 16,
                            ),
                            text: description),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
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
                          size: 28,
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
                          size: 28,
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
                          size: 28,
                        ),
                      ),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: '$totalParticipants/',
                            style: AppTextStyles.button.copyWith(
                                fontSize: 18, color: AppColors.brandingBlue)),
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
    );
  }
}
