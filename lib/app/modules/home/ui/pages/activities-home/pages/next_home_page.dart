import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../shared/themes/app_text_styles.dart';

class NextHomePage extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  const NextHomePage(
      {Key? key,
      required this.title,
      required this.description,
      required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: CachedNetworkImageProvider(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 80, left: 32),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: AppTextStyles.titleH1.copyWith(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width < 1400
                              ? 48
                              : 55)),
                  if(MediaQuery.of(context).size.width > 900)
                  const SizedBox(
                    height: 16,
                  ),
                  if(MediaQuery.of(context).size.width > 900)
                  SizedBox(
                    width:
                        MediaQuery.of(context).size.width < 1400 ? 1000 : 1200,
                    child: Text(
                      description,
                      style: AppTextStyles.body.copyWith(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width < 1400
                              ? 14
                              : 22),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ]),
          ),
        ));
  }
}
