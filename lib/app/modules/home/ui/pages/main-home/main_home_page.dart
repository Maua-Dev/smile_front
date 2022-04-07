import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';

import '../../../../../shared/themes/app_text_styles.dart';
import '../../../../../shared/utils/s3_assets_url.dart';
import '../../../utils/text_utils.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends ModularState<MainHomePage, PageController> {
  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width > 650) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
              child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                          '${previousEditionsBaseUrl}main_home.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width < 1500
                              ? 80
                              : 128,
                          bottom: 64),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Semana Mauá de Inovação,',
                                  style: AppTextStyles.titleH1.copyWith(
                                      color: Colors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.width <
                                                  1500
                                              ? 40
                                              : 55)),
                              Text('Liderança e Empreendedorismo',
                                  style: AppTextStyles.titleH1.copyWith(
                                      color: Colors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.width <
                                                  1500
                                              ? 40
                                              : 55)),
                              const SizedBox(
                                height: 16,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width < 1500
                                    ? 580
                                    : MediaQuery.of(context).size.width < 1500
                                        ? 700
                                        : 820,
                                child: Text(
                                  apresentationText,
                                  style: AppTextStyles.body.copyWith(
                                      color: Colors.white,
                                      fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width <
                                              1500
                                          ? 19
                                          : MediaQuery.of(context).size.width <
                                                  1500
                                              ? 22
                                              : 25),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Container(
                                width: 500,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: AppColors.brandingOrange,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                ),
                                child: Text(
                                  '16 a 21 de Maio',
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.buttonBold.copyWith(
                                      fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width <
                                              1500
                                          ? 40
                                          : MediaQuery.of(context).size.width <
                                                  1500
                                              ? 48
                                              : 55),
                                ),
                              ),
                              const SizedBox(
                                height: 48,
                              ),
                              TextButton(
                                  onPressed: () {
                                    Modular.to.navigate('/home/home-more-info');
                                  },
                                  child: Text(
                                    'Saiba mais >>>',
                                    textAlign: TextAlign.center,
                                    style: AppTextStyles.buttonBold.copyWith(
                                      color: AppColors.brandingOrange,
                                      fontSize:
                                          MediaQuery.of(context).size.width <
                                                  1500
                                              ? 40
                                              : 48,
                                      decoration: TextDecoration.underline,
                                    ),
                                  )),
                            ]),
                      ))))
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: CachedNetworkImageProvider(
                '${previousEditionsBaseUrl}main_home.png'),
            fit: BoxFit.fitWidth,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: Center(
              child: Text(
                'Semana Mauá de Inovação, Liderança e Empreendedorismo',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 32, right: 32),
            child: Text(
              apresentationText,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.040),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      );
    }
  }
}
