import 'package:flutter/material.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';

class CircularIconWidget extends StatelessWidget {
  const CircularIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.brightness_1,
        color: AppColors.lightPurple,
        size: 20,
      ),
      onPressed: () {},
    );
  }
}
