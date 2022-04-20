import 'package:flutter/material.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

import '../../app_widget.dart';

void showErrorSnackBar(String errorMessage) {
  scaffold.showSnackBar(SnackBar(
      duration: const Duration(seconds: 2),
      width: MediaQuery.of(scaffold.context).size.width < 700 ? 300 : 500,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      behavior: SnackBarBehavior.floating,
      elevation: 10,
      backgroundColor: Colors.black.withOpacity(0.7),
      content: Text(
        errorMessage,
        style: AppTextStyles.body.copyWith(
          fontSize: 18,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      )));
}
