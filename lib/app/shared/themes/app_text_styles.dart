import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';

class AppTextStyles {
  static final TextStyle titleH1 = GoogleFonts.roboto(
    color: AppColors.brandingBlue,
    fontSize: 60,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle body = GoogleFonts.roboto(
    color: AppColors.brandingBlue,
    fontSize: 25,
  );

  static final TextStyle buttonBold = GoogleFonts.roboto(
    color: Colors.white,
    fontSize: 70,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle button = GoogleFonts.roboto(
    color: Colors.white,
    fontSize: 25,
  );
}
