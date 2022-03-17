import 'package:flutter/material.dart';

import '../../../themes/app_colors.dart';

class NavBarButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final int indexToShow;
  final String buttonText;
  final IconData icon;
  const NavBarButtonWidget({
    Key? key,
    this.onPressed,
    required this.indexToShow,
    required this.buttonText,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Column(
        children: [
          Icon(
            icon,
            color: indexToShow == 4 ? AppColors.brandingOrange : Colors.white,
            size: 55,
          ),
          Text(
            buttonText,
            style: TextStyle(
                color:
                    indexToShow == 4 ? AppColors.brandingOrange : Colors.white,
                fontSize: 15),
          )
        ],
      ),
    );
  }
}
