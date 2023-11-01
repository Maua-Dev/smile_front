import 'package:flutter/material.dart';

import '../../../themes/app_colors.dart';
import '../../../themes/app_text_styles.dart';

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

abstract class GlobalSnackBar {
  static void error(String message) {
    rootScaffoldMessengerKey.currentState!.showSnackBar(SnackBar(
      backgroundColor: AppColors.redButton,
      behavior: SnackBarBehavior.floating,
      content: Text(message,
          style: AppTextStyles.headline1.copyWith(color: AppColors.white)),
    ));
  }

  static void success(String message) {
    rootScaffoldMessengerKey.currentState!.showSnackBar(SnackBar(
      backgroundColor: AppColors.brandingOrange,
      behavior: SnackBarBehavior.floating,
      content: Text(message,
          style: AppTextStyles.headline1.copyWith(color: AppColors.white)),
    ));
  }
}
