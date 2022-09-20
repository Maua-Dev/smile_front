import 'package:flutter/material.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_web.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

class LogoutButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final String buttonTittle;
  final Color backgroundColor;
  const LogoutButtonWidget(
      {Key? key,
      this.onPressed,
      required this.buttonTittle,
      required this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(20),
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          )),
      child: Padding(     
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: TextRenderer(
          child: Text(
            buttonTittle,
            style: AppTextStyles.button.copyWith(fontSize: 20),
          ),),
      ),
    );
  }
}
