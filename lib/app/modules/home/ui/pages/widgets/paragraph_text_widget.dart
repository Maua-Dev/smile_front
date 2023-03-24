import 'package:flutter/material.dart';

import '../../../../../shared/entities/screen_variables.dart';
import '../../../../../shared/themes/app_text_styles.dart';
import '../../../../../shared/utils/screen_helper.dart';

class ParagraphTextWidget extends StatelessWidget {
  final String paragraph;
  final bool isBold;
  const ParagraphTextWidget(
      {Key? key, required this.paragraph, this.isBold = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width < 800 ? 16 : 108),
      child: Text(
        paragraph,
        style: AppTextStyles.body.copyWith(
            fontSize: Screen.width(context) < cellphoneSize
                ? 14
                : Screen.width(context) < tabletSize
                    ? 18
                    : 25,
            fontWeight: isBold ? FontWeight.bold : null),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
