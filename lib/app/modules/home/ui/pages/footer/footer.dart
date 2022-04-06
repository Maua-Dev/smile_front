import 'package:flutter/material.dart';

import '../../../../../shared/themes/app_colors.dart';
import '../../../../../shared/themes/app_text_styles.dart';
import '../../../../../shared/utils/s3_assets_url.dart';
import '../../../utils/text_utils.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.31,
      decoration: BoxDecoration(color: AppColors.brandingPurple),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (MediaQuery.of(context).size.width < 500)
            Column(
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
                    Center(
                      child: Text(
                        localizationTitle,
                        style: AppTextStyles.titleH1.copyWith(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width < 1350
                                ? 16
                                : 20),
                      ),
                    ),
                    Center(
                      child: Text(
                        localization,
                        style: AppTextStyles.body.copyWith(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width < 1350
                                ? 16
                                : 20),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.white,
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
              ],
            )
          else
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
                    Center(
                      child: Text(
                        localizationTitle,
                        style: AppTextStyles.titleH1.copyWith(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width < 1350
                                ? 16
                                : 20),
                      ),
                    ),
                    Center(
                      child: Text(
                        localization,
                        style: AppTextStyles.body.copyWith(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width < 1350
                                ? 16
                                : 20),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.white,
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
              ],
            ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: 'Desenvolvido por ',
                style: AppTextStyles.body.copyWith(
                    color: Colors.white,
                    fontSize:
                        MediaQuery.of(context).size.width < 1350 ? 24 : 28),
                children: [
                  TextSpan(
                    text: 'Dev. Community Mauá',
                    style: AppTextStyles.titleH1.copyWith(
                        color: Colors.white,
                        fontSize:
                            MediaQuery.of(context).size.width < 1350 ? 24 : 28),
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
