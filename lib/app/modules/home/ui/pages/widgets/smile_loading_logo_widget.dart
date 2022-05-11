import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smile_front/app/shared/utils/s3_assets_url.dart';

class SmileLoadingLogoWidget extends StatelessWidget {
  const SmileLoadingLogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: '${s3AssetsBaseUrl}full_logo_dev.png',
      width: 300,
      fit: BoxFit.cover,
    );
  }
}
