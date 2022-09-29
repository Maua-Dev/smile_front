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
            width: MediaQuery.of(context).size.width < 700 ? 100 : 350,
            height: 50,
            child: Wrap(
                spacing: 8,
                children: SocialMediasEnum.values
                    .map(
                      (e) => SocialMediaIconsWidget(url: e.url, icon: e.icons),
                    )
                    .toList())));
  }
}

class SocialMediaIconsWidget extends StatefulWidget {
  const SocialMediaIconsWidget(
      {super.key, required this.icon, required this.url});

  final Widget icon;
  final String url;

  @override
  State<SocialMediaIconsWidget> createState() => _SocialMediaIconsWidgetState();
}

class _SocialMediaIconsWidgetState extends State<SocialMediaIconsWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => launchUrl(
        Uri.parse(widget.url),
        mode: LaunchMode.externalApplication,
      ),
      child: CircleAvatar(
        radius: 18,
        backgroundColor: AppColors.brandingOrange,
        child: widget.icon,
      ),
    );
  }
}
