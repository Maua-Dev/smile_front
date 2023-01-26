import 'package:flutter/material.dart';

import '../../../../../../shared/themes/app_colors.dart';

class ExtensiveActivityCheck extends StatelessWidget {
  const ExtensiveActivityCheck(
      {super.key, required this.onChanged, required this.isExtensive});

  final void Function() onChanged;
  final bool isExtensive;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 24.0, left: 24),
        child: Container(
          height: 50,
          width: 125,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(5, 5), // changes position of shadow
                ),
              ],
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(width: 1, color: AppColors.brandingBlue)),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: onChanged,
              child: Icon(isExtensive ? Icons.star : Icons.star_border,
                  color: AppColors.brandingOrange),
            ),
          ),
        ));
  }
}
