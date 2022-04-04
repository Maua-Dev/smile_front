import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

import '../../../../../../shared/utils/s3_assets_url.dart';
import '../../../../utils/text_utils.dart';

class FirstHomePage extends StatefulWidget {
  const FirstHomePage({Key? key}) : super(key: key);

  @override
  _FirstHomePageState createState() => _FirstHomePageState();
}

class _FirstHomePageState extends State<FirstHomePage> {
  @override
  Widget build(BuildContext context) {
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
                    right: MediaQuery.of(context).size.width < 1500 ? 64 : 128,
                    bottom: 64),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Semana Mauá de Inovação,',
                            style: AppTextStyles.titleH1.copyWith(
                                color: Colors.white,
                                fontSize: MediaQuery.of(context).size.width <
                                        1500
                                    ? 40
                                    : MediaQuery.of(context).size.width < 1500
                                        ? 48
                                        : 55)),
                        Text('Liderança e Empreendedorismo',
                            style: AppTextStyles.titleH1.copyWith(
                                color: Colors.white,
                                fontSize: MediaQuery.of(context).size.width <
                                        1500
                                    ? 40
                                    : MediaQuery.of(context).size.width < 1500
                                        ? 48
                                        : 55)),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width < 1500
                              ? 560
                              : MediaQuery.of(context).size.width < 1500
                                  ? 680
                                  : 800,
                          child: Text(
                            apresentationText,
                            style: AppTextStyles.body.copyWith(
                                color: Colors.white,
                                fontSize: MediaQuery.of(context).size.width <
                                        1500
                                    ? 19
                                    : MediaQuery.of(context).size.width < 1500
                                        ? 22
                                        : 25),
                            textAlign: TextAlign.start,
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
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Text(
                            '16 a 21 de Maio',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.buttonBold.copyWith(
                                fontSize: MediaQuery.of(context).size.width <
                                        1500
                                    ? 40
                                    : MediaQuery.of(context).size.width < 1500
                                        ? 48
                                        : 55),
                          ),
                        ),
                      ]),
                ),
              )),
        ),
      ],
    );
  }
}
