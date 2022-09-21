import 'package:flutter/material.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_web.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../shared/themes/app_colors.dart';

class CheckBoxWidget extends StatelessWidget {
  final bool check;
  final Function(bool?)? onChanged;
  final String text;
  final String? link;
  const CheckBoxWidget(
      {Key? key,
      required this.check,
      this.onChanged,
      required this.text,
      this.link})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      width: MediaQuery.of(context).size.width < 650
          ? MediaQuery.of(context).size.width * 0.85
          : 600,
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.gray,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Checkbox(
            activeColor: AppColors.brandingPurple,
            value: check,
            onChanged: onChanged,
          ),
          const SizedBox(width: 5),
          link == null
              ? Flexible(
                  child: TextRenderer(
                    child: Text(
                      text,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
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
                    child: TextRenderer(
                      child: Text(
                        text,
                        style: AppTextStyles.titleH1.copyWith(
                            color: Colors.white,
                            fontSize: 14,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
