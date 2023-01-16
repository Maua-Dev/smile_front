import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../../../shared/themes/app_text_styles.dart';
import '../../../shared/utils/s3_assets_url.dart';
import '../../../shared/widgets/custom_elevated_button_widget.dart';
import '../../login/ui/widgets/maintenance_alert_widget.dart';
import '../../login/ui/widgets/smile_logo_widget.dart';
import '../presenter/controller/resend_confirmation_controller.dart';
import '../../../shared/widgets/input-box/input_box_widget.dart';
import '../../../shared/services/environment/environment_config.dart';

class ResendConfirmationPage extends StatefulWidget {
  const ResendConfirmationPage({Key? key}) : super(key: key);

  @override
  State<ResendConfirmationPage> createState() => _ResendConfirmationPageState();
}

class _ResendConfirmationPageState
    extends ModularState<ResendConfirmationPage, ResendConfirmationController> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    EnvironmentConfig.getConfig() ? null : _showDialog();
  }

  _showDialog() async {
    await Future.delayed(const Duration(milliseconds: 50));
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return const MainstenanceAlert();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(mauaCampusBlurUrl),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: const Color(0xFF000000).withOpacity(0.6),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        const Center(
                          child: SmileLogoWidget(),
                        ),
                        if (MediaQuery.of(context).size.width > 1024)
                          Observer(builder: (_) {
                            if (controller.errors != '') {
                              return Container(
                                width: 300,
                                decoration: BoxDecoration(
                                    color: AppColors.lightRedButton,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0),
                                  child: Text(
                                    controller.errors,
                                    style: AppTextStyles.body.copyWith(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                            }
                            return const SizedBox.shrink();
                          }),
                        const SizedBox(
                          height: 24,
                        ),
                        Observer(builder: (context) {
                          if (controller.emailSent) {
                            return Center(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(42.0),
                                    child: Text(
                                      S
                                          .of(context)
                                          .codeInEmailInstructionsTitle,
                                      textAlign: TextAlign.justify,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  CustomElevatedButtonWidget(
                                    title: S.of(context).returnLogin,
                                    widthSize:
                                        MediaQuery.of(context).size.width < 650
                                            ? MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.85
                                            : 600,
                                    heightSize: 50,
                                    backgroundColor: AppColors.brandingOrange,
                                    onPressed: () {
                                      Modular.to.navigate('/login');
                                    },
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: SizedBox(
                                    width: 600,
                                    child: Text(
                                      S.of(context).errorEmailInstructionsTitle,
                                      style:
                                          const TextStyle(color: Colors.white),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                ),
                                InputBoxWidget(
                                  icon: Icons.person,
                                  placeholder:
                                      S.of(context).registerCPFPlaceholder,
                                  setValue: controller.setCpf,
                                  isCpfField: true,
                                  onFieldSubmitted: (value) async {
                                    if (controller.validateForm()) {
                                      await controller.resendConfirmation();
                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Observer(builder: (_) {
                                  return CustomElevatedButtonWidget(
                                    isLoading: controller.isLoading,
                                    title: S.of(context).sendTitle,
                                    widthSize:
                                        MediaQuery.of(context).size.width < 650
                                            ? MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.85
                                            : 600,
                                    heightSize: 50,
                                    backgroundColor: AppColors.brandingOrange,
                                    onPressed: () async {
                                      if (controller.validateForm()) {
                                        await controller.resendConfirmation();
                                      }
                                    },
                                  );
                                }),
                                const SizedBox(
                                  height: 20,
                                ),
                                CustomElevatedButtonWidget(
                                  title: S.of(context).returnLogin,
                                  widthSize: MediaQuery.of(context).size.width <
                                          650
                                      ? MediaQuery.of(context).size.width * 0.85
                                      : 600,
                                  heightSize: 50,
                                  backgroundColor: AppColors.brandingBlue,
                                  onPressed: () {
                                    Modular.to.navigate('/login');
                                  },
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                              ],
                            );
                          }
                        }),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
