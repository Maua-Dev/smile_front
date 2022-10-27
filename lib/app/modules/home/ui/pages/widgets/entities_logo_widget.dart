import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/utils/s3_assets_url.dart';

class EntitiesWidget extends StatelessWidget {
  final ImageProvider logo;
  final String text;

  const EntitiesWidget({super.key, required this.logo, required this.text});

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
        child: Column(children: [
          Container(
            width: 268,
            height: 268,
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: const BorderRadius.all(Radius.circular(16))),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.contain,
                      alignment: Alignment.centerLeft,
                      image: CachedNetworkImageProvider(
                        atleticaLogoUrl,
                      ))),
            ),
          ),
          Text(text),
        ]),
      ),
    );
  }
}
