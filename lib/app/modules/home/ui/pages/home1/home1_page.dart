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

class _Home1PageState extends State<Home1Page> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 74),
      child: Row(
        children: [
          SizedBox(
            width: size.width * 0.45,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 48),
                  child: Column(
                    children: [
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: 'Semana Mauá de ',
                            style:
                                AppTextStyles.titleH1.copyWith(fontSize: 55)),
                        TextSpan(
                            text: 'Inovação',
                            style: AppTextStyles.titleH1.copyWith(
                                color: AppColors.brandingOrange, fontSize: 55)),
                        TextSpan(
                            text: ', ',
                            style:
                                AppTextStyles.titleH1.copyWith(fontSize: 55)),
                        TextSpan(
                            text: 'Liderança ',
                            style: AppTextStyles.titleH1.copyWith(
                                color: AppColors.brandingOrange, fontSize: 55)),
                        TextSpan(
                            text: 'e ',
                            style:
                                AppTextStyles.titleH1.copyWith(fontSize: 55)),
                        TextSpan(
                            text: 'Empreendedorismo',
                            style: AppTextStyles.titleH1.copyWith(
                                color: AppColors.brandingOrange, fontSize: 55)),
                      ])),
                      const SizedBox(
                        height: 32,
                      ),
                      Text(
                        apresentationText,
                        style: AppTextStyles.body,
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height < 950 ? 54 : 104,
                ),
                Center(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        child: BrandingTextButtonWidget(
                          fontSize: 70,
                          boxHeight: 112,
                          boxWidth: 634,
                          backgroundColor: AppColors.brandingBlue,
                        ),
                      ),
                      BrandingTextButtonWidget(
                        title: '17 a 22 de Maio',
                        fontSize:
                            MediaQuery.of(context).size.height < 1500 ? 65 : 70,
                        boxHeight: 112,
                        boxWidth: 634,
                        backgroundColor: AppColors.brandingOrange,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height < 950 ? 54 : 104,
                ),
                Center(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        height: 94,
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
                                    fontSize: 25,
                                    fontWeight: FontWeight.w300),
                              ),
                              BrandingTextButtonWidget(
                                title: 'CADASTRE-SE',
                                fontSize:
                                    MediaQuery.of(context).size.height < 1500
                                        ? 30
                                        : 35,
                                backgroundColor: AppColors.brandingOrange,
                                boxHeight: 72,
                                boxWidth:
                                    MediaQuery.of(context).size.width < 1700
                                        ? 200
                                        : 300,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height < 950 ? 32 : 64,
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
                          fontSize: 25,
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
