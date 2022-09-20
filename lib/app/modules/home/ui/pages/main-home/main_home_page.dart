import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_web.dart';
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
                                ? 80
                                : 128,
                            bottom: 64),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextRenderer(
                                  child: Text('Semana Mauá de Inovação,',
                                      style: AppTextStyles.titleH1.copyWith(
                                          color: Colors.white,
                                          fontSize:
                                              MediaQuery.of(context).size.width <
                                                      1500
                                                  ? 40
                                                  : 55)),),
                                TextRenderer(
                                  child: Text('Liderança e Empreendedorismo',
                                      style: AppTextStyles.titleH1.copyWith(
                                          color: Colors.white,
                                          fontSize:
                                              MediaQuery.of(context).size.width <
                                                      1500
                                                  ? 40
                                                  : 55)),),
                                const SizedBox(
                                  height: 16,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width <
                                          1500
                                      ? 580
                                      : MediaQuery.of(context).size.width < 1500
                                          ? 700
                                          : 820,
                                  child: TextRenderer(
                                    child: Text(
                                      apresentationText,
                                      style: AppTextStyles.body.copyWith(
                                          color: Colors.white,
                                          fontSize:
                                              MediaQuery.of(context).size.width <
                                                      1500
                                                  ? 19
                                                  : MediaQuery.of(context)
                                                              .size
                                                              .width <
                                                          1500
                                                      ? 22
                                                      : 25),
                                      textAlign: TextAlign.justify,
                                    ),)
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
                                  child: TextRenderer(
                                    child: Text(
                                      '22 a 27 de Maio de 2023',
                                      textAlign: TextAlign.center,
                                      style: AppTextStyles.buttonBold.copyWith(
                                          fontSize:
                                              MediaQuery.of(context).size.width <
                                                      1500
                                                  ? 40
                                                  : MediaQuery.of(context)
                                                              .size
                                                              .width <
                                                          1500
                                                      ? 48
                                                      : 55),
                                    ),),
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                CustomElevatedButtonWidget(
                                  title: 'SAIBA MAIS >>>',
                                  textStyle: AppTextStyles.buttonBold.copyWith(
                                      color: Colors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.width <
                                                  1300
                                              ? 24
                                              : 30),
                                  paddingHorizontal:
                                      MediaQuery.of(context).size.width < 1300
                                          ? 8
                                          : 16,
                                  paddingVertical: 8,
                                  widthSize: 400,
                                  heightSize: 50,
                                  borderRadius: 20,
                                  backgroundColor: AppColors.brandingPurple,
                                  onPressed: () {
                                    Modular.to.navigate('/home/home-more-info');
                                  },
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
              child: TextRenderer(
                child: Text(
                  'Semana Mauá de Inovação, Liderança e Empreendedorismo',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 32, right: 32),
            child: TextRenderer(
              child: Text(
                apresentationText,
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.justify,
              ),),
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
            child: TextRenderer(
              child: Text(
                '22 a 27 de Maio',
                textAlign: TextAlign.center,
                style: AppTextStyles.buttonBold.copyWith(fontSize: 14),
              ),),
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
                  child: TextRenderer(
                    child: Text(
                      'SAIBA MAIS >>>',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.buttonBold.copyWith(fontSize: 14),
                    ),),
                ),
              ),
            ),
          ),
        ],
      );
    }
  }
}
