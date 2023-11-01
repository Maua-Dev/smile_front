import 'package:flutter/material.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';
import 'package:smile_front/generated/l10n.dart';

class SwitchToggleUserDialogWidget extends StatelessWidget {
  final String type;
  final bool isSwitched;
  final Function(bool?)? onChanged;

  const SwitchToggleUserDialogWidget({
    Key? key,
    required this.isSwitched,
    required this.type,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width < 440
                ? MediaQuery.of(context).size.width * 0.5
                : null,
            child: RichText(
                text: TextSpan(
                    text: S.of(context).notificationsSchemaTitle,
                    style: AppTextStyles.headline1.copyWith(
                      color: AppColors.gray,
                      fontSize: 16,
                    ),
                    children: [
                  TextSpan(
                      text: type.toUpperCase(),
                      style: AppTextStyles.headline1.copyWith(
                        color: AppColors.brandingOrange,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ))
                ])),
          ),
          SizedBox(
            width: 30,
            child: GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(right: 14.0),
                child: Switch(
                  splashRadius: 8,
                  activeTrackColor: AppColors.brandingOrange,
                  activeColor: AppColors.white,
                  value: isSwitched,
                  onChanged: onChanged,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
