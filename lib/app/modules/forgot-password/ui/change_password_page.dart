import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../../../shared/themes/app_text_styles.dart';
import '../../../shared/widgets/custom_elevated_button_widget.dart';
import '../../../shared/widgets/input-box/input_box_widget.dart';
import '../../login/ui/widgets/smile_logo_widget.dart';
import '../presenter/controller/forgot_password_controller.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState
    extends ModularState<ChangePasswordPage, ForgotPasswordController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: AppColors.backgroundLogin),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                  child: SmileLogoWidget(),
                ),
                Observer(builder: (_) {
                  if (controller.successRegistration) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Container(
                        width: 600,
                        decoration: BoxDecoration(
                            color: Colors.green[100],
                            border: Border.all(color: Colors.green),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            S.of(context).successChangePasswordRedirect,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 18),
                          ),
                        ),
                      ),
                    );
                  } else if (controller.errors != '') {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Container(
                        width: 600,
                        decoration: BoxDecoration(
                            color: Colors.red[100],
                            border: Border.all(color: AppColors.lightRedButton),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    color: Colors.black, fontSize: 18),
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
                Text(
                  S.of(context).insertPasswordCodeInstructions,
                  style: AppTextStyles.headline1.copyWith(
                      color: AppColors.white,
                      fontSize:
                          MediaQuery.of(context).size.width < 1300 ? 20 : 24),
                  textAlign: TextAlign.center,
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
                    showPwd: controller.showPwd,
                    onToggleVisibilityPwd: controller.toggleVisibilityPwd,
                  );
                }),
                const SizedBox(
                  height: 20,
                ),
                Observer(builder: (context) {
                  return InputBoxWidget(
                    icon: Icons.lock,
                    placeholder:
                        S.of(context).registerConfirmPasswordPlaceholder,
                    setValue: controller.setVerifyPassword,
                    isPassword: true,
                    validation: controller.validateVerifyPassword,
                    showPwd: controller.showConfirmPwd,
                    onToggleVisibilityPwd:
                        controller.toggleVisibilityConfirmPwd,
                    onFieldSubmitted: (value) async {
                      if (_formKey.currentState!.validate()) {
                        await controller.changeUserPassword();
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
                    title: S.of(context).changePasswordTitle,
                    widthSize: 600,
                    heightSize: 50,
                    backgroundColor: AppColors.brandingOrange,
                    onPressed: () async {
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                      if (_formKey.currentState!.validate()) {
                        await controller.changeUserPassword();
                      }
                    },
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
