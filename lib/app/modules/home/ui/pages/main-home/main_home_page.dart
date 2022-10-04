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
                                ? 0
                                : 128,
                            bottom: 64),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.brandingPurple,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
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
                                                            ? 40
                                                            : 55)),
                                        Text('Liderança e Empreendedorismo',
                                            style: AppTextStyles.titleH1
                                                .copyWith(
                                                    color: Colors.white,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                    .size
                                                                    .width <
                                                                1500
                                                            ? 40
                                                            : 55)),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                      .size
                                                      .width <
                                                  1500
                                              ? 580
                                              : MediaQuery.of(context)
                                                          .size
                                                          .width <
                                                      1500
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
                                                    : MediaQuery.of(context)
                                                                .size
                                                                .width <
                                                            1500
                                                        ? 22
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
                                SizedBox(
                                  width: MediaQuery.of(context).size.width <
                                          1500
                                      ? 700
                                      : MediaQuery.of(context).size.width < 1500
                                          ? 900
                                          : 900,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width <
                                                    1500
                                                ? 300
                                                : MediaQuery.of(context)
                                                            .size
                                                            .width <
                                                        1500
                                                    ? 450
                                                    : 500,
                                        height: 50,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: AppColors.brandingPurple,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                        child: Text(
                                          '22 a 27 de Maio de 2023',
                                          textAlign: TextAlign.center,
                                          style: AppTextStyles.buttonBold
                                              .copyWith(
                                                  fontSize: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width <
                                                          1500
                                                      ? 24
                                                      : MediaQuery.of(context)
                                                                  .size
                                                                  .width <
                                                              1500
                                                          ? 48
                                                          : 40),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 40,
                                      ),
                                      CustomElevatedButtonWidget(
                                        title: 'SAIBA MAIS >>>',
                                        textStyle: AppTextStyles.buttonBold
                                            .copyWith(
                                                color: Colors.white,
                                                fontSize: MediaQuery.of(context)
                                                            .size
                                                            .width <
                                                        1500
                                                    ? 24
                                                    : 32),
                                        paddingHorizontal:
                                            MediaQuery.of(context).size.width <
                                                    1300
                                                ? 8
                                                : 16,
                                        paddingVertical: 8,
                                        widthSize:
                                            MediaQuery.of(context).size.width <
                                                    1500
                                                ? 240
                                                : MediaQuery.of(context)
                                                            .size
                                                            .width <
                                                        1500
                                                    ? 300
                                                    : 300,
                                        heightSize: 50,
                                        borderRadius: 20,
                                        backgroundColor:
                                            AppColors.brandingOrange,
                                        onPressed: () {
                                          Modular.to
                                              .navigate('/home/home-more-info');
                                        },
                                      )
                                    ],
                                  ),
                                ),
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
