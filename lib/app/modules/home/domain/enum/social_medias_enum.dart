import 'package:flutter/material.dart';

enum SocialMediasEnum { blog, youtube, instagram }

extension SocialMediasEnumExtension on SocialMediasEnum {
  String get url {
    switch (this) {
      case SocialMediasEnum.blog:
        return 'http://blog.maua.br/?_ga=2.199500717.2083227948.1663106128-1460562002.1628678318&_gl=1%2at8yuqa%2a_ga%2aMTQ2MDU2MjAwMi4xNjI4Njc4MzE4%2a_ga_Q0DH4GG89H%2aMTY2MzEwNjEyOC44LjAuMTY2MzEwNjEyOC42MC4wLjA.';

      case SocialMediasEnum.youtube:
        return 'http://www.youtube.com/infomaua';

      case SocialMediasEnum.instagram:
        return 'https://www.instagram.com/infomaua/';
    }
  }
}
// Icon(FontAwesome5.blogger_b, size: 24),
//     Icon(FontAwesome.youtube_play, size: 24),
//     Icon(FontAwesome5.instagram, size: 24),
//     Icon(FontAwesome5.linkedin_in, size: 24),
//     Icon(Entypo.flickr, size: 24),
//     Icon(FontAwesome5.twitter, size: 24),
//     Icon(FontAwesome5.facebook_f, size: 24),
//     Icon(FontAwesome5.spotify, size: 24)