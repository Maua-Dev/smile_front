// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/themes/app_colors.dart';
import '../../../../../shared/themes/app_text_styles.dart';
import 'package:smile_front/app/shared/helpers/services/s3/assets_s3.dart';

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
                style: AppTextStyles.headline1
                    .copyWith(color: AppColors.white, fontSize: 50))));
  }
}
