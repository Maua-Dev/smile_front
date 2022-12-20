import 'package:flutter/material.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_web.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

class TextHeader extends StatelessWidget {
  final String title;
  final double? fontSize;
  final Color? color;
  final double? leftPadding;
  const TextHeader(
      {Key? key,
      required this.title,
      this.color,
      this.leftPadding,
      this.fontSize})
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
            child: TextRenderer(
              child: Text(
                title,
                style: AppTextStyles.titleH1.copyWith(
                    fontSize: fontSize ?? 45,
                    color: color ?? AppColors.brandingBlue),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
