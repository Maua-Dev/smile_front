import 'package:flutter/material.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../domain/enum/social_medias_enum.dart';

class SocialMediaWidget extends StatelessWidget {
  const SocialMediaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
            width: 360,
            height: 50,
            child: Wrap(
                children: SocialMediasEnum.values
                    .map(
                      (e) => SocialMediaIconsWidget(
                          url: e.url, icon: Icon(Icons.abc)),
                    )
                    .toList())));
  }
}

// ignore: must_be_immutable
class SocialMediaIconsWidget extends StatelessWidget {
  SocialMediaIconsWidget({super.key, required this.icon, required this.url});

  late Widget icon;
  late String url;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      ),
      child: CircleAvatar(
        radius: 18,
        backgroundColor: AppColors.brandingOrange,
        child: icon,
      ),
    );
  }
}
