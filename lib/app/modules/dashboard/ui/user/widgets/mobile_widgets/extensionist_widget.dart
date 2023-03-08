import 'package:flutter/material.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

class ExtensionistWidget extends StatelessWidget {
  const ExtensionistWidget({super.key, required this.isExtensionist});

  final bool isExtensionist;

  @override
  Widget build(BuildContext context) {
    return isExtensionist
        ? Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: AppColors.brandingOrange),
                borderRadius: BorderRadius.circular(12)),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(
                Icons.star,
                color: AppColors.brandingOrange,
                size: 28,
              ),
              Text('Extensionista',
                  style: AppTextStyles.bold
                      .copyWith(fontSize: 7, color: AppColors.brandingOrange))
            ]),
          )
        : const SizedBox(width: 50);
  }
}
