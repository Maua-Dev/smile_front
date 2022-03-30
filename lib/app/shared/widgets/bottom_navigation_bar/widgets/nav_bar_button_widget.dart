import 'package:flutter/material.dart';

import '../../../themes/app_colors.dart';

class NavBarButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final int indexToShow;
  final int myIndex;
  final IconData icon;
  const NavBarButtonWidget({
    Key? key,
    this.onPressed,
    required this.indexToShow,
    required this.icon,
    required this.myIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Icon(
          icon,
          color:
              indexToShow == myIndex ? AppColors.brandingOrange : Colors.white,
          size: 48,
        ));
  }
}
