import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../shared/utils/screen_helper.dart';
import '../../../domain/infra/maua_entities_enum.dart';

class EntitiesWidget extends StatelessWidget {
  final MauaEntitiesEnum entity;

  const EntitiesWidget({
    super.key,
    required this.entity,
  });

  @override
  Widget build(BuildContext context) {
    double height = Screen.width(context) > 900
        ? 320
        : Screen.width(context) > 500
            ? 278 * (Screen.width(context) / 900)
            : 170;
    double widht = Screen.width(context) > 900
        ? 320
        : Screen.width(context) > 500
            ? 268 * (Screen.width(context) / 900)
            : 160;

    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Container(
        height: height * 0.615,
        width: widht * 0.615,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: CachedNetworkImageProvider(
            entity.logoUrl,
          ))),
        ),
      ),
      Stack(
        alignment: Alignment.centerLeft,
        children: [
          InkWell(
            onTap: () => launchUrl(
              Uri.parse(entity.logoUrl),
              mode: LaunchMode.externalApplication,
            ),
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width < 500
                  ? 130
                  : MediaQuery.of(context).size.width < 1200
                      ? 180
                      : 220,
              height: MediaQuery.of(context).size.width < 500
                  ? 24
                  : MediaQuery.of(context).size.width < 1200
                      ? 28
                      : 34,
              decoration: BoxDecoration(
                  color: AppColors.brandingBlue,
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width < 1200 ? 16 : 26,
                    0,
                    0,
                    2),
                child: Text(entity.name,
                    style: AppTextStyles.buttonBold.copyWith(
                      fontSize: MediaQuery.of(context).size.width < 500
                          ? 9.5
                          : MediaQuery.of(context).size.width < 1200
                              ? 13
                              : 16,
                      fontWeight: FontWeight.w700,
                    )),
              ),
            ),
          ),
          InkWell(
            onTap: () => launchUrl(
              Uri.parse(entity.logoUrl),
              mode: LaunchMode.externalApplication,
            ),
            child: Container(
                width: MediaQuery.of(context).size.width < 500
                    ? 30
                    : MediaQuery.of(context).size.width < 1200
                        ? 34
                        : 40,
                height: MediaQuery.of(context).size.width < 500
                    ? 30
                    : MediaQuery.of(context).size.width < 1200
                        ? 34
                        : 40,
                decoration: BoxDecoration(
                    color: AppColors.brandingBlue, shape: BoxShape.circle),
                child: Icon(FontAwesome5.instagram,
                    size: MediaQuery.of(context).size.width < 500
                        ? 18
                        : MediaQuery.of(context).size.width < 1200
                            ? 20
                            : 26,
                    color: Colors.white)),
          )
        ],
      )
    ]);
  }
}
