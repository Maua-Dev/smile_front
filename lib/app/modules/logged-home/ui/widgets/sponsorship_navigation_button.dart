import 'package:flutter/material.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';
import '../responsivity_adm_home.dart';

class SponsorshipNavigationButton extends StatelessWidget {
  final Function()? onPressed;
  final double? cardWidth;
  const SponsorshipNavigationButton({Key? key, this.onPressed, this.cardWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: SizedBox(
          height: sponsorNavigationHeight(size),
          width: cardWidth ?? 1592,
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
