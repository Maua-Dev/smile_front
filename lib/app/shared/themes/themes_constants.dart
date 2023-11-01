import 'package:flutter/material.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

import 'app_colors.dart';

ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
        .copyWith(secondary: Colors.blueAccent, brightness: Brightness.light),
    primaryColor: AppColors.brandingBlue,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.brandingOrange),
    textTheme: TextTheme(
      displayLarge: AppTextStyles.headline1,
      displayMedium: AppTextStyles.headline2,
      displaySmall: AppTextStyles.headline3,
      bodyLarge: AppTextStyles.bodyText1,
      bodyMedium: AppTextStyles.bodyText2,
      titleMedium: AppTextStyles.subtitle1,
      titleSmall: AppTextStyles.subtitle2,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0)),
            shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0))),
            backgroundColor:
                MaterialStateProperty.all<Color>(AppColors.brandingOrange))),
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none),
        filled: true,
        fillColor: Colors.grey.withOpacity(0.1)));

ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
      .copyWith(secondary: Colors.blueAccent, brightness: Brightness.dark),
  switchTheme: SwitchThemeData(
    trackColor: MaterialStateProperty.all<Color>(AppColors.brandingBlue),
    thumbColor: MaterialStateProperty.all<Color>(AppColors.white),
  ),
  textTheme: TextTheme(
    displayLarge: AppTextStyles.headline1.copyWith(color: AppColors.white),
    displayMedium: AppTextStyles.headline2.copyWith(color: AppColors.white),
    displaySmall: AppTextStyles.headline3.copyWith(color: AppColors.white),
    bodyLarge: AppTextStyles.bodyText1.copyWith(color: AppColors.white),
    bodyMedium: AppTextStyles.bodyText2.copyWith(color: AppColors.white),
    titleMedium: AppTextStyles.subtitle1.copyWith(color: AppColors.white),
    titleSmall: AppTextStyles.subtitle2.copyWith(color: AppColors.white),
  ),
  inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide.none),
      filled: true,
      fillColor: Colors.grey.withOpacity(0.1)),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0)),
          shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0))),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
          overlayColor: MaterialStateProperty.all<Color>(Colors.black26))),
);
