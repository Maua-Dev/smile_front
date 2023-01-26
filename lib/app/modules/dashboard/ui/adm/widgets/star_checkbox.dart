import 'package:flutter/material.dart';

import '../../../../../shared/themes/app_colors.dart';

class StarCheckbox extends StatefulWidget {
  const StarCheckbox({super.key});

  @override
  State<StarCheckbox> createState() => _StarCheckboxState();
}

class _StarCheckboxState extends State<StarCheckbox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Icon(
      Icons.star_border,
      color: AppColors.brandingOrange,
    ));
  }
}
