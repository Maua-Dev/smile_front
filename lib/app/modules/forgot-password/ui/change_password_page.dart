import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import '../../../shared/utils/s3_assets_url.dart';
import '../../../shared/widgets/custom_elevated_button_widget.dart';
import '../../../shared/widgets/input-box/input_box.dart';
import '../../login/ui/widgets/smile_logo_widget.dart';
import '../presenter/controller/forgot_password_controller.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState
    extends ModularState<ChangePasswordPage, ForgotPasswordController> {
  final _formKey = GlobalKey<FormState>();
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
                    const SizedBox(
                      height: 10,
                    ),
                    Observer(builder: (_) {
                      if (controller.successRegistration) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Container(
                            width: 400,
                            decoration: BoxDecoration(
                                color: Colors.green[100],
                                border: Border.all(color: Colors.green),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                'Senha alterada com sucesso! \n Redirecionando para o login...',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            ),
                          ),
                        );
                      } else if (controller.errors != '') {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Container(
                            width: 450,
                            decoration: BoxDecoration(
                                color: Colors.red[100],
                                border:
                                    Border.all(color: AppColors.lightRedButton),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      controller.setError('');
                                    },
                                    icon: const Icon(Icons.close),
                                  ),
                                  Text(
                                    controller.errors,
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    }),
                    const Text(
                      'Insira sua nova senha e o codigo enviado para o seu e-mail:',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Observer(builder: (context) {
                      return InputBox(
                        icon: Icons.lock,
                        placeholder: 'Senha',
                        setValue: controller.setPassword,
                        isPassword: true,
                        showPwd: controller.showPwd,
                        onToggleVisibilityPwd: controller.toggleVisibilityPwd,
                      );
                    }),
                    const SizedBox(
                      height: 20,
                    ),
                    Observer(builder: (context) {
                      return InputBox(
                        icon: Icons.lock,
                        placeholder: 'Confirme sua senha',
                        setValue: controller.setVerifyPassword,
                        isPassword: true,
                        validation: controller.validateVerifyPassword,
                        showPwd: controller.showConfirmPwd,
                        onToggleVisibilityPwd:
                            controller.toggleVisibilityConfirmPwd,
                        onFieldSubmitted: (value) async {
                          if (_formKey.currentState!.validate()) {
                            await controller.changePassword();
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
                        title: 'Trocar senha',
                        widthSize: MediaQuery.of(context).size.width < 650
                            ? MediaQuery.of(context).size.width * 0.85
                            : 600,
                        heightSize: 50,
                        backgroundColor: AppColors.brandingOrange,
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await controller.changePassword();
                            await controller.analytics.logChangePassword();
                          }
                        },
                      );
                    }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
