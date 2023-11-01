import 'package:flutter/material.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';
import 'package:smile_front/app/shared/themes/breakpoint.dart';
import 'package:smile_front/generated/l10n.dart';

class TokenGenerateWidget extends StatelessWidget {
  const TokenGenerateWidget({super.key, required this.confirmationCode});

  final String confirmationCode;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width < breakpointTablet ? 400 : 570,
      height: 485,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(S.of(context).validationCodeTitle,
              style: AppTextStyles.headline1.copyWith(
                fontSize: 30,
                color: Colors.black,
              )),
          const SizedBox(height: 50),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 498,
              height: 98,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: AppColors.brandingOrange)),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  confirmationCode,
                  style: AppTextStyles.headline1.copyWith(
                      color: Colors.black, fontSize: 40, letterSpacing: 10),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
