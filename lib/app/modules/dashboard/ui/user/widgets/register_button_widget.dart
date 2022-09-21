import 'package:flutter/material.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_web.dart';

import '../../../../../shared/themes/app_colors.dart';
import '../../../../../shared/themes/app_text_styles.dart';

class RegisterButtonWidget extends StatelessWidget {
  final bool isRegistered;
  final bool isLoading;
  final Function()? onPressed;
  const RegisterButtonWidget(
      {Key? key,
      required this.isRegistered,
      this.onPressed,
      required this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(vertical: 12, horizontal: 64)),
            elevation: MaterialStateProperty.all(20),
            backgroundColor: MaterialStateProperty.all(
                isRegistered ? AppColors.redButton : AppColors.brandingPurple),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            )),
        onPressed: onPressed,
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                color: Colors.white,
              ))
            : TextRenderer(
                child: Text(isRegistered ? 'Desinscrever-se' : 'Inscreva-se',
                    style: AppTextStyles.buttonBold.copyWith(
                        fontSize: MediaQuery.of(context).size.width < 500
                            ? 20
                            : MediaQuery.of(context).size.width < 1000
                                ? 24
                                : 28,
                        color: Colors.white))));
  }
}
