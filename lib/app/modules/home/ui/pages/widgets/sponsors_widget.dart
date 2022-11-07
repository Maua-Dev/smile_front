import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../shared/themes/app_colors.dart';
import '../../../../../shared/utils/screen_helper.dart';

class SponsorsWidget extends StatelessWidget {
  const SponsorsWidget({super.key, required this.link, required this.color});

  final String link;
  final Color color;

  @override
  Widget build(BuildContext context) {
    double height = Screen.width(context) > 900
        ? 278
        : Screen.width(context) > 500
            ? 278 * (Screen.width(context) / 900)
            : 170;
    double widht = Screen.width(context) > 900
        ? 268
        : Screen.width(context) > 500
            ? 268 * (Screen.width(context) / 900)
            : 160;

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
            height: height,
            width: widht,
            decoration: BoxDecoration(
                color: AppColors.brandingBlue,
                borderRadius: BorderRadius.circular(16))),
        Container(
            height: height * 0.87,
            width: widht * 0.87,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadiusDirectional.circular(16),
            )),
        Container(
            height: height * 0.783,
            width: widht * 0.783,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: CachedNetworkImageProvider(link),
                    fit: BoxFit.scaleDown)))
      ],
    );
  }
}
