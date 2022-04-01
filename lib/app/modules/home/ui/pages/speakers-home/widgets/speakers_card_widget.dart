// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';

import '../../../../../../shared/themes/app_text_styles.dart';

class SpeakersCardWidget extends StatelessWidget {
  final String socialName;
  final String bio;
  final String linkPhoto;
  final bool isEven;
  const SpeakersCardWidget(
      {Key? key,
      required this.socialName,
      required this.bio,
      required this.linkPhoto,
      required this.isEven})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isEven) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  socialName,
                  style: AppTextStyles.buttonBold.copyWith(
                      color: AppColors.brandingPurple,
                      fontSize:
                          MediaQuery.of(context).size.width < 1400 ? 24 : 30),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 232),
                  child: Text(
                    bio,
                    textAlign: TextAlign.right,
                    style: AppTextStyles.body.copyWith(
                        color: Colors.black,
                        fontSize:
                            MediaQuery.of(context).size.width < 1600 ? 20 : 24),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 32,
          ),
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    alignment: Alignment.centerLeft,
                    image: NetworkImage(
                      linkPhoto,
                    ))),
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    alignment: Alignment.centerLeft,
                    image: NetworkImage(
                      linkPhoto,
                    ))),
          ),
          const SizedBox(
            width: 32,
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  socialName,
                  style: AppTextStyles.buttonBold.copyWith(
                      color: AppColors.brandingPurple,
                      fontSize:
                          MediaQuery.of(context).size.width < 1400 ? 24 : 30),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 232),
                  child: Text(
                    bio,
                    style: AppTextStyles.body.copyWith(
                        color: Colors.black,
                        fontSize:
                            MediaQuery.of(context).size.width < 1600 ? 18 : 22),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }
  }
}
