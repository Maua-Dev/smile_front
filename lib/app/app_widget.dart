import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Intl.defaultLocale = 'pt_BR';
    return MaterialApp(
      supportedLocales: const [Locale('pt')],
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      title: 'Smile',
      theme: ThemeData(
        fontFamily: 'Roboto',
        colorScheme: const ColorScheme.light().copyWith(
          primary: AppColors.brandingBlue,
          secondary: AppColors.brandingOrange,
        ),
        textTheme: TextTheme(
          bodyText1: AppTextStyles.titleH1,
          bodyText2: AppTextStyles.body,
        ),
        appBarTheme: AppBarTheme(
          color: AppColors.brandingBlue,
        ),
      ),
    ).modular();
  }
}
