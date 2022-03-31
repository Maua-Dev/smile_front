import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

import '../../../../infra/models/home_speaker_model.dart';

class MainSpeakersCard extends StatelessWidget {
  final List<HomeSpeakerModel> speakers;
  final int indexToShow;
  final Function toggleIndex;

  const MainSpeakersCard({
    Key? key,
    required this.speakers,
    required this.indexToShow,
    required this.toggleIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(38),
              color: AppColors.brandingPurple,
            ),
            height: MediaQuery.of(context).size.height * 0.65,
            width: MediaQuery.of(context).size.width * 0.7,
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.12,
                          height: MediaQuery.of(context).size.width * 0.12,
                          child: CircleAvatar(
                            radius: 102.0,
                            backgroundImage: CachedNetworkImageProvider(
                                speakers[indexToShow]
                                    .linkPhoto!), // for Network image
                          ),
                        ),
                        const SizedBox(
                          width: 32,
                        ),
                        Text(
                          speakers.isNotEmpty
                              ? '${speakers[indexToShow].name} - ${speakers[indexToShow].date}'
                              : '',
                          style: AppTextStyles.titleH1.copyWith(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.width < 1600
                                  ? 48
                                  : 60),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      speakers.isNotEmpty ? speakers[indexToShow].bio : '',
                      style: AppTextStyles.body.copyWith(color: Colors.white),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(38),
              color: AppColors.lightPurple,
            ),
            height: MediaQuery.of(context).size.height * 0.65,
            width: MediaQuery.of(context).size.width * 0.8,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: speakers.length,
              itemBuilder: (context, index) {
                final item = speakers[index];
                return Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 8, horizontal: index == indexToShow ? 16 : 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: index == indexToShow &&
                                MediaQuery.of(context).size.width < 1600
                            ? MediaQuery.of(context).size.height * 0.11
                            : index == indexToShow
                                ? MediaQuery.of(context).size.width * 0.09
                                : MediaQuery.of(context).size.width < 1600
                                    ? MediaQuery.of(context).size.height * 0.08
                                    : MediaQuery.of(context).size.height * 0.1,
                        height: index == indexToShow &&
                                MediaQuery.of(context).size.width < 1600
                            ? MediaQuery.of(context).size.height * 0.11
                            : index == indexToShow
                                ? MediaQuery.of(context).size.width * 0.09
                                : MediaQuery.of(context).size.width < 1600
                                    ? MediaQuery.of(context).size.height * 0.08
                                    : MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: AppColors.brandingOrange,
                            width: 3.5,
                          ),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            toggleIndex(index);
                          },
                          child: Container(
                              width: index == indexToShow &&
                                      MediaQuery.of(context).size.width < 1600
                                  ? MediaQuery.of(context).size.height * 0.11
                                  : index == indexToShow
                                      ? MediaQuery.of(context).size.width * 0.09
                                      : MediaQuery.of(context).size.width < 1600
                                          ? MediaQuery.of(context).size.height *
                                              0.08
                                          : MediaQuery.of(context).size.height *
                                              0.1,
                              height: index == indexToShow &&
                                      MediaQuery.of(context).size.width < 1600
                                  ? MediaQuery.of(context).size.height * 0.11
                                  : index == indexToShow
                                      ? MediaQuery.of(context).size.width * 0.09
                                      : MediaQuery.of(context).size.width < 1600
                                          ? MediaQuery.of(context).size.height *
                                              0.08
                                          : MediaQuery.of(context).size.height *
                                              0.1,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    alignment: Alignment.center,
                                    image: NetworkImage(item.linkPhoto!),
                                  ))),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
