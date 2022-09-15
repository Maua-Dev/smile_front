import 'dart:html';

import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
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
  ];
  final myIcons = const <Widget>[
    Icon(FontAwesome5.blogger_b, size: 17),
    Icon(FontAwesome.youtube_play, size: 17),
    Icon(FontAwesome5.instagram, size: 17),
    Icon(FontAwesome5.linkedin_in, size: 17),
    Icon(Entypo.flickr, size: 17),
    Icon(FontAwesome5.twitter, size: 17),
    Icon(FontAwesome5.facebook_f, size: 17),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: 300,
      height: 30,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 7,
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

// ignore: must_be_immutable
class SocialMediaIconsWidget extends StatelessWidget {
  SocialMediaIconsWidget({super.key, required this.icon, required this.url});

  late int index;
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
        radius: 15,
        backgroundColor: Colors.deepOrange,
        child: icon,
      ),
    );
  }
}
