import 'package:flutter/material.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

class BrandingTextButtonWidget extends StatelessWidget {
  final String? title;
  final double? fontSize;
  final Function()? onPressed;
  final Color backgroundColor;
  final double? boxHeight;
  final double? boxWidth;
  const BrandingTextButtonWidget(
      {Key? key,
      this.title,
      this.fontSize,
      this.onPressed,
      required this.backgroundColor,
      this.boxHeight,
      this.boxWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: boxHeight,
      width: boxWidth,
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            alignment: Alignment.center,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        onPressed: onPressed,
        child: Text(
          title ?? '',
          textAlign: TextAlign.center,
          style: AppTextStyles.buttonBold.copyWith(
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
