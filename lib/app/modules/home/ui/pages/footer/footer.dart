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
      padding: const EdgeInsets.only(right: 8, left: 16),
      decoration: BoxDecoration(color: AppColors.brandingPurple),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width < 500 ? null : 16,
          ),
          if (MediaQuery.of(context).size.width < 700)
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.height * 0.08,
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
                  height: 8,
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
                      height: 8,
                    ),
                    Center(
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: ElevatedButton.icon(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppColors.brandingOrange),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ))),
                          onPressed: () => launchUrl(
                            Uri.parse(
                                'https://g.page/IMT-instituto-maua?share'),
                            mode: LaunchMode.externalApplication,
                          ),
                          icon: const Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 15,
                          ),
                          label: Text(
                            'COMO CHEGAR',
                            style: AppTextStyles.body
                                .copyWith(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                const Divider(
                  indent: 10.0,
                  endIndent: 20.0,
                  thickness: 1,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 8,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: 'Em caso de dúvidas, enviar um e-mail para ',
                      style: AppTextStyles.body.copyWith(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                      children: [
                        TextSpan(
                          text: 'smile@maua.br',
                          style: AppTextStyles.titleH1
                              .copyWith(color: Colors.white, fontSize: 12),
                        ),
                        TextSpan(
                          text: ' ou ',
                          style: AppTextStyles.body.copyWith(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        TextSpan(
                          text: 'gti.central@maua.br',
                          style: AppTextStyles.titleH1
                              .copyWith(color: Colors.white, fontSize: 12),
                        ),
                        TextSpan(
                          text: ' ou ',
                          style: AppTextStyles.body.copyWith(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        TextSpan(
                          text: 'dev@maua.br',
                          style: AppTextStyles.titleH1
                              .copyWith(color: Colors.white, fontSize: 12),
                        ),
                        TextSpan(
                          text: '.',
                          style: AppTextStyles.body.copyWith(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ]),
                ),
                const SizedBox(
                  height: 2,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text:
                          'Caso queira falar conosco, entre em contato nos números: ',
                      style: AppTextStyles.body.copyWith(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                      children: [
                        TextSpan(
                          text: '4239-3002',
                          style: AppTextStyles.titleH1
                              .copyWith(color: Colors.white, fontSize: 12),
                        ),
                        TextSpan(
                          text: ', ',
                          style: AppTextStyles.body.copyWith(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        TextSpan(
                          text: '4239-3014',
                          style: AppTextStyles.titleH1
                              .copyWith(color: Colors.white, fontSize: 12),
                        ),
                        TextSpan(
                          text: ', ',
                          style: AppTextStyles.body.copyWith(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        TextSpan(
                          text: '4239-3441',
                          style: AppTextStyles.titleH1
                              .copyWith(color: Colors.white, fontSize: 12),
                        ),
                        TextSpan(
                          text: ', ',
                          style: AppTextStyles.body.copyWith(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        TextSpan(
                          text: '4239-3442',
                          style: AppTextStyles.titleH1
                              .copyWith(color: Colors.white, fontSize: 12),
                        ),
                        TextSpan(
                          text: ' ou ',
                          style: AppTextStyles.body.copyWith(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        TextSpan(
                          text: '4239-3411',
                          style: AppTextStyles.titleH1
                              .copyWith(color: Colors.white, fontSize: 12),
                        ),
                        TextSpan(
                          text: '.',
                          style: AppTextStyles.body.copyWith(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ]),
                ),
              ],
            )
          else
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width < 700
                      ? MediaQuery.of(context).size.width * 0.45
                      : MediaQuery.of(context).size.width * 0.35,
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
                  width: 16,
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
                      child: ElevatedButton.icon(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 16)),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                AppColors.brandingOrange),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ))),
                        onPressed: () => launchUrl(
                          Uri.parse('https://g.page/IMT-instituto-maua?share'),
                          mode: LaunchMode.externalApplication,
                        ),
                        icon: const Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                        label: Text(
                          'COMO CHEGAR',
                          style: AppTextStyles.body.copyWith(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.width < 900
                                  ? 14
                                  : MediaQuery.of(context).size.width < 1350
                                      ? 16
                                      : 20),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width:
                          MediaQuery.of(context).size.width < 1350 ? 300 : 400,
                      child: RichText(
                        text: TextSpan(
                            text: 'Em caso de dúvidas, enviar um e-mail para ',
                            style: AppTextStyles.body.copyWith(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                            children: [
                              TextSpan(
                                text: 'smile@maua.br',
                                style: AppTextStyles.titleH1.copyWith(
                                    color: Colors.white, fontSize: 12),
                              ),
                              TextSpan(
                                text: ' ou ',
                                style: AppTextStyles.body.copyWith(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                              TextSpan(
                                text: 'gti.central@maua.br',
                                style: AppTextStyles.titleH1.copyWith(
                                    color: Colors.white, fontSize: 12),
                              ),
                              TextSpan(
                                text: ' ou ',
                                style: AppTextStyles.body.copyWith(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                              TextSpan(
                                text: 'dev@maua.br',
                                style: AppTextStyles.titleH1.copyWith(
                                    color: Colors.white, fontSize: 12),
                              ),
                              TextSpan(
                                text: '.',
                                style: AppTextStyles.body.copyWith(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ]),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    SizedBox(
                      width:
                          MediaQuery.of(context).size.width < 1350 ? 300 : 400,
                      child: RichText(
                        text: TextSpan(
                            text:
                                'Caso queira falar conosco, entre em contato nos números: ',
                            style: AppTextStyles.body.copyWith(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                            children: [
                              TextSpan(
                                text: '4239-3002',
                                style: AppTextStyles.titleH1.copyWith(
                                    color: Colors.white, fontSize: 12),
                              ),
                              TextSpan(
                                text: ', ',
                                style: AppTextStyles.body.copyWith(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                              TextSpan(
                                text: '4239-3014',
                                style: AppTextStyles.titleH1.copyWith(
                                    color: Colors.white, fontSize: 12),
                              ),
                              TextSpan(
                                text: ', ',
                                style: AppTextStyles.body.copyWith(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                              TextSpan(
                                text: '4239-3441',
                                style: AppTextStyles.titleH1.copyWith(
                                    color: Colors.white, fontSize: 12),
                              ),
                              TextSpan(
                                text: ', ',
                                style: AppTextStyles.body.copyWith(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                              TextSpan(
                                text: '4239-3442',
                                style: AppTextStyles.titleH1.copyWith(
                                    color: Colors.white, fontSize: 12),
                              ),
                              TextSpan(
                                text: ' ou ',
                                style: AppTextStyles.body.copyWith(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                              TextSpan(
                                text: '4239-3411',
                                style: AppTextStyles.titleH1.copyWith(
                                    color: Colors.white, fontSize: 12),
                              ),
                              TextSpan(
                                text: '.',
                                style: AppTextStyles.body.copyWith(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          const SizedBox(
            height: 16,
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
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
