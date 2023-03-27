import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/certificate_controller.dart';
import 'package:smile_front/app/modules/dashboard/ui/user/widgets/certificates/certificate_widget.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../shared/themes/app_text_styles.dart';
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
            child: Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                TextHeader(
                  title: 'Certificados',
                  fontSize: MediaQuery.of(context).size.width < 1000 ? 30 : 38,
                  leftPadding: 12,
                ),
                const SizedBox(
                  height: 16,
                ),
                controller.certificateList.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            Text(
                              'Parece que você não tem nenhum certificado.',
                              textAlign: TextAlign.center,
                              style: AppTextStyles.titleH1.copyWith(
                                  color: AppColors.brandingOrange,
                                  fontSize: 32),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
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
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Center(
                    child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text:
                                'Data limite para alterações no seu certificado: ',
                            style: AppTextStyles.body.copyWith(
                                fontSize:
                                    MediaQuery.of(context).size.width < 1000
                                        ? 18
                                        : 22,
                                color: Colors.black),
                            children: [
                              TextSpan(
                                text: '10/06/2022',
                                style: AppTextStyles.titleH1.copyWith(
                                    fontSize:
                                        MediaQuery.of(context).size.width < 1000
                                            ? 18
                                            : 22,
                                    color: Colors.black),
                              ),
                              TextSpan(
                                text:
                                    '.\nPara isso, basta enviar um e-mail para ',
                                style: AppTextStyles.body.copyWith(
                                    fontSize:
                                        MediaQuery.of(context).size.width < 1000
                                            ? 18
                                            : 22,
                                    color: Colors.black),
                              ),
                              TextSpan(
                                text: 'dev@maua.br',
                                style: AppTextStyles.titleH1.copyWith(
                                    fontSize:
                                        MediaQuery.of(context).size.width < 1000
                                            ? 18
                                            : 22,
                                    color: Colors.black),
                              ),
                              TextSpan(
                                text:
                                    ' com nome completo e e-mail relatando o problema.',
                                style: AppTextStyles.body.copyWith(
                                    fontSize:
                                        MediaQuery.of(context).size.width < 1000
                                            ? 18
                                            : 22,
                                    color: Colors.black),
                              ),
                            ])),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    });
  }
}
