import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:smile_front/app/modules/home/ui/pages/home1/utils/text_utils.dart';
import 'package:smile_front/app/modules/home/ui/pages/home1/widgets/branding_textbutton_widget.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

class Home1Page extends StatefulWidget {
  const Home1Page({Key? key}) : super(key: key);

  @override
  _HomePage1State createState() => _HomePage1State();
}

class _HomePage1State extends State<Home1Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 74),
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.45,
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
                                  color: AppColors.brandingOrange,
                                  fontSize: 55)),
                          TextSpan(
                              text: ', ',
                              style:
                                  AppTextStyles.titleH1.copyWith(fontSize: 55)),
                          TextSpan(
                              text: 'Liderança ',
                              style: AppTextStyles.titleH1.copyWith(
                                  color: AppColors.brandingOrange,
                                  fontSize: 55)),
                          TextSpan(
                              text: 'e ',
                              style:
                                  AppTextStyles.titleH1.copyWith(fontSize: 55)),
                          TextSpan(
                              text: 'Empreendedorismo',
                              style: AppTextStyles.titleH1.copyWith(
                                  color: AppColors.brandingOrange,
                                  fontSize: 55)),
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
                  const SizedBox(
                    height: 104,
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
                          fontSize: 70,
                          boxHeight: 112,
                          boxWidth: 634,
                          backgroundColor: AppColors.brandingOrange,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 104,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 54),
                      child: Center(
                        child: Container(
                          height: 94,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              color: AppColors.lightOrange),
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 32),
                                child: Text(
                                  'PARTICIPE DAS ATIVIDADES',
                                  style: AppTextStyles.body.copyWith(
                                      color: AppColors.brandingOrange,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              BrandingTextButtonWidget(
                                title: 'CADASTRE-SE',
                                fontSize: 35,
                                backgroundColor: AppColors.brandingOrange,
                                boxHeight: 72,
                                boxWidth: 300,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 82,
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
      ),
    );
  }
}
