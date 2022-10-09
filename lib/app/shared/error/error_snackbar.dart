import 'package:flutter/material.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_web.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

import '../../app_widget.dart';

void showErrorSnackBar({required String errorMessage, Color? color}) {
  scaffold.showSnackBar(SnackBar(
      duration: const Duration(seconds: 5),
      width: MediaQuery.of(scaffold.context).size.width < 700 ? 300 : 500,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      behavior: SnackBarBehavior.floating,
      elevation: 10,
      backgroundColor: color ?? Colors.black.withOpacity(0.7),
      content: TextRenderer(
          child: Text(
        errorMessage,
        style: AppTextStyles.body.copyWith(
          fontSize: 18,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ))));
}
