import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';

import '../../../../../shared/themes/app_text_styles.dart';
import '../../../../../shared/utils/s3_assets_url.dart';
import '../../../utils/text_utils.dart';
import '../../../../../shared/widgets/custom_elevated_button_widget.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width > 750) {
      return SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
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
                              ? 24
                              : 32,
                          bottom: 55,
                        ),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width < 900
                                      ? 350
                                      : MediaQuery.of(context).size.width *
                                                  0.5 <
                                              700
                                          ? MediaQuery.of(context).size.width *
                                              0.45
                                          : 650,
                                  decoration: BoxDecoration(
                                      color: AppColors.brandingPurple,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(24),
                                    child: Column(
                                      children: [
                                        Text('Semana Mauá de Inovação,',
                                            style: AppTextStyles.titleH1
                                                .copyWith(
                                                    color: Colors.white,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                    .size
                                                                    .width <
                                                                1500
                                                            ? 24
                                                            : 32)),
                                        Text('Liderança e Empreendedorismo',
                                            style: AppTextStyles.titleH1
                                                .copyWith(
                                                    color: Colors.white,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                    .size
                                                                    .width <
                                                                1500
                                                            ? 24
                                                            : 32)),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                      .size
                                                      .width <
                                                  1500
                                              ? MediaQuery.of(context)
                                                          .size
                                                          .width <
                                                      900
                                                  ? 300
                                                  : 580
                                              : 820,
                                          //580 e 820
                                          child: Text(
                                            apresentationText,
                                            style: AppTextStyles.body.copyWith(
                                                color: Colors.white,
                                                fontSize: MediaQuery.of(context)
                                                            .size
                                                            .width <
                                                        1500
                                                    ? MediaQuery.of(context)
                                                                .size
                                                                .width <
                                                            900
                                                        ? 16
                                                        : 18
                                                    : 25),
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                CustomElevatedButtonWidget(
                                  title: '22 a 27 de Maio de 2023',
                                  textStyle: AppTextStyles.buttonBold.copyWith(
                                      color: Colors.white,
                                      fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width <
                                              1500
                                          ? MediaQuery.of(context).size.width <
                                                  900
                                              ? 20
                                              : 24
                                          : 40),
                                  widthSize:
                                      MediaQuery.of(context).size.width < 1500
                                          ? 320
                                          : 500,
                                  heightSize:
                                      MediaQuery.of(context).size.width < 900
                                          ? 40
                                          : 50,
                                  borderRadius: 40,
                                  backgroundColor: AppColors.brandingPurple,
                                  isClickable: false,
                                  onPressed: null,
                                ),
                                SizedBox(
                                    height:
                                        MediaQuery.of(context).size.width < 900
                                            ? 8
                                            : 16),
                                CustomElevatedButtonWidget(
                                  title: 'SAIBA MAIS >>>',
                                  textStyle: AppTextStyles.buttonBold.copyWith(
                                      color: Colors.white,
                                      fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width <
                                              1500
                                          ? MediaQuery.of(context).size.width <
                                                  900
                                              ? 20
                                              : 24
                                          : 40),
                                  widthSize: MediaQuery.of(context).size.width <
                                          1500
                                      ? MediaQuery.of(context).size.width < 900
                                          ? 200
                                          : 240
                                      : 340,
                                  heightSize:
                                      MediaQuery.of(context).size.width < 900
                                          ? 40
                                          : 50,
                                  borderRadius: 40,
                                  backgroundColor: AppColors.brandingOrange,
                                  onPressed: () {
                                    Modular.to.navigate('/home/home-more-info');
                                  },
                                )
                              ]),
                        ))))
          ],
        ),
      );
    } else {
      return Column(
        children: [
          Image(
            image: CachedNetworkImageProvider(
                '${previousEditionsBaseUrl}main_home.png'),
            fit: BoxFit.fitWidth,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
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
          const Padding(
            padding: EdgeInsets.only(left: 32, right: 32),
            child: Text(
              apresentationText,
              style: TextStyle(fontSize: 12),
              textAlign: TextAlign.justify,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            width: 200,
            height: 20,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.brandingOrange,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            child: Text(
              '22 a 27 de Maio',
              textAlign: TextAlign.center,
              style: AppTextStyles.buttonBold.copyWith(fontSize: 14),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  Modular.to.navigate('/home/home-more-info');
                },
                child: Container(
                  width: 200,
                  height: 20,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.brandingPurple,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Text(
                    'SAIBA MAIS >>>',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.buttonBold.copyWith(fontSize: 14),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }
  }
}
