import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/home/presenter/controllers/home3_controller.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

class Home3Page extends StatefulWidget {
  const Home3Page({Key? key}) : super(key: key);

  @override
  _Home3PageState createState() => _Home3PageState();
}

double imageSize(size) {
  if (size >= 1600) {
    return 280;
  }
  if (size < 1600 && size >= 1440) {
    return 250;
  }
  if (size < 1440 && size >= 1280) {
    return 225;
  }
  if (size < 1280 && size >= 1120) {
    return 205;
  }
  if (size < 1120 && size >= 960) {
    return 170;
  }
  return 160;
}

double titleFontSize(size) {
  if (size >= 1600) {
    return 44;
  }
  if (size < 1600 && size >= 1440) {
    return 40;
  }
  if (size < 1440 && size >= 1280) {
    return 36;
  }
  if (size < 1280 && size >= 960) {
    return 30;
  }
  return 30;
}

double textFontSize(size) {
  if (size >= 1600) {
    return 20;
  }
  if (size < 1600 && size >= 1440) {
    return 18;
  }
  if (size < 1440 && size >= 1280) {
    return 16;
  }
  if (size < 1280 && size >= 840) {
    return 14;
  }
  return 12;
}

class _Home3PageState extends ModularState<Home3Page, Home3Controller> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    return Observer(builder: (context) {
      if (controller.listRectors.isEmpty) {
        return Container(
          color: AppColors.lightBlue,
        );
      }
      return Container(
        color: AppColors.lightBlue,
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
                              height: imageSize(size),
                              width: imageSize(size),
                              color: AppColors.brandingBlue,
                            ),
                          ),
                          SizedBox(
                              width: imageSize(size),
                              height: imageSize(size),
                              child: Image.network(
                                  controller.listRectors[0].image))
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
                            style: AppTextStyles.titleH1
                                .copyWith(fontSize: titleFontSize(size)),
                          ),
                          Text(
                            controller.listRectors[0].role,
                            style: AppTextStyles.body.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: titleFontSize(size) - 10),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(controller.listRectors[0].text,
                              style: TextStyle(fontSize: textFontSize(size))),
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
                              .copyWith(fontSize: titleFontSize(size)),
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
                            style: TextStyle(fontSize: textFontSize(size)))
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
                              height: imageSize(size),
                              width: imageSize(size),
                              color: AppColors.brandingBlue,
                            ),
                          ),
                          SizedBox(
                            width: imageSize(size),
                            height: imageSize(size),
                            child:
                                Image.network(controller.listRectors[1].image),
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
