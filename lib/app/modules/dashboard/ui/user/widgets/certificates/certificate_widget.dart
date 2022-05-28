import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../shared/themes/app_colors.dart';
import '../../../../../../shared/themes/app_text_styles.dart';

class CertificateWidget extends StatelessWidget {
  final String certificateName;
  final String certificateUrl;
  const CertificateWidget(
      {Key? key, required this.certificateName, required this.certificateUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: () async {
          await launchUrl(
            Uri.parse(certificateUrl),
            mode: LaunchMode.externalApplication,
          );
        },
        child: Column(
          children: [
            Text(
              certificateName,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.titleH1.copyWith(
                  fontSize: MediaQuery.of(context).size.width < 800 ? 20 : 24,
                  color: AppColors.brandingPurple),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width < 1000 ? 4 : 8,
            ),
            Icon(
              Icons.file_download,
              color: AppColors.brandingPurple,
              size: 40,
            )
          ],
        ),
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            primary: AppColors.lilac,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
      ),
    );
  }
}
