import 'package:flutter/material.dart';

import '../../../themes/app_colors.dart';

class NavBarButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final int indexToShow;
  final int myIndex;
  final String buttonText;
  final IconData icon;
  const NavBarButtonWidget({
    Key? key,
    this.onPressed,
    required this.indexToShow,
    required this.buttonText,
    required this.icon,
    required this.myIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Column(
        children: [
          Icon(
            icon,
            color: indexToShow == myIndex
                ? AppColors.brandingOrange
                : Colors.white,
            size: 55,
          ),
          Text(
            buttonText,
            style: TextStyle(
                color: indexToShow == myIndex
                    ? AppColors.brandingOrange
                    : Colors.white,
                fontSize: 15),
          )
        ],
      ),
    );
  }
}
