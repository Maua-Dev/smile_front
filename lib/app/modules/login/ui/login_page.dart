import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/login/ui/widgets/maintenance_alert_widget.dart';
import 'package:smile_front/app/modules/login/ui/widgets/smile_logo_widget.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../shared/services/environment/environment_config.dart';
import '../../../shared/themes/app_text_styles.dart';
import '../../../shared/utils/s3_assets_url.dart';
import '../../../shared/widgets/custom_elevated_button_widget.dart';
import '../presenter/controllers/login_controller.dart';
import '../../../shared/widgets/input-box/input_box_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    EnvironmentConfig.getConfig() ? null : _showDialog();
  }

  _showDialog() async {
    await Future.delayed(const Duration(milliseconds: 50));
    if (mounted) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return const MainstenanceAlert();
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                        SizedBox(
                            height: MediaQuery.of(context).size.width < 800
                                ? 80
                                : 150),
                        const Center(
                          child: SmileLogoWidget(),
                        ),
                        if (MediaQuery.of(context).size.width > 1024)
                          Observer(builder: (_) {
                            if (controller.errors != '') {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Container(
                                  width:
                                      controller.errors.length > 40 ? 500 : 300,
                                  decoration: BoxDecoration(
                                      color: AppColors.lightRedButton,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0, horizontal: 4),
                                    child: Text(
                                      controller.errors,
                                      style: AppTextStyles.body.copyWith(
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              );
                            }
                            return const SizedBox.shrink();
                          }),
                        if (controller.errors == '')
                          SizedBox(
                            height: MediaQuery.of(context).size.width < 800
                                ? 16
                                : 32,
                          ),
                        InputBoxWidget(
                          icon: Icons.person,
                          placeholder: S.of(context).loginUsernamePlaceholder,
                          setValue: controller.setUsername,
                          validation: controller.validateCpf,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Observer(builder: (context) {
                          return InputBoxWidget(
                            icon: Icons.lock,
                            placeholder: S.of(context).loginPasswordPlaceholder,
                            setValue: controller.setPassword,
                            isPassword: true,
                            validation: controller.validateField,
                            showPwd: controller.showPwd,
                            onToggleVisibilityPwd:
                                controller.toggleVisibilityPwd,
                            onFieldSubmitted: (p0) async {
                              if (_formKey.currentState!.validate()) {
                                await controller.login();
                              }
                            },
                          );
                        }),
                        const SizedBox(
                          height: 40,
                        ),
                        Observer(builder: (_) {
                          return CustomElevatedButtonWidget(
                            isLoading: controller.isLoading,
                            title: S.of(context).loginTitle,
                            widthSize: MediaQuery.of(context).size.width < 650
                                ? MediaQuery.of(context).size.width * 0.85
                                : 600,
                            heightSize: 50,
                            backgroundColor: AppColors.brandingOrange,
                            onPressed: () async {
                              FocusScopeNode currentFocus =
                                  FocusScope.of(context);
                              if (!currentFocus.hasPrimaryFocus) {
                                currentFocus.unfocus();
                              }
                              if (_formKey.currentState!.validate()) {
                                await controller.login();
                              }
                            },
                          );
                        }),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomElevatedButtonWidget(
                          title: S.of(context).loginWithoutRecordTitle,
                          widthSize: MediaQuery.of(context).size.width < 650
                              ? MediaQuery.of(context).size.width * 0.85
                              : 600,
                          heightSize: 50,
                          backgroundColor: AppColors.brandingBlue,
                          onPressed: () {
                            Modular.to.navigate('/login/cadastro');
                          },
                        ),
                        SizedBox(
                          height:
                              MediaQuery.of(context).size.width < 650 ? 8 : 16,
                        ),
                        TextButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white.withOpacity(0),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 20),
                              textStyle: const TextStyle(
                                fontSize: 20,
                              )),
                          onPressed: () {
                            Modular.to.navigate('/login/esqueci-minha-senha');
                          },
                          child: Text(
                            S.of(context).loginForgotPasswordTitle,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        TextButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white.withOpacity(0),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 10),
                              textStyle: const TextStyle(
                                fontSize: 20,
                              )),
                          onPressed: () {
                            Modular.to.navigate('/login/reenviar-email');
                          },
                          child: Text(
                            S.of(context).loginResendConfirmationTitle,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                          width: (MediaQuery.of(context).size.width < 650
                              ? MediaQuery.of(context).size.width * 0.85
                              : 600),
                          decoration: BoxDecoration(
                              color: AppColors.gray,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () {
                                  launchUrl(
                                    Uri.parse('mailto:dev@maua.br'),
                                    mode: LaunchMode.externalApplication,
                                  );
                                },
                                child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                        text: S
                                            .of(context)
                                            .loginWarningTitle('normalPart'),
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 16),
                                        children: [
                                          TextSpan(
                                            text: S
                                                .of(context)
                                                .loginWarningTitle('boldPart'),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ])),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 60,
                        ),
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
