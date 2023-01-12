import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/home/ui/pages/sponsors-home/sponsors_home_page.dart';
import 'package:smile_front/app/shared/widgets/custom_elevated_button_widget.dart';
import 'package:smile_front/app/modules/home/ui/pages/widgets/paragraph_text_widget.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';
import 'package:smile_front/generated/l10n.dart';
import '../../../../app_module.dart';
import '../../../../shared/themes/app_colors.dart';
import '../../../../shared/widgets/text-header/text_header.dart';
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
                  vertical: 24.0,
                  horizontal: MediaQuery.of(context).size.width < 800 ? 16 : 32,
                ),
                child: Row(
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
                              MediaQuery.of(context).size.width < 800 ? 24 : 32,
                        )),
                    SizedBox(
                      width: MediaQuery.of(context).size.width < 800 ? 8 : 16,
                    ),
                    TextHeader(
                      title: S.of(context).aboutSmileTitle,
                      fontSize:
                          MediaQuery.of(context).size.width < 800 ? 24 : 45,
                      leftPadding: 0,
                      color: AppColors.brandingOrange,
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
                      fontSize: MediaQuery.of(context).size.width < 800
                          ? 24
                          : MediaQuery.of(context).size.width < 1300
                              ? 36
                              : MediaQuery.of(context).size.width < 1300
                                  ? 48
                                  : 60),
                  paddingVertical:
                      MediaQuery.of(context).size.width < 800 ? 12 : 24,
                  widthSize:
                      MediaQuery.of(context).size.width < 800 ? 200 : 400,
                  backgroundColor: AppColors.brandingOrange,
                  onPressed: () async {
                    await Modular.isModuleReady<AppModule>();
                    Modular.to.navigate('/login');
                  },
                ),
              ),
              const SponsorsHomePage(),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
