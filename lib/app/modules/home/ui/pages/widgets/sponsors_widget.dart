import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../shared/helpers/utils/screen_helper.dart';

class SponsorsWidget extends StatelessWidget {
  const SponsorsWidget(
      {super.key, required this.link, required this.color, required this.size});

  final String link;
  final Color color;
  final num size;

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

    return Stack(
      children: [
        Container(
            height: height * size,
            width: widht * size,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: CachedNetworkImageProvider(link),
                    fit: BoxFit.scaleDown)))
      ],
    );
  }
}
