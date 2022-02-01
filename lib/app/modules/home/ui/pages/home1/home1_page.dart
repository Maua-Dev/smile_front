import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:smile_front/app/modules/home/ui/pages/home1/utils/text_utils.dart';
import 'package:smile_front/app/modules/home/ui/pages/home1/widgets/branding_textbutton_widget.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

class Home1Page extends StatefulWidget {
  const Home1Page({Key? key}) : super(key: key);

  @override
  _Home1PageState createState() => _Home1PageState();
}

double sizedBoxHeightByHeight(height, double sumValue, double lastResult) {
  if (height >= 1080) return 24 + sumValue * 9.6;
  if (height < 1080 && height >= 1035) return 24 + sumValue * 8.6;
  if (height < 1035 && height >= 990) return 24 + sumValue * 7.6;
  if (height < 990 && height >= 945) return 24 + sumValue * 6.8;
  if (height < 945 && height >= 900) return 24 + sumValue * 5.8;
  if (height < 900 && height >= 855) return 24 + sumValue * 5;
  if (height < 855 && height >= 810) return 24 + sumValue * 4;
  if (height < 810 && height >= 765) return 24 + sumValue * 3;
  if (height < 765 && height >= 720) return 24 + sumValue * 2;
  if (height < 720 && height >= 675) return 24 + sumValue * 1;
  if (height < 675 && height >= 630) return 24 + sumValue * 0.25;
  return lastResult;
}

//104 >950
double sizedBoxHeight(size, height) {
  if (size < 1920 && size >= 1760) {
    return sizedBoxHeightByHeight(height, 11, 18);
  }
  if (size < 1760 && size >= 1600) {
    return sizedBoxHeightByHeight(height, 16, 18);
  }
  if (size < 1600 && size >= 1440) {
    return sizedBoxHeightByHeight(height, 16, 18);
  }
  if (size < 1440 && size >= 1280) {
    return sizedBoxHeightByHeight(height, 16, 18);
  }
  if (size < 1280 && size >= 1120) {
    return sizedBoxHeightByHeight(height, 18, 18);
  }
  if (size < 1120 && size >= 960) {
    return sizedBoxHeightByHeight(height, 16, 18);
  }
  return 54;
}

double fontSizeTitle(size) {
  if (size < 1920 && size >= 1760) {
    return 52;
  }
  if (size < 1760 && size >= 1600) {
    return 50;
  }
  if (size < 1600 && size >= 1440) {
    return 45;
  }
  if (size < 1440 && size >= 1280) {
    return 40;
  }
  if (size < 1280 && size >= 1120) {
    return 35;
  }
  if (size < 1120 && size >= 960) {
    return 32;
  }
  return 40;
}

double weekBoxHeight(size) {
  if (size < 1920 && size >= 1760) {
    return 64;
  }
  if (size < 1760 && size >= 1600) {
    return 64;
  }
  if (size < 1600 && size >= 1440) {
    return 68;
  }
  if (size < 1440 && size >= 1280) {
    return 68;
  }
  return 70;
}

double weekFontSize(size) {
  if (size < 1600 && size >= 1440) {
    return 62;
  }
  if (size < 1440 && size >= 1280) {
    return 56;
  }
  if (size < 1280 && size >= 960) {
    return 48;
  }
  return 44;
}

double apresentationFontSize(size) {
  if (size < 1920 && size >= 1760) {
    return 24;
  }
  if (size < 1760 && size >= 1600) {
    return 21;
  }
  if (size < 1600 && size >= 1280) {
    return 18;
  }
  if (size < 1280 && size >= 1120) {
    return 17;
  }
  if (size < 1120 && size >= 960) {
    return 17;
  }
  return 15;
}

double participateBoxHeight(size) {
  if (size < 1600 && size >= 1280) {
    return 60;
  }
  return 50;
}

double signUpBoxWidth(size) {
  if (size < 1600 && size >= 1280) {
    return 250;
  }
  if (size < 1280 && size >= 960) {
    return 150;
  }
  return 300;
}

double participateBoxFontSize(size) {
  if (size < 1920 && size >= 1760) {
    return 26;
  }
  if (size < 1760 && size >= 1600) {
    return 25;
  }
  if (size < 1600 && size >= 1440) {
    return 22;
  }
  if (size < 1440 && size >= 1280) {
    return 18;
  }
  return 14;
}

class _Home1PageState extends State<Home1Page> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.only(left: 74),
      child: Row(
        children: [
          SizedBox(
            width: size * 0.45,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 38),
                  child: Column(
                    children: [
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: 'Semana Mauá de ',
                            style: AppTextStyles.titleH1
                                .copyWith(fontSize: fontSizeTitle(size))),
                        TextSpan(
                            text: 'Inovação',
                            style: AppTextStyles.titleH1.copyWith(
                                color: AppColors.brandingOrange,
                                fontSize: fontSizeTitle(size))),
                        TextSpan(
                            text: ', ',
                            style: AppTextStyles.titleH1
                                .copyWith(fontSize: fontSizeTitle(size))),
                        TextSpan(
                            text: 'Liderança ',
                            style: AppTextStyles.titleH1.copyWith(
                                color: AppColors.brandingOrange,
                                fontSize: fontSizeTitle(size))),
                        TextSpan(
                            text: 'e ',
                            style: AppTextStyles.titleH1
                                .copyWith(fontSize: fontSizeTitle(size))),
                        TextSpan(
                            text: 'Empreendedorismo',
                            style: AppTextStyles.titleH1.copyWith(
                                color: AppColors.brandingOrange,
                                fontSize: fontSizeTitle(size))),
                      ])),
                      const SizedBox(
                        height: 32,
                      ),
                      Text(
                        apresentationText,
                        style: AppTextStyles.body
                            .copyWith(fontSize: apresentationFontSize(size)),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: sizedBoxHeight(size, height),
                ),
                Center(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        child: BrandingTextButtonWidget(
                          fontSize: 70,
                          boxHeight: weekBoxHeight(size),
                          boxWidth: 634,
                          backgroundColor: AppColors.brandingBlue,
                        ),
                      ),
                      BrandingTextButtonWidget(
                        title: '17 a 22 de Maio',
                        fontSize: weekFontSize(size),
                        boxHeight: weekBoxHeight(size),
                        boxWidth: 634,
                        backgroundColor: AppColors.brandingOrange,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: sizedBoxHeight(size, height),
                ),
                Center(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        height: participateBoxHeight(size),
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            color: AppColors.lightOrange),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'PARTICIPE DAS ATIVIDADES',
                                style: AppTextStyles.body.copyWith(
                                    color: AppColors.brandingOrange,
                                    fontSize: participateBoxFontSize(size),
                                    fontWeight: FontWeight.w300),
                              ),
                              BrandingTextButtonWidget(
                                title: 'CADASTRE-SE',
                                fontSize: participateBoxFontSize(size) + 5,
                                backgroundColor: AppColors.brandingOrange,
                                boxHeight: participateBoxHeight(size) - 15,
                                boxWidth: signUpBoxWidth(size),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: sizedBoxHeight(size, height) - 10,
                ),
                Row(
                  children: [
                    Icon(
                      FontAwesome.angle_double_up,
                      color: AppColors.brandingOrange,
                      size: 62,
                    ),
                    Text(
                      'DESLIZE PARA SABER MAIS',
                      style: AppTextStyles.body.copyWith(
                          color: AppColors.brandingOrange,
                          fontSize: size < 1280 ? 22 : 25,
                          fontWeight: FontWeight.w300),
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/maua_campus.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
