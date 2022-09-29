import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaWidget extends StatelessWidget {
  const SocialMediaWidget({Key? key}) : super(key: key);

  final urls = const <String>[
    'http://blog.maua.br/?_ga=2.199500717.2083227948.1663106128-1460562002.1628678318&_gl=1%2at8yuqa%2a_ga%2aMTQ2MDU2MjAwMi4xNjI4Njc4MzE4%2a_ga_Q0DH4GG89H%2aMTY2MzEwNjEyOC44LjAuMTY2MzEwNjEyOC42MC4wLjA.',
    'http://www.youtube.com/infomaua',
    'https://www.instagram.com/infomaua/',
    'https://www.linkedin.com/school/479773/admin/updates',
    'http://www.flickr.com/photos/infomaua',
    'https://twitter.com/InfoMaua',
    'https://www.facebook.com/InstitutoMaua',
    'https://open.spotify.com/user/institutomauadetecnologia'
  ];
  final myIcons = const <Widget>[
    Icon(FontAwesome5.blogger_b, size: 24),
    Icon(FontAwesome.youtube_play, size: 24),
    Icon(FontAwesome5.instagram, size: 24),
    Icon(FontAwesome5.linkedin_in, size: 24),
    Icon(Entypo.flickr, size: 24),
    Icon(FontAwesome5.twitter, size: 24),
    Icon(FontAwesome5.facebook_f, size: 24),
    Icon(FontAwesome5.spotify, size: 24)
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: 360,
      height: 50,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 8,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(left: 8),
              child: SocialMediaIconsWidget(
                  url: urls[index], icon: myIcons[index]),
            );
          }),
    ));
  }
}


class SocialMediaIconsWidget extends StatefulWidget {
  const SocialMediaIconsWidget({super.key, required this.icon, required this.url});

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
