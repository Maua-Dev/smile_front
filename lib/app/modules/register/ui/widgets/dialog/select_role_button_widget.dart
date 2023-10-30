import 'package:flutter/material.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

import '../../../../../shared/helpers/utils/screen_helper.dart';

class SelectRoleButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final String title;
  const SelectRoleButtonWidget(
      {super.key, this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: SizedBox(
        width: 350,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 24),
              backgroundColor: AppColors.white,
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      width: 2, // thickness
                      color: AppColors.brandingOrange // color
                      ),
                  // border radius
                  borderRadius: BorderRadius.circular(10))),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.headline1.copyWith(
                color: AppColors.backgroundLogin,
                fontSize: Screen.width(context) < 400 ? 18 : 22),
          ),
        ),
      ),
    );
  }
}
