import 'package:flutter/material.dart';

import '../../../../../../shared/entities/screen_variables.dart';
import '../../../../../../shared/themes/app_colors.dart';
import '../../../../../../shared/themes/app_text_styles.dart';
import '../../../../../../shared/utils/screen_helper.dart';

class H1HeaderTextWidget extends StatelessWidget {
  final String title;
  final EdgeInsets? padding;
  const H1HeaderTextWidget({super.key, required this.title, this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: AppTextStyles.titleH1.copyWith(
                fontSize: Screen.width(context) < cellphoneSize
                    ? 24
                    : MediaQuery.of(context).size.width < tabletSize
                        ? 32
                        : 46,
                color: AppColors.brandingBlue),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            height: 5,
            width: 200,
            color: AppColors.brandingOrange,
          ),
        ],
      ),
    );
  }
}
