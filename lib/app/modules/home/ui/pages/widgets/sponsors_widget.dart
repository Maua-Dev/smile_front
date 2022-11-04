import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smile_front/app/shared/utils/s3_assets_url.dart';

import '../../../../../shared/themes/app_colors.dart';

class SponsorsWidget extends StatelessWidget {
  const SponsorsWidget({super.key, required this.link, required this.color});

  final String link;
  final Color color;

  static double height = 288;
  static double widht = 268;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
            height: height,
            width: widht,
            decoration: BoxDecoration(
                color: AppColors.brandingPurple,
                borderRadius: BorderRadius.circular(16))),
        Container(
            height: height * 0.87,
            width: widht * 0.87,
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadiusDirectional.circular(16),
                image:
                    DecorationImage(image: CachedNetworkImageProvider(link))))
      ],
    );
  }
}
