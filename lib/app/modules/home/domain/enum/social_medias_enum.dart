import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';

enum SocialMediasEnum {
  blog,
  youtube,
  instagram,
  linkedin,
  flickr,
  twitter,
  facebook,
  spotify
}

extension SocialMediasEnumExtension on SocialMediasEnum {
  String get url {
    switch (this) {
      case SocialMediasEnum.blog:
        return 'http://blog.maua.br/?_ga=2.199500717.2083227948.1663106128-1460562002.1628678318&_gl=1%2at8yuqa%2a_ga%2aMTQ2MDU2MjAwMi4xNjI4Njc4MzE4%2a_ga_Q0DH4GG89H%2aMTY2MzEwNjEyOC44LjAuMTY2MzEwNjEyOC42MC4wLjA.';

      case SocialMediasEnum.youtube:
        return 'http://www.youtube.com/infomaua';

      case SocialMediasEnum.instagram:
        return 'https://www.instagram.com/smilemaua/';

      case SocialMediasEnum.linkedin:
        return 'https://www.linkedin.com/school/479773/admin/updates';

      case SocialMediasEnum.flickr:
        return 'http://www.flickr.com/photos/infomaua';

      case SocialMediasEnum.twitter:
        return 'https://twitter.com/InfoMaua';

      case SocialMediasEnum.facebook:
        return 'https://www.facebook.com/InstitutoMaua';

      case SocialMediasEnum.spotify:
        return 'https://open.spotify.com/user/institutomauadetecnologia';
    }
  }

  Widget get icons {
    switch (this) {
      case SocialMediasEnum.blog:
        return const Icon(FontAwesome5.blogger_b, size: 22);

      case SocialMediasEnum.youtube:
        return const Icon(FontAwesome.youtube_play, size: 22);

      case SocialMediasEnum.instagram:
        return const Icon(FontAwesome5.instagram, size: 22);

      case SocialMediasEnum.linkedin:
        return const Icon(FontAwesome5.linkedin_in, size: 22);

      case SocialMediasEnum.flickr:
        return const Icon(Entypo.flickr, size: 22);

      case SocialMediasEnum.twitter:
        return const Icon(FontAwesome5.twitter, size: 22);

      case SocialMediasEnum.facebook:
        return const Icon(FontAwesome5.facebook_f, size: 22);

      case SocialMediasEnum.spotify:
        return const Icon(FontAwesome5.spotify, size: 22);
    }
  }
}
