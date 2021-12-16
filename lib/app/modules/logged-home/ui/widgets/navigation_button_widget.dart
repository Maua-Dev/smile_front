import 'package:flutter/material.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

class NavigationButtonWidget extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Function()? onPressed;
  const NavigationButtonWidget(
      {Key? key, required this.title, this.icon, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: onPressed,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                icon,
                size: 64,
                color: Colors.white,
              ),
              const SizedBox(
                height: 64,
              ),
              Text(
                title,
                style: AppTextStyles.body
                    .copyWith(color: Colors.white, fontSize: 30),
              )
            ],
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
      ],
    );
  }
}
