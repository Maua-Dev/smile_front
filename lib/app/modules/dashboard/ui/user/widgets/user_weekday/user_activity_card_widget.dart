import 'package:flutter/material.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_web.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

class UserActivityCardWidget extends StatelessWidget {
  final String title;
  final String activityCode;
  final String hour;
  final String finalTime;
  final String? location;
  final bool? isOnline;

  final Function()? onTap;
  const UserActivityCardWidget(
      {Key? key,
      required this.title,
      required this.activityCode,
      required this.hour,
      this.onTap,
      required this.finalTime,
      this.location,
      this.isOnline})
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
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.width < 1000 ? 8 : 16),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextRenderer(
                      child: Text(
                        hour,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.buttonBold.copyWith(
                            fontSize: MediaQuery.of(context).size.width < 1000
                                ? 18
                                : 24,
                            color: AppColors.brandingPurple),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width < 1000 ? 8 : 16,
                    ),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (activityCode != '' && title != '')
                            TextRenderer(
                              child: Text(
                                '$title ($activityCode)',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.buttonBold.copyWith(
                                    fontSize:
                                        MediaQuery.of(context).size.width < 1000
                                            ? 16
                                            : 24,
                                    color: Colors.black),
                              ),
                            ),
                          if (location != null && location != '')
                            TextRenderer(
                              child: Text(
                                'Término: $finalTime',
                                style: AppTextStyles.buttonBold.copyWith(
                                    fontSize:
                                        MediaQuery.of(context).size.width < 1000
                                            ? 14
                                            : 16,
                                    color: AppColors.gray),
                              ),
                            ),
                          if (location != null && location != '')
                            TextRenderer(
                              child: Text(
                                'Local: $location',
                                style: AppTextStyles.buttonBold.copyWith(
                                    fontSize:
                                        MediaQuery.of(context).size.width < 1000
                                            ? 14
                                            : 16,
                                    color: AppColors.gray),
                              ),
                            )
                        ],
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
