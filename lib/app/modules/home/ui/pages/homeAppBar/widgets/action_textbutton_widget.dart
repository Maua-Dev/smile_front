import 'package:flutter/material.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

class ActionTextButtonWidget extends StatelessWidget {
  final String? title;
  final Color? backgroundColor;
  final Function()? onPressed;

  const ActionTextButtonWidget({
    Key? key,
    this.backgroundColor,
    this.onPressed,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8, right: 6),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        child: Text(title ?? '',
            textAlign: TextAlign.center,
            style: AppTextStyles.body.copyWith(color: Colors.white)),
      ),
    );
  }
}
