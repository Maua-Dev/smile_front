import 'package:flutter/material.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../shared/themes/app_colors.dart';

class CheckBoxWidget extends StatelessWidget {
  final bool check;
  final Function(bool?)? onChanged;
  final String title;
  final String? link;
  const CheckBoxWidget(
      {Key? key,
      required this.check,
      this.onChanged,
      required this.title,
      this.link})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      width: MediaQuery.of(context).size.width < 650
          ? MediaQuery.of(context).size.width
          : 600,
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: CheckboxListTile(
        activeColor: AppColors.brandingBlue,
        contentPadding: EdgeInsets.zero,
        controlAffinity: ListTileControlAffinity.leading,
        title: link == null
            ? Text(
                title,
                style: TextStyle(color: AppColors.gray, fontSize: 14),
              )
            : MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => {
                    launchUrl(
                      Uri.parse(link!),
                      mode: LaunchMode.externalApplication,
                    ),
                  },
                  child: Text(
                    title,
                    style: AppTextStyles.titleH1.copyWith(
                        color: AppColors.gray,
                        fontSize: 14,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ),
        value: check,
        onChanged: onChanged,
      ),
    );
  }
}
