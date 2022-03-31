import 'package:flutter/material.dart';

import '../../../../shared/themes/app_colors.dart';
import '../../../../shared/themes/app_text_styles.dart';

class RegisterButtonWidget extends StatelessWidget {
  final bool isRegistered;
  final Function()? onPressed;
  const RegisterButtonWidget(
      {Key? key, required this.isRegistered, this.onPressed})
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
        child: Text(isRegistered ? 'Desinscrever' : 'Inscrever',
            style: AppTextStyles.buttonBold.copyWith(
                fontSize: MediaQuery.of(context).size.width < 1000 ? 24 : 28,
                color: Colors.white)),
        onPressed: onPressed);
  }
}
