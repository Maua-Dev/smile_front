import 'package:flutter/material.dart';

import '../../../../../../shared/themes/app_colors.dart';
import '../../../../../../shared/themes/app_text_styles.dart';

class H1HeaderTextWidget extends StatelessWidget {
  final String title;
  const H1HeaderTextWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title,
            style: AppTextStyles.titleH1.copyWith(
                fontSize: MediaQuery.of(context).size.width < 900
                    ? MediaQuery.of(context).size.width < 530
                        ? 24
                        : 32
                    : 48,
                color: AppColors.brandingBlue)),
        const SizedBox(
          height: 16,
        ),
        Container(
          height: 5,
          width: 200,
          color: AppColors.brandingOrange,
        )
      ],
    );
  }
}
