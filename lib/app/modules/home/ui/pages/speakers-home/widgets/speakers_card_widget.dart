// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../shared/themes/app_text_styles.dart';

class SpeakersCardWidget extends StatelessWidget {
  final String linkPhoto;
  final String name;
  final void Function()? onTap;
  final int myIndex;
  final int indexToShow;
  const SpeakersCardWidget({
    Key? key,
    required this.linkPhoto,
    this.onTap,
    required this.myIndex,
    required this.indexToShow,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Padding(
        padding: EdgeInsets.only(
            right: MediaQuery.of(context).size.width < 1500 ? 16 : 32),
        child: GestureDetector(
          onTap: onTap,
          child: Column(
            children: [
              Container(
                  width: indexToShow == myIndex
                      ? (MediaQuery.of(context).size.width < 500
                          ? 100
                          : MediaQuery.of(context).size.width < 1100
                              ? 150
                              : MediaQuery.of(context).size.width < 1380
                                  ? 180
                                  : MediaQuery.of(context).size.width < 1750
                                      ? 200
                                      : 220)
                      : (MediaQuery.of(context).size.width < 500
                          ? 80
                          : MediaQuery.of(context).size.width < 1100
                              ? 120
                              : MediaQuery.of(context).size.width < 1380
                                  ? 150
                                  : MediaQuery.of(context).size.width < 1750
                                      ? 180
                                      : 200),
                  height: indexToShow == myIndex
                      ? (MediaQuery.of(context).size.width < 500
                          ? 100
                          : MediaQuery.of(context).size.width < 1100
                              ? 150
                              : MediaQuery.of(context).size.width < 1380
                                  ? 180
                                  : MediaQuery.of(context).size.width < 1750
                                      ? 200
                                      : 220)
                      : (MediaQuery.of(context).size.width < 500
                          ? 80
                          : MediaQuery.of(context).size.width < 1100
                              ? 120
                              : MediaQuery.of(context).size.width < 1380
                                  ? 150
                                  : MediaQuery.of(context).size.width < 1750
                                      ? 180
                                      : 200),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(linkPhoto)))),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
