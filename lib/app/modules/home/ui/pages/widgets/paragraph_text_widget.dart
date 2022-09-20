import 'package:flutter/material.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_web.dart';

import '../../../../../shared/themes/app_text_styles.dart';

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
      child: TextRenderer(
        child: Text(
          paragraph,
          style: AppTextStyles.body.copyWith(
              fontSize: MediaQuery.of(context).size.width < 800
                  ? 12
                  : MediaQuery.of(context).size.width < 1300
                      ? 24
                      : 28,
              fontWeight: isBold ? FontWeight.bold : null),
          textAlign: TextAlign.justify,
        ),),
    );
  }
}
