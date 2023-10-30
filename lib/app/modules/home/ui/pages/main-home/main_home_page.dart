import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/shared/domain/entities/screen_variables.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/generated/l10n.dart';
import '../../../../../shared/themes/app_text_styles.dart';
import 'package:smile_front/app/shared/helpers/services/s3/assets_s3.dart';
import '../../../../../shared/helpers/utils/screen_helper.dart';
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
    if (Screen.width(context) > tabletSize) {
      return SizedBox(
        height: Screen.height(context) - 56,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Screen.height(context) < 750 ? 32 : 64),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    H1HeaderTextWidget(
                      padding: const EdgeInsets.only(bottom: 32, top: 16),
                      title: S.of(context).homePageTitle,
                    ),
                    Text(
                      S.of(context).homePageSubtitle,
                      style: AppTextStyles.headline1.copyWith(
                          fontSize: Screen.height(context) < 750 ? 20 : 25),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: Screen.height(context) < 750 ? 16 : 40,
                    ),
                    CustomElevatedButtonWidget(
                      title: S.of(context).knowMore,
                      textStyle: AppTextStyles.headline3
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
              const SizedBox(
                width: 64,
              ),
              Flexible(
                  child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 104),
                  child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                              fit: BoxFit.fitWidth,
                              image: CachedNetworkImageProvider(
                                  '${s3AssetsBaseUrl}smile-home.jpg')))),
                ),
              ))
            ],
          ),
        ),
      );
    } else {
      return Column(
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
            height: 8,
          ),
          SizedBox(
            height: Screen.height(context) / 2.5,
            width: Screen.width(context),
            child: Image(
              image: CachedNetworkImageProvider(
                  '${s3AssetsBaseUrl}smile-home.jpg'),
              fit: BoxFit.fitWidth,
            ),
          ),
          const SizedBox(
            height: 8,
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
                  color: AppColors.brandingOrange,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: Text(
                  S.of(context).knowMore,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.headline3.copyWith(fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      );
    }
  }
}
