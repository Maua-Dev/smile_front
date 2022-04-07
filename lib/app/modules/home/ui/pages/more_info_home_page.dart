import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/home/ui/pages/sponsors-home/sponsors_home_page.dart';
import 'package:smile_front/app/modules/home/ui/pages/widgets/action_textbutton_widget.dart';
import 'package:smile_front/app/modules/home/ui/pages/widgets/paragraph_text_widget.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

import '../../../../app_module.dart';
import '../../../../shared/themes/app_colors.dart';
import '../../../../shared/widgets/text-header/text_header.dart';
import '../../utils/text_utils.dart';

class MoreInfoHomePage extends StatelessWidget {
  const MoreInfoHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: TextHeader(
                title: 'Sobre a Smile',
                leftPadding: 32,
                color: AppColors.brandingOrange,
              ),
            ),
            const ParagraphTextWidget(
              paragraph: firstParagraph,
            ),
            const SizedBox(
              height: 24,
            ),
            const ParagraphTextWidget(
              paragraph: secondParagraph,
            ),
            const SizedBox(
              height: 24,
            ),
            const ParagraphTextWidget(
              paragraph: thirdParagraph,
            ),
            const SizedBox(
              height: 24,
            ),
            const ParagraphTextWidget(
              paragraph: fourthParagraph,
            ),
            const SizedBox(
              height: 24,
            ),
            const ParagraphTextWidget(
              paragraph: smileDate,
              isBold: true,
            ),
            const SizedBox(
              height: 24,
            ),
            Center(
              child: ActionTextButtonWidget(
                title: 'Inscreva-se',
                textStyle: AppTextStyles.buttonBold.copyWith(
                    color: Colors.white,
                    fontSize:
                        MediaQuery.of(context).size.width < 1300 ? 48 : 60),
                paddingVertical: 24,
                widthSize: 400,
                backgroundColor: AppColors.brandingOrange,
                onPressed: () async {
                  await Modular.isModuleReady<AppModule>();
                  Modular.to.navigate('/login');
                },
              ),
            ),
            const SponsorsHomePage(),
          ],
        ),
      ),
    );
  }
}
