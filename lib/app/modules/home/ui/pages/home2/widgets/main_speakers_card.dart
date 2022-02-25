import 'package:flutter/material.dart';
import 'package:smile_front/app/modules/home/domain/entities/speaker.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';

class MainSpeakersCard extends StatelessWidget {
  final List<Speaker> speakers;
  final int indexToShow;
  final Function toggleIndex;

  const MainSpeakersCard({
    Key? key,
    required this.speakers,
    required this.indexToShow,
    required this.toggleIndex,
  }) : super(key: key);

  double cardTitleFontSize(size, height) {
    if (size <= 1920 && size >= 1760) {
      if (height < 1080 && height >= 810) return 88;
      if (height < 810 && height >= 720) return 78;
      return 68;
    }
    if (size < 1760 && size >= 1600) {
      if (height < 1080 && height >= 810) return 80;
      if (height < 810 && height >= 720) return 72;
      return 60;
    }
    if (size < 1600 && size >= 1440) {
      if (height < 1080 && height >= 810) return 72;
      if (height < 810 && height >= 720) return 64;
      return 56;
    }
    if (size < 1440 && size >= 1280) {
      if (height < 1080 && height >= 810) return 59;
      if (height < 810 && height >= 720) return 52;
      return 45;
    }
    if (size < 1280 && size >= 1120) {
      if (height < 1080 && height >= 810) return 66;
      if (height < 810 && height >= 720) return 54;
      return 45;
    }
    if (size < 1120 && size >= 960) {
      if (height < 1080 && height >= 810) return 60;
      if (height < 810 && height >= 720) return 50;
      return 45;
    }
    return 45;
  }

  double cardTextFontSize(size, height) {
    if (size <= 1920 && size >= 1760) {
      if (height < 1080 && height >= 990) return 31;
      if (height < 990 && height >= 900) return 29;
      if (height < 900 && height >= 810) return 27;
      if (height < 810 && height >= 720) return 25;
      return 22;
    }
    if (size < 1760 && size >= 1600) {
      if (height < 1080 && height >= 990) return 31;
      if (height < 990 && height >= 900) return 29;
      if (height < 900 && height >= 810) return 27;
      if (height < 810 && height >= 720) return 25;
      return 22;
    }
    if (size < 1600 && size >= 1440) {
      if (height < 1080 && height >= 990) return 29;
      if (height < 990 && height >= 900) return 27;
      if (height < 900 && height >= 810) return 25;
      if (height < 810 && height >= 720) return 23;
      return 20;
    }
    if (size < 1440 && size >= 1280) {
      if (height < 1080 && height >= 990) return 26;
      if (height < 990 && height >= 900) return 24;
      if (height < 900 && height >= 810) return 22;
      return 20;
    }
    if (size < 1280 && size >= 1120) {
      if (height < 1080 && height >= 990) return 36;
      if (height < 990 && height >= 900) return 33;
      if (height < 900 && height >= 810) return 30;
      if (height < 810 && height >= 720) return 27;
      return 24;
    }
    if (size < 1120 && size >= 960) {
      if (height < 1080 && height >= 990) return 32;
      if (height < 990 && height >= 900) return 29;
      if (height < 900 && height >= 810) return 26;
      if (height < 810 && height >= 720) return 23;
      return 22;
    }
    return 18;
  }

  double circleImageSize(size) {
    if (size <= 1920 && size >= 1280) {
      return 330;
    }
    if (size < 1280 && size >= 840) {
      return 302;
    }
    return 364;
  }

  double cardWithTextWidth(size) {
    if (size < 1280) {
      return size * 0.65;
    }
    return size * 0.6;
  }

  double smallCircleImageSize(height) {
    if (height < 1080 && height >= 990) return 68;
    if (height < 990 && height >= 900) return 60;
    if (height < 900 && height >= 810) return 52;
    if (height < 810 && height >= 720) return 46;
    if (height < 720 && height >= 630) return 40;
    return 60;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(38),
            color: AppColors.brandingBlue,
          ),
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width * 0.7,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(38),
            color: AppColors.lightBlue,
          ),
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.022,
                top: MediaQuery.of(context).size.height * 0.022),
            child: ListView.builder(
              itemCount: speakers.length,
              itemBuilder: (context, index) {
                final item = speakers[index];
                return Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Visibility(
                        child: Text(
                          item.date,
                          style: TextStyle(
                            fontSize: index == indexToShow ? 25 : 20,
                          ),
                        ),
                        visible: size >= 1280 ? true : false,
                      ),
                      Visibility(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            width: 20,
                            height: 2,
                            color: AppColors.brandingBlue,
                          ),
                        ),
                        visible: size >= 1280 ? true : false,
                      ),
                      Container(
                        height: index == indexToShow
                            ? smallCircleImageSize(height) + 40
                            : smallCircleImageSize(height),
                        width: index == indexToShow
                            ? smallCircleImageSize(height) + 40
                            : smallCircleImageSize(height),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                index == indexToShow ? 52 : 30),
                            border: Border.all(
                              color: AppColors.brandingOrange,
                              width: 3.5,
                            )),
                        child: GestureDetector(
                          onTap: () {
                            toggleIndex(index);
                          },
                          child: SizedBox(
                            height: index == indexToShow ? 108 : 62,
                            width: index == indexToShow ? 108 : 62,
                            child: CircleAvatar(
                              backgroundColor: AppColors.brandingOrange,
                              radius: index == indexToShow ? 54 : 31,
                              backgroundImage: NetworkImage(
                                  item.linkPhoto), // for Network image
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(
          width: cardWithTextWidth(size),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Visibility(
                child: SizedBox(
                  height: circleImageSize(size),
                  width: circleImageSize(size),
                  child: CircleAvatar(
                    radius: 102.0,
                    backgroundImage: NetworkImage(
                        speakers[indexToShow].linkPhoto), // for Network image
                  ),
                ),
                visible: size >= 1280 ? true : false,
              ),
              SizedBox(
                width: size >= 1280 ? 10 : 0,
              ),
              Expanded(
                flex: size >= 1280 ? 3 : 1,
                child: Column(children: [
                  Row(
                    children: [
                      Text(
                        speakers.isNotEmpty ? speakers[indexToShow].name : '',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: cardTitleFontSize(size, height)),
                      ),
                      Visibility(
                        child: Text(
                            speakers.isNotEmpty
                                ? ' - ' + speakers[indexToShow].date
                                : '',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: cardTitleFontSize(size, height))),
                        visible: size < 1280 ? true : false,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    speakers.isNotEmpty
                        ? speakers[indexToShow].description
                        : '',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: cardTextFontSize(size, height),
                        fontWeight: FontWeight.w100),
                  )
                ]),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
