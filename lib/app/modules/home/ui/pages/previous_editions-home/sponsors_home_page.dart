import 'package:flutter/material.dart';
import 'package:smile_front/app/shared/utils/s3_assets_url.dart';

import '../../../../../shared/themes/app_colors.dart';
import '../../../../../shared/themes/app_text_styles.dart';
import '../../../../../shared/widgets/text-header/text_header.dart';
import '../../../utils/text_utils.dart';

class SponsorsHomePage extends StatefulWidget {
  const SponsorsHomePage({Key? key}) : super(key: key);

  @override
  _SponsorsHomePageState createState() => _SponsorsHomePageState();
}

class _SponsorsHomePageState extends State<SponsorsHomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        children: [
          TextHeader(
            title: 'Patrocinadores',
            leftPadding: 32,
            color: AppColors.brandingPurple,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.15,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          NetworkImage('${s3AssetsBaseUrl}advantech_logo.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          TextHeader(
            title: 'Criado e desenvolvido por Dev. Community',
            leftPadding: 32,
            color: AppColors.brandingPurple,
            fontSize: 28,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            NetworkImage('${s3AssetsBaseUrl}full_logo_dev.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    devPresentation,
                    textAlign: TextAlign.justify,
                    style: AppTextStyles.body.copyWith(
                        color: Colors.black,
                        fontSize:
                            MediaQuery.of(context).size.width < 1350 ? 16 : 20),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            decoration: BoxDecoration(color: AppColors.brandingPurple),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: MediaQuery.of(context).size.height * 0.12,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                '${s3AssetsBaseUrl}full_logo_smile.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          localizationTitle,
                          style: AppTextStyles.titleH1.copyWith(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.width < 1350
                                  ? 16
                                  : 20),
                        ),
                        Text(
                          localization,
                          style: AppTextStyles.body.copyWith(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.width < 1350
                                  ? 16
                                  : 20),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          'COMO CHEGAR',
                          style: AppTextStyles.body.copyWith(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.width < 1350
                                  ? 16
                                  : 20),
                        ),
                      ],
                    ),
                  ],
                ),
                RichText(
                  text: TextSpan(
                      text: 'Desenvolvido por ',
                      style: AppTextStyles.body.copyWith(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width < 1350
                              ? 24
                              : 28),
                      children: [
                        TextSpan(
                          text: 'Dev. Community Mauá',
                          style: AppTextStyles.titleH1.copyWith(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.width < 1350
                                  ? 24
                                  : 28),
                        )
                      ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
