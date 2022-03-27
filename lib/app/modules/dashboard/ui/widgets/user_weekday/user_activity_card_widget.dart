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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          constraints: const BoxConstraints(
            minWidth: 350,
          ),
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: BoxDecoration(
            color: Colors.white,
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
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    hour,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.buttonBold.copyWith(
                        fontSize:
                            MediaQuery.of(context).size.width < 1000 ? 18 : 24,
                        color: AppColors.brandingPurple),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            MediaQuery.of(context).size.width < 1000 ? 8 : 16,
                        vertical: 8),
                    child: const VerticalDivider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      '$title - $activityCode',
                      maxLines: 3,
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
        ),
      ),
    );
  }
}
