import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
                        image: CachedNetworkImageProvider(
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
                        style: AppTextStyles.titleH1
                            .copyWith(color: Colors.white, fontSize: 12),
                      ),
                    ),
                    Center(
                      child: Text(
                        localization,
                        style: AppTextStyles.body
                            .copyWith(color: Colors.white, fontSize: 12),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () =>
                            launch('https://g.page/IMT-instituto-maua?share'),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: Colors.white,
                              size: 16,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              'COMO CHEGAR',
                              style: AppTextStyles.body
                                  .copyWith(color: Colors.white, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
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
                        image: CachedNetworkImageProvider(
                            '${s3AssetsBaseUrl}full_logo_smile.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
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
                            fontSize: MediaQuery.of(context).size.width < 900
                                ? 14
                                : MediaQuery.of(context).size.width < 1350
                                    ? 16
                                    : 20),
                      ),
                    ),
                    Center(
                      child: Text(
                        localization,
                        style: AppTextStyles.body.copyWith(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width < 900
                                ? 14
                                : MediaQuery.of(context).size.width < 1350
                                    ? 16
                                    : 20),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () =>
                            launch('https://g.page/IMT-instituto-maua?share'),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              'COMO CHEGAR',
                              style: AppTextStyles.body.copyWith(
                                  color: Colors.white,
                                  fontSize: MediaQuery.of(context).size.width <
                                          900
                                      ? 14
                                      : MediaQuery.of(context).size.width < 1350
                                          ? 16
                                          : 20),
                            ),
                          ],
                        ),
                      ),
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
                    fontSize: MediaQuery.of(context).size.width < 800
                        ? 16
                        : MediaQuery.of(context).size.width < 1350
                            ? 24
                            : 28),
                children: [
                  TextSpan(
                    text: 'Dev. Community Mauá',
                    style: AppTextStyles.titleH1.copyWith(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width < 800
                            ? 16
                            : MediaQuery.of(context).size.width < 1350
                                ? 24
                                : 28),
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
