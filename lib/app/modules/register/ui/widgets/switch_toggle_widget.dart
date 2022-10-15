import 'package:flutter/material.dart';

import 'package:getwidget/getwidget.dart';

import '../../../../shared/themes/app_colors.dart';
import '../../../../shared/themes/app_text_styles.dart';

// ignore: camel_case_types
class SwitchToggle_Widget extends StatelessWidget {
  const SwitchToggle_Widget(
      {super.key, required this.tipo, required this.onChanged});

  final String tipo;
  final Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
        width: MediaQuery.of(context).size.width < 650
            ? MediaQuery.of(context).size.width * 0.85
            : 600,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.gray,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: RichText(
                  text: TextSpan(
                      text: 'Quero receber notificações por ',
                      style: AppTextStyles.body.copyWith(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      children: [
                    TextSpan(
                        text: tipo.toUpperCase(),
                        style: AppTextStyles.body.copyWith(
                          color: AppColors.brandingOrange,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ))
                  ])),
            ),
            GFToggle(
              onChanged: (val) {
                onChanged;
              },
              enabledTrackColor: AppColors.brandingOrange,
              duration: const Duration(milliseconds: 60),
              value: false,
              type: GFToggleType.ios,
            ),
          ],
        ));
  }
}
