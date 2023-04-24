import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../../../shared/themes/app_text_styles.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: AppColors.backgroundLogin),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    SizedBox(
                      width: 600,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                Modular.to.navigate('/login');
                              },
                              icon: Icon(
                                Icons.keyboard_arrow_left_rounded,
                                color: AppColors.white,
                                size: 40,
                              )),
                          const SizedBox(
                            height: 80,
                          ),
                        ],
                      ),
                    ),
                    const Center(
                      child: SmileLogoWidget(),
                    ),
                    if (MediaQuery.of(context).size.width > 1024)
                      Observer(builder: (_) {
                        if (controller.errors != '') {
                          return Container(
                            width: 600,
                            decoration: BoxDecoration(
                                color: AppColors.lightRedButton,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
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
                      height: 16,
                    ),
                    Observer(builder: (context) {
                      if (controller.emailSent) {
                        return Center(
                          child: Column(
                            children: [
                              SizedBox(
                                width: 600,
                                child: Text(
                                  S.of(context).codeInEmailInstructionsTitle,
                                  textAlign: TextAlign.justify,
                                  style: AppTextStyles.body.copyWith(
                                      color: AppColors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.width <
                                                  1300
                                              ? 20
                                              : 24),
                                ),
                              ),
                              CustomElevatedButtonWidget(
                                title: S.of(context).returnLogin,
                                widthSize: 600,
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
                            SizedBox(
                              width: 600,
                              child: Text(
                                S.of(context).codeInEmailTitle,
                                style: AppTextStyles.body.copyWith(
                                    color: AppColors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.width < 1300
                                            ? 20
                                            : 24),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            InputBoxWidget(
                              isEmail: true,
                              icon: Icons.person,
                              placeholder:
                                  S.of(context).registerEmailPlaceholder,
                              setValue: controller.setEmail,
                              validation: controller.validateEmail,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Observer(builder: (_) {
                              return CustomElevatedButtonWidget(
                                isLoading: controller.isLoading,
                                title: S.of(context).sendTitle,
                                widthSize: 600,
                                heightSize: 50,
                                backgroundColor: AppColors.brandingOrange,
                                onPressed: () async {
                                  FocusScopeNode currentFocus =
                                      FocusScope.of(context);
                                  if (!currentFocus.hasPrimaryFocus) {
                                    currentFocus.unfocus();
                                  }
                                  if (_formKey.currentState!.validate()) {
                                    await controller.forgotUserPassword();
                                  }
                                },
                              );
                            }),
                          ],
                        );
                      }
                    }),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
