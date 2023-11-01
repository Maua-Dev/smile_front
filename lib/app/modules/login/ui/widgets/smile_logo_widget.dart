import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:smile_front/app/shared/helpers/services/s3/assets_s3.dart';

class SmileLogoWidget extends StatelessWidget {
  const SmileLogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Modular.to.navigate('/home');
        },
        child: CachedNetworkImage(
          imageUrl: smileLogoUrl,
          width: 300,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
