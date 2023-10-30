import 'package:flutter/material.dart';

import '../../../../../../shared/themes/app_colors.dart';
import '../../../../../../shared/themes/app_text_styles.dart';
import '../../../../domain/infra/speakers_enum.dart';
import '../../widgets/header/h1_header_text_widget.dart';

class SpeakerPanelMobileWidget extends StatelessWidget {
  final String title;
  final String description;
  final List<Widget> children;
  final int indexToShow;
  const SpeakerPanelMobileWidget(
      {super.key,
      required this.title,
      required this.description,
      required this.children,
      required this.indexToShow});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        H1HeaderTextWidget(
          title: title,
          padding: const EdgeInsets.only(top: 32, bottom: 16),
        ),
        Text(
          description,
          style: AppTextStyles.headline1.copyWith(fontSize: 14),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.brandingOrange, width: 7),
              borderRadius: BorderRadius.circular(100000)),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                    color: AppColors.gray.withOpacity(0.3), width: 7),
                borderRadius: BorderRadius.circular(100000)),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage:
                  NetworkImage(SpeakersEnum.values[indexToShow].linkPhoto),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(SpeakersEnum.values[indexToShow].name,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.headline1.copyWith(fontSize: 24)),
              const SizedBox(
                height: 8,
              ),
              Text(
                SpeakersEnum.values[indexToShow].description,
                style: AppTextStyles.headline1.copyWith(fontSize: 14),
                textAlign: TextAlign.justify,
              )
            ],
          ),
        ),
        Wrap(
          spacing: 10.0,
          runSpacing: 10.0,
          children: children,
        ),
      ],
    );
  }
}
