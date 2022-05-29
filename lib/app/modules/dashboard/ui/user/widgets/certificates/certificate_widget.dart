import 'package:flutter/material.dart';

import '../../../../../../shared/themes/app_colors.dart';
import '../../../../../../shared/themes/app_text_styles.dart';

class CertificateWidget extends StatelessWidget {
  final String certificateName;
  final Function()? onPressed;
  final bool isLoading;
  const CertificateWidget(
      {Key? key,
      required this.certificateName,
      this.onPressed,
      required this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                certificateName,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.body.copyWith(
                    fontSize:
                        MediaQuery.of(context).size.width < 1000 ? 18 : 22,
                    color: AppColors.brandingPurple),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            isLoading
                ? const CircularProgressIndicator()
                : Icon(
                    Icons.file_download,
                    color: AppColors.brandingPurple,
                    size: 40,
                  )
          ],
        ),
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: MediaQuery.of(context).size.width < 1000 ? 24 : 32),
            primary: AppColors.lilac,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            )),
      ),
    );
  }
}
