import 'package:flutter/material.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

class ActionTextButtonWidget extends StatelessWidget {
  final String? title;
  final Color? backgroundColor;
  final double? widthSize;
  final Function()? onPressed;

  const ActionTextButtonWidget({
    Key? key,
    this.backgroundColor,
    this.onPressed,
    this.title,
    this.widthSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: SizedBox(
        width: widthSize,
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            alignment: Alignment.center,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
          child: Text(title ?? '',
              textAlign: TextAlign.center,
              style: AppTextStyles.body
                  .copyWith(color: Colors.white, fontSize: 25)),
        ),
      ),
    );
  }
}
