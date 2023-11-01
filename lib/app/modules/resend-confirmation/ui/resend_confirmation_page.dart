import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../../../shared/themes/app_text_styles.dart';
import '../../../shared/widgets/custom_elevated_button_widget.dart';
import '../../../shared/widgets/input-box/input_box_widget.dart';
import '../../login/ui/widgets/smile_logo_widget.dart';
import '../presenter/controller/resend_confirmation_controller.dart';

class ResendConfirmationPage extends StatefulWidget {
  const ResendConfirmationPage({Key? key}) : super(key: key);

  @override
  State<ResendConfirmationPage> createState() => _ResendConfirmationPageState();
}

class _ResendConfirmationPageState
    extends ModularState<ResendConfirmationPage, ResendConfirmationController> {
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
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                            return Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Container(
                                width: 600,
                                decoration: BoxDecoration(
                                    color: AppColors.lightRedButton,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    controller.errors,
                                    style: AppTextStyles.headline1.copyWith(
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
                      const SizedBox(
                        height: 24,
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
                                    style: AppTextStyles.headline1.copyWith(
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
                                  S.of(context).errorEmailInstructionsTitle,
                                  style: AppTextStyles.headline1.copyWith(
                                      color: AppColors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.width <
                                                  1300
                                              ? 20
                                              : 24),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              InputBoxWidget(
                                icon: Icons.person,
                                isEmail: true,
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
                                      await controller.resendConfirmation();
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
              ),
            )),
      ),
    );
  }
}
