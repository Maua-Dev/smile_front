import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaWidget extends StatelessWidget {
  const SocialMediaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(color: Colors.orange))),
            onPressed: () => launchUrl(
              Uri.parse('https://www.instagram.com/infomaua/'),
              mode: LaunchMode.externalApplication,
            ),
            child: const Text("I"),
          ),
          ElevatedButton(
            child: const Text("B"),
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(1, 1),
                shape: const CircleBorder(),
                primary: Colors.red),
            onPressed: () => launchUrl(
              Uri.parse(
                  'http://blog.maua.br/?_ga=2.199500717.2083227948.1663106128-1460562002.1628678318&_gl=1%2at8yuqa%2a_ga%2aMTQ2MDU2MjAwMi4xNjI4Njc4MzE4%2a_ga_Q0DH4GG89H%2aMTY2MzEwNjEyOC44LjAuMTY2MzEwNjEyOC42MC4wLjA.'),
              mode: LaunchMode.externalApplication,
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: const CircleBorder(), primary: Colors.red),
            onPressed: () => launchUrl(
              Uri.parse('https://www.linkedin.com/school/479773/admin/updates'),
              mode: LaunchMode.externalApplication,
            ),
            child: const Text("L"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: const CircleBorder(), primary: Colors.red),
            onPressed: () => launchUrl(
              Uri.parse('http://www.youtube.com/infomaua'),
              mode: LaunchMode.externalApplication,
            ),
            child: const Text("Y"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: const CircleBorder(), primary: Colors.red),
            onPressed: () => launchUrl(
              Uri.parse('http://www.flickr.com/photos/infomaua'),
              mode: LaunchMode.externalApplication,
            ),
            child: const Text("F"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: const CircleBorder(), primary: Colors.red),
            onPressed: () => launchUrl(
              Uri.parse('https://twitter.com/InfoMaua'),
              mode: LaunchMode.externalApplication,
            ),
            child: const Text("T"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: const CircleBorder(), primary: Colors.red),
            onPressed: () => launchUrl(
              Uri.parse('https://www.facebook.com/InstitutoMaua'),
              mode: LaunchMode.externalApplication,
            ),
            child: const Text("F"),
          ),
        ],
      ),
    );
  }
}
