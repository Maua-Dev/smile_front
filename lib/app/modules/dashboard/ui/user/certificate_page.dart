import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/certificate_controller.dart';
import 'package:smile_front/app/modules/dashboard/ui/user/widgets/certificates/certificate_widget.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../shared/themes/app_text_styles.dart';
import '../../../../shared/themes/breakpoint.dart';
import '../../../../shared/widgets/text-header/text_header.dart';

class CertificatePage extends StatefulWidget {
  const CertificatePage({Key? key}) : super(key: key);

  @override
  State<CertificatePage> createState() => _CertificatePageState();
}

class _CertificatePageState
    extends ModularState<CertificatePage, CertificateController> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      if (controller.isLoading) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width < breakpointTablet
                    ? MediaQuery.of(context).size.width
                    : 1165,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      TextHeader(
                        title: S.of(context).drawerCertificatesButton,
                        fontSize:
                            MediaQuery.of(context).size.width < breakpointTablet
                                ? 24
                                : MediaQuery.of(context).size.width > 1000
                                    ? 38
                                    : 30,
                        leftPadding:
                            MediaQuery.of(context).size.width < breakpointMobile
                                ? 24
                                : 0,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      if (controller.certificateList.isEmpty)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 64),
                          child: Text(
                            S.of(context).noCertificatesFoundTitle,
                            textAlign: TextAlign.center,
                            style: AppTextStyles.titleH1.copyWith(
                                color: AppColors.brandingOrange, fontSize: 32),
                          ),
                        )
                      else ...[
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.certificateList.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: CertificateWidget(
                              certificateName:
                                  controller.certificateList[index].name,
                              isLoading: controller.isLoading,
                              onPressed: () async {
                                controller.setIsLoading(true);
                                await launchUrl(
                                  Uri.parse(
                                      controller.certificateList[index].url),
                                  mode: LaunchMode.externalApplication,
                                );
                                controller.setIsLoading(false);
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          child: Center(
                            child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    text: S
                                        .of(context)
                                        .certificatesSubscriptionInfo('title'),
                                    style: AppTextStyles.body.copyWith(
                                        fontSize:
                                            MediaQuery.of(context).size.width <
                                                    1000
                                                ? 18
                                                : 22,
                                        color: Colors.black),
                                    children: [
                                      TextSpan(
                                        text: S
                                            .of(context)
                                            .certificatesSubscriptionInfo(
                                                'date'),
                                        style: AppTextStyles.titleH1.copyWith(
                                            fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width <
                                                    1000
                                                ? 18
                                                : 22,
                                            color: Colors.black),
                                      ),
                                    ])),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
    });
  }
}
