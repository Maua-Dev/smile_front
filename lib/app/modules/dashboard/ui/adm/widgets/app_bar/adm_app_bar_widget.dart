// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../shared/themes/app_colors.dart';
import '../../../../../../shared/themes/app_text_styles.dart';
import '../../../../../../shared/utils/s3_assets_url.dart';

class AdmAppBarWidget extends StatelessWidget {
  final String appBarText;
  const AdmAppBarWidget({
    Key? key,
    required this.appBarText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        toolbarHeight: 73,
        elevation: 0,
        backgroundColor: AppColors.brandingBlue,
        leadingWidth: 115,
        leading: Image(
          image: CachedNetworkImageProvider(smileLaranjaLogoUrl),
        ),
        title: Align(
            alignment: Alignment.center,
            child: Text(appBarText,
                style: AppTextStyles.body
                    .copyWith(color: AppColors.white, fontSize: 50))));
  }
}
