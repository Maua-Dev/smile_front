import 'package:flutter/material.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import '../../../../../shared/themes/app_text_styles.dart';

class UserActivityCardWidget extends StatelessWidget {
  final String title;
  final String activityCode;
  final String hour;

  final Function()? onTap;
  const UserActivityCardWidget(
      {Key? key,
      required this.title,
      required this.activityCode,
      required this.hour,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      hour,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.buttonBold.copyWith(
                          fontSize: MediaQuery.of(context).size.width < 1000
                              ? 18
                              : 24,
                          color: AppColors.brandingPurple),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width < 1000 ? 8 : 16,
                    ),
                    Flexible(
                      child: Text(
                        '$title - $activityCode',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.buttonBold.copyWith(
                            fontSize: MediaQuery.of(context).size.width < 1000
                                ? 16
                                : 22,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: AppColors.brandingPurple,
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
