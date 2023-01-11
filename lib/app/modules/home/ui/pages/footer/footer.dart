import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smile_front/app/modules/home/ui/pages/widgets/social_media_icons_widget.dart';
import 'package:smile_front/app/shared/entities/screen_variables.dart';
import 'package:smile_front/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../shared/themes/app_colors.dart';
import '../../../../../shared/themes/app_text_styles.dart';
import '../../../../../shared/utils/s3_assets_url.dart';
import '../../../../../shared/utils/screen_helper.dart';
import '../../../utils/text_utils.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 8, left: 16),
      decoration: BoxDecoration(color: AppColors.brandingBlue),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: Screen.width(context) < 500 ? null : 16,
          ),
          if (Screen.width(context) < cellphoneSize)
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(smile2023LogoUrl),
                      fit: BoxFit.contain,
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
                      height: 8,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SocialMediaWidget(),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: ElevatedButton.icon(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
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
                                S.of(context).footerHowToGet.toUpperCase(),
                                style: AppTextStyles.body.copyWith(
                                    color: Colors.white,
                                    fontSize:
                                        Screen.width(context) < cellphoneSize
                                            ? 12
                                            : 24),
                              ),
                            ),
                          ),
                        ],
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
                      text: S.of(context).footerDoubtContact('normalPart1'),
                      style: AppTextStyles.body.copyWith(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                      children: [
                        TextSpan(
                          text: S.of(context).footerDoubtContact('boldPart1'),
                          style: AppTextStyles.body
                              .copyWith(color: Colors.white, fontSize: 12),
                        ),
                        TextSpan(
                          text: S.of(context).footerDoubtContact('normalPart2'),
                          style: AppTextStyles.body.copyWith(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        TextSpan(
                          text: S.of(context).footerDoubtContact('boldPart2'),
                          style: AppTextStyles.body
                              .copyWith(color: Colors.white, fontSize: 12),
                        ),
                        TextSpan(
                          text: S.of(context).footerDoubtContact('normalPart3'),
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
                      text: S.of(context).footerContact('normalPart1'),
                      style: AppTextStyles.body.copyWith(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                      children: [
                        TextSpan(
                          text: S.of(context).footerContact('boldPart1'),
                          style: AppTextStyles.body.copyWith(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: S.of(context).footerContact('normalPart2'),
                          style: AppTextStyles.body.copyWith(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        TextSpan(
                          text: S.of(context).footerContact('boldPart2'),
                          style: AppTextStyles.body.copyWith(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: S.of(context).footerContact('normalPart3'),
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
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        S.of(context).footerSocialMedia,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.body.copyWith(
                            color: Colors.white,
                            fontSize:
                                Screen.width(context) < tabletSize ? 16 : 20),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const SocialMediaWidget(),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          Screen.width(context) < tabletSize ? 38 : 128),
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(smile2023LogoUrl),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        localizationTitle,
                        style: AppTextStyles.titleH1.copyWith(
                            color: Colors.white,
                            fontSize:
                                Screen.width(context) < tabletSize ? 16 : 20),
                      ),
                      Text(
                        localization,
                        style: AppTextStyles.body.copyWith(
                            color: Colors.white,
                            fontSize:
                                Screen.width(context) < tabletSize ? 16 : 20),
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
                          ),
                          label: Text(
                            S.of(context).footerHowToGet.toUpperCase(),
                            style: AppTextStyles.body.copyWith(
                                color: Colors.white,
                                fontSize: Screen.width(context) < tabletSize
                                    ? 16
                                    : 20),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      RichText(
                        text: TextSpan(
                            text:
                                S.of(context).footerDoubtContact('normalPart1'),
                            style: AppTextStyles.body.copyWith(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                            children: [
                              TextSpan(
                                text: S
                                    .of(context)
                                    .footerDoubtContact('boldPart1'),
                                style: AppTextStyles.body.copyWith(
                                    color: Colors.white, fontSize: 12),
                              ),
                              TextSpan(
                                text: S
                                    .of(context)
                                    .footerDoubtContact('normalPart2'),
                                style: AppTextStyles.body.copyWith(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                              TextSpan(
                                text: S
                                    .of(context)
                                    .footerDoubtContact('boldPart2'),
                                style: AppTextStyles.body.copyWith(
                                    color: Colors.white, fontSize: 12),
                              ),
                              TextSpan(
                                text: S
                                    .of(context)
                                    .footerDoubtContact('normalPart3'),
                                style: AppTextStyles.body.copyWith(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ]),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      RichText(
                        text: TextSpan(
                            text: S.of(context).footerContact('normalPart1'),
                            style: AppTextStyles.body.copyWith(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                            children: [
                              TextSpan(
                                text: S.of(context).footerContact('boldPart1'),
                                style: AppTextStyles.body.copyWith(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text:
                                    S.of(context).footerContact('normalPart2'),
                                style: AppTextStyles.body.copyWith(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                              TextSpan(
                                text: S.of(context).footerContact('boldPart2'),
                                style: AppTextStyles.body.copyWith(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
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
                  ),
                ),
              ],
            ),
          const SizedBox(
            height: 16,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: S.of(context).footerDev('normalPart'),
                style: AppTextStyles.body.copyWith(
                    color: Colors.white,
                    fontSize: Screen.width(context) < cellphoneSize
                        ? 16
                        : Screen.width(context) < tabletSize
                            ? 24
                            : 28),
                children: [
                  TextSpan(
                    text: S.of(context).footerDev('boldPart'),
                    style: AppTextStyles.titleH1.copyWith(
                        color: Colors.white,
                        fontSize: Screen.width(context) < cellphoneSize
                            ? 16
                            : Screen.width(context) < tabletSize
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
