import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:intl/intl.dart';
import 'package:seo_renderer/helpers/robot_detector_web.dart';
import 'package:seo_renderer/seo_renderer.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

final scaffoldKey = GlobalKey<ScaffoldMessengerState>();
final ScaffoldMessengerState scaffold = scaffoldKey.currentState!;

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Intl.defaultLocale = 'pt_BR';
    Modular.setInitialRoute('/home');
    Modular.setObservers([seoRouteObserver]);
    return RobotDetector(
        child: MaterialApp.router(
      scaffoldMessengerKey: scaffoldKey,
      supportedLocales: const [Locale('pt', 'BR')],
      debugShowCheckedModeBanner: false,

      // navigatorObservers: [
      //   FirebaseAnalyticsService().getAnalyticsObserver(),
      //   seoRouteObserver
      // ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      scrollBehavior: AppScrollBehavior(),
      title: 'Semana Mauá de Inovação, Liderança e Empreendedorismo',
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
          scaffoldBackgroundColor: AppColors.backgroudColor),
    ));
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
