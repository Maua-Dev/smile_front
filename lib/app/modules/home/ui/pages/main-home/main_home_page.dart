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
import '../widgets/header/h1_header_text_widget.dart';

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
        height: Screen.height(context) - 56,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    H1HeaderTextWidget(
                      padding: const EdgeInsets.only(bottom: 32),
                      title: S.of(context).homePageTitle,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      S.of(context).homePageSubtitle,
                      style: AppTextStyles.body.copyWith(fontSize: 25),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomElevatedButtonWidget(
                      title: S.of(context).smileDateWithYear,
                      textStyle: AppTextStyles.buttonBold
                          .copyWith(color: Colors.white, fontSize: 24),
                      widthSize: 400,
                      heightSize: 50,
                      borderRadius: 40,
                      backgroundColor: AppColors.brandingBlue,
                      isClickable: false,
                      onPressed: null,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    CustomElevatedButtonWidget(
                      title: S.of(context).knowMore,
                      textStyle: AppTextStyles.buttonBold
                          .copyWith(color: Colors.white, fontSize: 24),
                      widthSize: 400,
                      heightSize: 50,
                      borderRadius: 40,
                      backgroundColor: AppColors.brandingOrange,
                      onPressed: () {
                        Modular.to.navigate('/home/home-more-info');
                      },
                    )
                  ],
                ),
              ),
              Flexible(
                  child: Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 104, horizontal: 64),
                  child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: CachedNetworkImageProvider(
                                  '${previousEditionsBaseUrl}main_home.png')))),
                ),
              ))
            ],
          ),
        ),
      );
    } else {
      return SizedBox(
        child: Column(
          children: [
            H1HeaderTextWidget(
              title: S.of(context).homePageTitle,
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
            Image(
              image: CachedNetworkImageProvider(
                  '${previousEditionsBaseUrl}main_home.png'),
              fit: BoxFit.fitWidth,
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
                style: AppTextStyles.buttonBold.copyWith(fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            MouseRegion(
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
                    style: AppTextStyles.buttonBold.copyWith(fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
