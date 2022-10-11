import 'package:flutter/material.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

class FormsButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final String buttonTittle;
  final Color backgroundColor;
  final Widget? icon;
  const FormsButtonWidget(
      {Key? key,
      this.onPressed,
      required this.buttonTittle,
      required this.backgroundColor,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.04,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(20),
            backgroundColor: MaterialStateProperty.all(backgroundColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: icon ?? const SizedBox.shrink(),
            ),
            Text(
              buttonTittle,
              style: AppTextStyles.button.copyWith(
                  fontSize: MediaQuery.of(context).size.width < 1630 ? 15 : 20),
            ),
          ],
        ),
      ),
    );
  }
}
