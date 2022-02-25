import 'package:flutter/material.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

class SponsorshipNavigationButton extends StatelessWidget {
  final Function()? onPressed;
  const SponsorshipNavigationButton({Key? key, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: SizedBox(
          height: height * 0.05,
          width: 3 * width * 0.15 + width * 0.3 + 192,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: 'Desenvolvido por ',
                      style: AppTextStyles.button.copyWith(fontSize: 25)),
                  TextSpan(
                      text: 'Dev. Community Mauá',
                      style: AppTextStyles.buttonBold.copyWith(fontSize: 25)),
                ]),
              ),
            ],
          ),
        ),
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
                const EdgeInsets.symmetric(horizontal: 24, vertical: 24)),
            elevation: MaterialStateProperty.all<double?>(10),
            backgroundColor:
                MaterialStateProperty.all<Color?>(AppColors.brandingBlue),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ))),
      ),
    );
  }
}
