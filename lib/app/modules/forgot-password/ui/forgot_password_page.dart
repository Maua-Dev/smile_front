import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/login/ui/widgets/maintenance_alert_widget.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../../../shared/services/environment/environment_config.dart';
import '../../../shared/themes/app_text_styles.dart';
import '../../../shared/utils/s3_assets_url.dart';
import '../../../shared/widgets/custom_elevated_button_widget.dart';
import '../../login/ui/widgets/smile_logo_widget.dart';
import '../presenter/controller/forgot_password_controller.dart';
import '../../../shared/widgets/input-box/input_box_widget.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState
    extends ModularState<ForgotPasswordPage, ForgotPasswordController> {
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Center(
                        child: SmileLogoWidget(),
                      ),
                      if (MediaQuery.of(context).size.width > 1024)
                        Observer(builder: (_) {
                          if (controller.errors != '') {
                            return Container(
                              width: 500,
                              decoration: BoxDecoration(
                                  color: AppColors.lightRedButton,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
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
                      Observer(builder: (context) {
                        if (controller.emailSent) {
                          return Center(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 32),
                                  child: Text(
                                    S.of(context).codeInEmailInstructionsTitle,
                                    textAlign: TextAlign.justify,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                                CustomElevatedButtonWidget(
                                  title: S.of(context).returnLogin,
                                  widthSize: MediaQuery.of(context).size.width <
                                          650
                                      ? MediaQuery.of(context).size.width * 0.85
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
                                    horizontal: 40, vertical: 32),
                                child: Text(
                                  S.of(context).codeInEmailTitle,
                                  style: const TextStyle(color: Colors.white),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              InputBoxWidget(
                                icon: Icons.person,
                                placeholder:
                                    S.of(context).registerEmailPlaceholder,
                                setValue: controller.setEmail,
                                validation: controller.validateEmail,
                                onFieldSubmitted: (value) async {
                                  if (_formKey.currentState!.validate()) {
                                    await controller.forgotPassword();
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
                                  widthSize: MediaQuery.of(context).size.width <
                                          650
                                      ? MediaQuery.of(context).size.width * 0.85
                                      : 600,
                                  heightSize: 50,
                                  backgroundColor: AppColors.brandingOrange,
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      await controller.forgotPassword();
                                    }
                                  },
                                );
                              }),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomElevatedButtonWidget(
                                title: S.of(context).loginWithoutRecordTitle,
                                widthSize: MediaQuery.of(context).size.width <
                                        650
                                    ? MediaQuery.of(context).size.width * 0.85
                                    : 600,
                                heightSize: 50,
                                backgroundColor: AppColors.brandingBlue,
                                onPressed: () {
                                  Modular.to.navigate('/login/cadastro');
                                },
                              ),
                            ],
                          );
                        }
                      }),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
