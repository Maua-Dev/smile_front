import 'package:flutter/material.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

class ActionTextButtonWidget extends StatelessWidget {
  final String? title;
  final Color? backgroundColor;
  final double? widthSize;
  final double? heightSize;
  final double? paddingHorizontal;
  final double? paddingVertical;
  final Function()? onPressed;

  const ActionTextButtonWidget({
    Key? key,
    this.backgroundColor,
    this.onPressed,
    this.title,
    this.widthSize,
    this.heightSize,
    this.paddingHorizontal,
    this.paddingVertical,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: paddingHorizontal ?? 0, vertical: paddingVertical ?? 0),
      child: SizedBox(
        width: widthSize,
        height: heightSize,
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
