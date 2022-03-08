import 'package:flutter/material.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

class FormsButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final String buttonTittle;
  final Color backgroundColor;
  const FormsButtonWidget(
      {Key? key,
      this.onPressed,
      required this.buttonTittle,
      required this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.1,
      height: MediaQuery.of(context).size.height * 0.05,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          buttonTittle,
          style: AppTextStyles.button.copyWith(fontSize: 20),
        ),
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(20),
            backgroundColor: MaterialStateProperty.all(backgroundColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            )),
      ),
    );
  }
}
