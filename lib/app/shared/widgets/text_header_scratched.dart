import 'package:flutter/material.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

class TextHeaderScratched extends StatelessWidget {
  final String title;
  final Color? color;
  final double? leftPadding;
  const TextHeaderScratched(
      {Key? key, required this.title, this.color, this.leftPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: leftPadding ?? 72,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Text(
              title,
              style: AppTextStyles.titleH1.copyWith(
                  fontSize: 45, color: color ?? AppColors.brandingPurple),
            ),
          ),
          Expanded(
            child: Divider(
              color: color ?? AppColors.brandingPurple,
              thickness: 7,
            ),
          )
        ],
      ),
    );
  }
}
