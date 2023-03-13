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
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 4.0, left: 4),
            child: Text(
              "Extensiva",
              style: TextStyle(fontSize: 18),
            ),
          ),
          Container(
            height: 50,
            width: 125,
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(width: 1, color: AppColors.brandingBlue)),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: onChanged,
                child: Icon(isExtensive ? Icons.star : Icons.star_border,
                    color: AppColors.brandingOrange),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
