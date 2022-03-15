import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';

class AppTextStyles {
  static final TextStyle titleH1 = GoogleFonts.roboto(
    color: AppColors.brandingPurple,
    fontSize: 60,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle body = GoogleFonts.roboto(
    color: AppColors.brandingPurple,
    fontSize: 25,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle thinButton = GoogleFonts.roboto(
    color: Colors.white,
    fontSize: 25,
    fontWeight: FontWeight.w100,
  );

  static final TextStyle buttonBold = GoogleFonts.roboto(
    color: Colors.white,
    fontSize: 25,
    fontWeight: FontWeight.w900,
  );

  static final TextStyle button = GoogleFonts.roboto(
    color: Colors.white,
    fontSize: 25,
  );
}
