import 'package:flutter/material.dart';
import 'package:smile_front/generated/l10n.dart';
import '../../../../shared/themes/app_colors.dart';
import '../../../../shared/themes/app_text_styles.dart';

class SwitchToggleWidget extends StatelessWidget {
  final String tipo;
  final bool isSwitched;
  final Function(bool?)? onChanged;

  const SwitchToggleWidget({
    Key? key,
    required this.isSwitched,
    required this.tipo,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      width: MediaQuery.of(context).size.width < 650
          ? MediaQuery.of(context).size.width * 0.85
          : 600,
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: RichText(
                text: TextSpan(
                    text: S.of(context).notificationsSchemaTitle,
                    style: AppTextStyles.body.copyWith(
                      color: AppColors.gray,
                      fontSize: 16,
                    ),
                    children: [
                  TextSpan(
                      text: tipo.toUpperCase(),
                      style: AppTextStyles.body.copyWith(
                        color: AppColors.brandingOrange,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ))
                ])),
          ),
          GestureDetector(
            child: Switch(
              splashRadius: 8,
              activeTrackColor: AppColors.brandingOrange,
              activeColor: AppColors.white,
              value: isSwitched,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
