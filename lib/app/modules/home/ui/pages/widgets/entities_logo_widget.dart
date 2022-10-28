import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';
import 'package:smile_front/app/shared/utils/s3_assets_url.dart';
import 'package:url_launcher/url_launcher.dart';

class EntitiesWidget extends StatelessWidget {
  final ImageProvider logo;
  final String text;
  final String url;

  const EntitiesWidget(
      {super.key, required this.logo, required this.text, required this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        width: 336,
        height: 388,
        decoration: BoxDecoration(
            color: AppColors.brandingOrange,
            borderRadius: const BorderRadius.all(Radius.circular(16))),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
            width: 288,
            height: 268,
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: const BorderRadius.all(Radius.circular(16))),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.contain,
                      image: CachedNetworkImageProvider(
                        mauajrLogoUrl,
                      ))),
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              InkWell(
                onTap: () => launchUrl(
                  Uri.parse(url),
                  mode: LaunchMode.externalApplication,
                ),
                child: Container(
                  alignment: Alignment.center,
                  width: 290,
                  height: 40,
                  decoration: BoxDecoration(
                      color: AppColors.brandingPurple,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 4),
                    child: Text(text,
                        style: AppTextStyles.buttonBold.copyWith(fontSize: 20)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 250),
                child: InkWell(
                  onTap: () => launchUrl(
                    Uri.parse("https://www.instagram.com/smilemaua/"),
                    mode: LaunchMode.externalApplication,
                  ),
                  child: Container(
                      width: 50,
                      height: 70,
                      decoration: BoxDecoration(
                          color: AppColors.brandingPurple,
                          shape: BoxShape.circle),
                      child: const Icon(FontAwesome5.instagram,
                          size: 30, color: Colors.white)),
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}


//Stack(
 //           alignment: Alignment.centerLeft,
 //           children: [
 //             Container(
 //               width: 50,
 //               height: 70,
  //              decoration: BoxDecoration(
  //                  color: AppColors.brandingPurple,
  //                  shape: BoxShape.circle),
  //            ),
  //            Container(
  //              width: 250,
  //              height: 40,
 //               decoration: BoxDecoration(
 //                   color: AppColors.brandingPurple,
 //                   borderRadius:
 //                       const BorderRadius.all(Radius.circular(20))),
 //             ),
 //           ],
  //        )