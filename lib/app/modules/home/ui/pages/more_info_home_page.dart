import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/home/ui/pages/sponsors-home/sponsors_home_page.dart';
import 'package:smile_front/app/modules/home/ui/pages/widgets/header/h1_header_text_widget.dart';
import 'package:smile_front/app/shared/entities/screen_variables.dart';
import 'package:smile_front/app/shared/widgets/custom_elevated_button_widget.dart';
import 'package:smile_front/app/modules/home/ui/pages/widgets/paragraph_text_widget.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';
import 'package:smile_front/generated/l10n.dart';
import '../../../../app_module.dart';
import '../../../../shared/themes/app_colors.dart';
import '../../../../shared/utils/screen_helper.dart';
import 'footer/footer.dart';

class MoreInfoHomePage extends StatelessWidget {
  const MoreInfoHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal:
                        MediaQuery.of(context).size.width < 800 ? 16 : 108),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          Modular.to.navigate('/home');
                        },
                        icon: Icon(
                          Icons.arrow_back_sharp,
                          color: AppColors.brandingOrange,
                          size:
                              MediaQuery.of(context).size.width < cellphoneSize
                                  ? 24
                                  : 48,
                        )),
                    Expanded(
                      child: H1HeaderTextWidget(
                        title: S.of(context).whatIsSmile,
                      ),
                    ),
                  ],
                ),
              ),
              ParagraphTextWidget(
                paragraph:
                    S.of(context).aboutSmileDescription('firstParagraph'),
              ),
              const SizedBox(
                height: 24,
              ),
              ParagraphTextWidget(
                paragraph:
                    S.of(context).aboutSmileDescription('secondParagraph'),
              ),
              const SizedBox(
                height: 24,
              ),
              ParagraphTextWidget(
                paragraph:
                    S.of(context).aboutSmileDescription('thirdParagraph'),
              ),
              const SizedBox(
                height: 24,
              ),
              ParagraphTextWidget(
                paragraph: S.of(context).aboutSmileDate,
                isBold: true,
              ),
              const SizedBox(
                height: 24,
              ),
              Center(
                child: CustomElevatedButtonWidget(
                  title: S.of(context).signUp,
                  textStyle: AppTextStyles.buttonBold.copyWith(
                      color: Colors.white,
                      fontSize:
                          Screen.width(context) < cellphoneSize ? 16 : 24),
                  widthSize: Screen.width(context) < cellphoneSize ? 200 : 400,
                  heightSize: Screen.width(context) < cellphoneSize ? 40 : 50,
                  backgroundColor: AppColors.brandingOrange,
                  onPressed: () async {
                    await Modular.isModuleReady<AppModule>();
                    Modular.to.navigate('/login');
                  },
                ),
              ),
              const Center(child: SponsorsHomePage()),
              const Center(child: Footer()),
            ],
          ),
        ),
      ),
    );
  }
}
