import 'package:flutter/material.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

class AppbarLogoWidget extends StatelessWidget {
  final double? horizontalPadding;
  const AppbarLogoWidget({Key? key, this.horizontalPadding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding ?? 140),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text(
                  '<',
                  style: AppTextStyles.buttonBold
                      .copyWith(color: AppColors.brandingBlue, fontSize: 50),
                ),
              ),
              Text('>',
                  style: AppTextStyles.buttonBold
                      .copyWith(color: AppColors.lightBlue, fontSize: 50)),
            ],
          ),
          Image.asset(
            'assets/images/logo_smile.png',
            fit: BoxFit.cover,
            height: 40,
          ),
        ],
      ),
    );
  }
}
