import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/shared/entities/screen_variables.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/generated/l10n.dart';
import '../../../../../shared/themes/app_text_styles.dart';
import '../../../../../shared/utils/s3_assets_url.dart';
import '../../../../../shared/utils/screen_helper.dart';
import '../../../../../shared/widgets/custom_elevated_button_widget.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  @override
  Widget build(BuildContext context) {
    if (Screen.width(context) > cellphoneSize) {
      return SizedBox(
        height: Screen.height(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
                child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                            '${previousEditionsBaseUrl}main_home.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                        padding: EdgeInsets.only(
                          right: Screen.width(context) < tabletSize ? 24 : 32,
                          bottom: 55,
                        ),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: Screen.width(context) < cellphoneSize
                                      ? 350
                                      : Screen.width(context) * 0.5 <
                                              cellphoneSize
                                          ? Screen.width(context) * 0.45
                                          : 650,
                                  decoration: BoxDecoration(
                                      color: AppColors.brandingBlue,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(24),
                                    child: Column(
                                      children: [
                                        Text(
                                            S
                                                .of(context)
                                                .homePageTitleSelection('one'),
                                            style: AppTextStyles.titleH1
                                                .copyWith(
                                                    color: Colors.white,
                                                    fontSize:
                                                        Screen.width(context) <
                                                                tabletSize
                                                            ? 24
                                                            : 32)),
                                        Text(
                                            S
                                                .of(context)
                                                .homePageTitleSelection('two'),
                                            style: AppTextStyles.titleH1
                                                .copyWith(
                                                    color: Colors.white,
                                                    fontSize:
                                                        Screen.width(context) <
                                                                tabletSize
                                                            ? 24
                                                            : 32)),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        SizedBox(
                                          width:
                                              Screen.width(context) < tabletSize
                                                  ? Screen.width(context) <
                                                          cellphoneSize
                                                      ? 300
                                                      : 580
                                                  : 820,
                                          //580 e 820
                                          child: Text(
                                            S.of(context).homePageSubtitle,
                                            style: AppTextStyles.body.copyWith(
                                                color: Colors.white,
                                                fontSize: Screen.width(
                                                            context) <
                                                        tabletSize
                                                    ? Screen.width(context) <
                                                            cellphoneSize
                                                        ? 16
                                                        : 18
                                                    : 25),
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: Screen.width(context) < tabletSize
                                      ? 9
                                      : 16,
                                ),
                                CustomElevatedButtonWidget(
                                  title: S.of(context).smileDateWithYear,
                                  textStyle: AppTextStyles.buttonBold.copyWith(
                                      color: Colors.white,
                                      fontSize:
                                          Screen.width(context) < tabletSize
                                              ? Screen.width(context) <
                                                      cellphoneSize
                                                  ? 20
                                                  : 24
                                              : 40),
                                  widthSize: Screen.width(context) < tabletSize
                                      ? 320
                                      : 500,
                                  heightSize:
                                      Screen.width(context) < cellphoneSize
                                          ? 40
                                          : 50,
                                  borderRadius: 40,
                                  backgroundColor: AppColors.brandingBlue,
                                  isClickable: false,
                                  onPressed: null,
                                ),
                                SizedBox(
                                    height: Screen.width(context) < tabletSize
                                        ? 9
                                        : 16),
                                CustomElevatedButtonWidget(
                                  title: S.of(context).knowMore,
                                  textStyle: AppTextStyles.buttonBold.copyWith(
                                      color: Colors.white,
                                      fontSize:
                                          Screen.width(context) < tabletSize
                                              ? Screen.width(context) <
                                                      cellphoneSize
                                                  ? 20
                                                  : 24
                                              : 40),
                                  widthSize: Screen.width(context) < tabletSize
                                      ? Screen.width(context) < cellphoneSize
                                          ? 200
                                          : 240
                                      : 340,
                                  heightSize:
                                      Screen.width(context) < cellphoneSize
                                          ? 40
                                          : 50,
                                  borderRadius: 40,
                                  backgroundColor: AppColors.brandingOrange,
                                  onPressed: () {
                                    Modular.to.navigate('/home/home-more-info');
                                  },
                                )
                              ]),
                        ))))
          ],
        ),
      );
    } else {
      return Column(
        children: [
          Image(
            image: CachedNetworkImageProvider(
                '${previousEditionsBaseUrl}main_home.png'),
            fit: BoxFit.fitWidth,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
            child: Center(
              child: Text(
                S.of(context).homePageTitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              S.of(context).homePageSubtitle,
              style: const TextStyle(fontSize: 14),
              textAlign: TextAlign.justify,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            width: 200,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.brandingOrange,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            child: Text(
              S.of(context).smileDate,
              textAlign: TextAlign.center,
              style: AppTextStyles.buttonBold.copyWith(fontSize: 14),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  Modular.to.navigate('/home/home-more-info');
                },
                child: Container(
                  width: 200,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.brandingBlue,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Text(
                    S.of(context).knowMore,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.buttonBold.copyWith(fontSize: 14),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }
  }
}
