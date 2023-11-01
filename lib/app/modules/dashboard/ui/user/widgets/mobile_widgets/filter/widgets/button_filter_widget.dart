import 'package:flutter/material.dart';
import '../../../../../../../../shared/themes/app_colors.dart';
import '../../../../../../../../shared/themes/app_text_styles.dart';
import '../../../../../../../../shared/themes/breakpoint.dart';

class ButtonFilterWidget extends StatelessWidget {
  final Function()? onPressed;
  final String title;
  final double? width;
  const ButtonFilterWidget(
      {super.key, this.onPressed, required this.title, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: MediaQuery.of(context).size.width > breakpointTablet ? 47 : 36,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 10,
            padding: const EdgeInsets.only(left: 16),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: AppColors.brandingBlue, width: 2)),
          ),
          onPressed: onPressed ?? () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTextStyles.headline1.copyWith(
                  fontSize:
                      (MediaQuery.of(context).size.width > breakpointTablet)
                          ? 25
                          : 14,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_right,
                size: 35,
                color: AppColors.brandingOrange,
              )
            ],
          )),
    );
  }
}
