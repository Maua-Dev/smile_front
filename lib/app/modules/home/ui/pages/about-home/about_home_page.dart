import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/home/presenter/controllers/about_home_controller.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

class AboutHomePage extends StatefulWidget {
  const AboutHomePage({Key? key}) : super(key: key);

  @override
  _AboutHomePageState createState() => _AboutHomePageState();
}

double imageSize(size, height) {
  if (size <= 1920 && size >= 1760) {
    if (height < 1080 && height >= 900) return 340;
    if (height < 765 && height >= 720) return 260;
    if (height < 720 && height >= 630) return 220;
    return 300;
  }
  if (size < 1760 && size >= 1600) {
    if (height < 765 && height >= 720) return 260;
    if (height < 720 && height >= 630) return 220;
    return 280;
  }
  if (size < 1600 && size >= 1440) {
    if (height < 720 && height >= 630) return 220;
    return 270;
  }
  if (size < 1440 && size >= 1280) {
    if (height < 675 && height >= 630) return 220;
    return 250;
  }
  if (size < 1280 && size >= 1120) {
    return 205;
  }
  if (size < 1120 && size >= 960) {
    return 170;
  }
  return 160;
}

double titleFontSize(size, height) {
  if (size <= 1920 && size >= 1760) {
    if (height < 1080 && height >= 900) return 52;
    return 44;
  }
  if (size < 1760 && size >= 1600) {
    if (height < 1080 && height >= 900) return 52;
    return 44;
  }
  if (size < 1600 && size >= 1440) {
    if (height < 1080 && height >= 900) return 46;
    return 40;
  }
  if (size < 1440 && size >= 1280) {
    if (height < 1080 && height >= 900) return 42;
    return 36;
  }
  if (size < 1280 && size >= 1120) {
    if (height < 1080 && height >= 990) return 36;
    if (height < 990 && height >= 765) return 34;
    return 30;
  }
  if (size < 1120 && size >= 960) {
    if (height < 1080 && height >= 855) return 38;
    return 30;
  }
  return 30;
}

double textFontSize(size, height) {
  if (size <= 1920 && size >= 1760) {
    if (height < 1080 && height >= 900) return 29;
    if (height < 900 && height >= 810) return 26;
    if (height < 810 && height >= 675) return 22;
    return 20;
  }
  if (size < 1760 && size >= 1600) {
    if (height < 1080 && height >= 900) return 29;
    if (height < 900 && height >= 810) return 26;
    if (height < 810 && height >= 675) return 22;
    return 20;
  }
  if (size < 1600 && size >= 1440) {
    if (height < 1080 && height >= 990) return 27;
    if (height < 990 && height >= 900) return 25;
    if (height < 900 && height >= 810) return 24;
    if (height < 810 && height >= 765) return 22;
    if (height < 765 && height >= 675) return 20;
    return 18;
  }
  if (size < 1440 && size >= 1280) {
    if (height < 1080 && height >= 990) return 27;
    if (height < 990 && height >= 900) return 25;
    if (height < 900 && height >= 810) return 24;
    if (height < 810 && height >= 765) return 22;
    if (height < 765 && height >= 675) return 20;
    return 16;
  }
  if (size < 1280 && size >= 1120) {
    if (height < 1080 && height >= 900) return 25;
    if (height < 900 && height >= 810) return 24;
    if (height < 810 && height >= 765) return 23;
    if (height < 765 && height >= 720) return 22;
    if (height < 720 && height >= 675) return 20;
    return 18;
  }
  if (size < 1120 && size >= 960) {
    if (height < 1080 && height >= 990) return 22;
    if (height < 990 && height >= 855) return 20;
    if (height < 855 && height >= 675) return 18;
    return 16;
  }
  if (size < 960 && size >= 840) {
    return 14;
  }
  return 12;
}

class _AboutHomePageState
    extends ModularState<AboutHomePage, AboutHomeController> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Observer(builder: (context) {
      if (controller.listRectors.isEmpty) {
        return Container(
          color: AppColors.lightPurple,
        );
      }
      return Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 120.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                            child: Container(
                              height: imageSize(size, height),
                              width: imageSize(size, height),
                              color: AppColors.brandingPurple,
                            ),
                          ),
                          SizedBox(
                            width: imageSize(size, height),
                            height: imageSize(size, height),
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      alignment: Alignment.centerLeft,
                                      image: CachedNetworkImageProvider(
                                        controller.listRectors[0].image,
                                      ))),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.listRectors[0].name,
                            style: AppTextStyles.titleH1.copyWith(
                                fontSize: titleFontSize(size, height)),
                          ),
                          Text(
                            controller.listRectors[0].role,
                            style: AppTextStyles.body.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: titleFontSize(size, height) - 10),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(controller.listRectors[0].text,
                              style: TextStyle(
                                  fontSize: textFontSize(size, height))),
                        ],
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: Container(
                  color: AppColors.brandingOrange,
                  height: 8,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.listRectors[1].name,
                          style: AppTextStyles.titleH1
                              .copyWith(fontSize: titleFontSize(size, height)),
                        ),
                        Text(
                          controller.listRectors[1].role,
                          style: AppTextStyles.body
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(controller.listRectors[1].text,
                            style:
                                TextStyle(fontSize: textFontSize(size, height)))
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 20,
                      ),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                            child: Container(
                              height: imageSize(size, height),
                              width: imageSize(size, height),
                              color: AppColors.brandingPurple,
                            ),
                          ),
                          SizedBox(
                            width: imageSize(size, height),
                            height: imageSize(size, height),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  alignment: Alignment.centerLeft,
                                  image: CachedNetworkImageProvider(
                                    controller.listRectors[1].image,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
