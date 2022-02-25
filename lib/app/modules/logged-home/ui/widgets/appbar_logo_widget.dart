import 'package:flutter/material.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

class AppbarLogoWidget extends StatelessWidget {
  const AppbarLogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        width: 3 * width * 0.15 + width * 0.3 + 192,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Text(
                    '<',
                    style: AppTextStyles.buttonBold
                        .copyWith(color: AppColors.brandingBlue, fontSize: 50),
                  ),
                ),
                Text('>',
                    style: AppTextStyles.buttonBold
                        .copyWith(color: AppColors.lightBlue, fontSize: 50)),
              ],
            ),
            Image.asset(
              'assets/images/logo_smile.png',
              fit: BoxFit.cover,
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
