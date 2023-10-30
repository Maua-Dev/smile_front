import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

import '../generated/l10n.dart';

final scaffoldKey = GlobalKey<ScaffoldMessengerState>();
final ScaffoldMessengerState scaffold = scaffoldKey.currentState!;

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Intl.defaultLocale = 'pt_BR';
    return MaterialApp(
      scaffoldMessengerKey: scaffoldKey,
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      scrollBehavior: AppScrollBehavior(),
      title: 'Semana Mauá de Inovação, Liderança e Empreendedorismo',
      theme: ThemeData(
          fontFamily: 'Roboto',
          colorScheme: const ColorScheme.light().copyWith(
            primary: AppColors.brandingBlue,
            secondary: AppColors.brandingOrange,
          ),
          textTheme: TextTheme(
            bodyLarge: AppTextStyles.headline1,
            bodyMedium: AppTextStyles.headline2,
          ),
          appBarTheme: AppBarTheme(
            color: AppColors.brandingBlue,
          ),
          scaffoldBackgroundColor: AppColors.backgroudColor),
    ).modular();
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
