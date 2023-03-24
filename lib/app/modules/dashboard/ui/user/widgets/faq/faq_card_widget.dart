import 'package:flutter/material.dart';

import '../../../../../../shared/entities/screen_variables.dart';
import '../../../../../../shared/themes/app_colors.dart';
import '../../../../../../shared/themes/app_text_styles.dart';
import '../../../../../../shared/utils/screen_helper.dart';

class FaqCardWidget extends StatelessWidget {
  final String titulo;
  final String descricao;

  const FaqCardWidget({
    Key? key,
    required this.titulo,
    required this.descricao,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.width < 1000 ? 16 : 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titulo,
              style: AppTextStyles.titleH1.copyWith(
                  fontSize: MediaQuery.of(context).size.width < 1000 ? 24 : 30,
                  color: AppColors.brandingBlue),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(descricao,
                style: AppTextStyles.body.copyWith(
                    fontSize: Screen.width(context) < cellphoneSize
                        ? 14
                        : Screen.width(context) < tabletSize
                            ? 18
                            : 25)),
          ],
        ));
  }
}
