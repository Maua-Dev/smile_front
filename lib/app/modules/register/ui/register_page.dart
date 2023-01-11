import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/login/ui/widgets/maintenance_alert_widget.dart';

import 'package:smile_front/app/modules/register/ui/widgets/check_box_widget.dart';
import 'package:smile_front/app/modules/register/ui/widgets/switch_toggle_widget.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../../../shared/error/error_snackbar.dart';
import '../../../shared/themes/app_text_styles.dart';
import '../../../shared/utils/s3_assets_url.dart';
import '../../../shared/widgets/custom_elevated_button_widget.dart';
import '../../../shared/widgets/dialogs/action_confirmation_dialog_widget.dart';
import '../../../shared/widgets/input-box/input_box.dart';
import '../../login/ui/widgets/smile_logo_widget.dart';
import '../presenter/controllers/register_controller.dart';
import '../../../shared/services/environment/environment_config.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState
    extends ModularState<RegisterPage, RegisterController> {
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
        child: Observer(builder: (context) {
          return Container(
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
                          height: MediaQuery.of(context).size.width < 650
                              ? 40
                              : 140,
                        ),
                        const Center(
                          child: SmileLogoWidget(),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        if (controller.successRegistration)
                          const Center(
                            child: Text(
                              'Enviamos um email (no-reply@verificationemail.com) para você, por favor, verifique sua caixa de entrada, spam ou promocional e clique no link de confirmação para validar seu cadastro.',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        else
                          Column(children: [
                            if (MediaQuery.of(context).size.width > 1024)
                              Observer(builder: (_) {
                                if (controller.errors != '') {
                                  return Container(
                                    width: 500,
                                    decoration: BoxDecoration(
                                        color: AppColors.lightRedButton,
                                        borderRadius:
                                            BorderRadius.circular(10)),
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
                            InputBox(
                              icon: Icons.person,
                              placeholder:
                                  S.of(context).registerFullNamePlaceholder,
                              setValue: controller.setName,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width < 650
                                      ? MediaQuery.of(context).size.width * 0.35
                                      : 190,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: AppColors.gray,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: MediaQuery.of(context).size.width > 600
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Observer(builder: (_) {
                                              return Checkbox(
                                                activeColor:
                                                    AppColors.brandingBlue,
                                                value: controller.hasSocialName,
                                                onChanged: (bool? value) {
                                                  controller
                                                      .setHasSocialName(value);
                                                },
                                              );
                                            }),
                                            const SizedBox(width: 5),
                                            Text(
                                              S
                                                  .of(context)
                                                  .registerSocialNamePlaceholder,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14),
                                            )
                                          ],
                                        )
                                      : Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Observer(builder: (_) {
                                              return SizedBox(
                                                height: 24,
                                                width: 24,
                                                child: Checkbox(
                                                  activeColor:
                                                      AppColors.brandingBlue,
                                                  value:
                                                      controller.hasSocialName,
                                                  onChanged: (bool? value) {
                                                    controller.setHasSocialName(
                                                        value);
                                                  },
                                                ),
                                              );
                                            }),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            Flexible(
                                              child: Text(
                                                S
                                                    .of(context)
                                                    .registerSocialNamePlaceholder,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14),
                                              ),
                                            )
                                          ],
                                        ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Observer(builder: (_) {
                                  return InputBox(
                                    disable: !controller.hasSocialName,
                                    icon: Icons.person,
                                    placeholder: S
                                        .of(context)
                                        .registerSocialNamePlaceholder,
                                    setValue: controller.setSocialName,
                                    widthSize:
                                        MediaQuery.of(context).size.width < 650
                                            ? MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.48
                                            : 400,
                                  );
                                }),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            InputBox(
                              icon: Icons.person,
                              placeholder: S.of(context).registerCPFPlaceholder,
                              setValue: controller.setCpf,
                              isCpfField: true,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            InputBox(
                              icon: Icons.email_rounded,
                              placeholder:
                                  S.of(context).registerEmailPlaceholder,
                              setValue: controller.setEmail,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            InputBox(
                              icon: Icons.email_rounded,
                              placeholder: S
                                  .of(context)
                                  .registerEmailConfirmationPlaceholder,
                              setValue: controller.setVerifyEmail,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            InputBox(
                              icon: Icons.phone_rounded,
                              placeholder:
                                  S.of(context).registerPhonePlaceholder,
                              setValue: controller.setPhone,
                              isPhoneField: true,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width < 650
                                      ? MediaQuery.of(context).size.width * 0.35
                                      : 190,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: AppColors.gray,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: MediaQuery.of(context).size.width > 600
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Observer(builder: (_) {
                                              return Checkbox(
                                                activeColor:
                                                    AppColors.brandingBlue,
                                                value: controller.isMauaStudent,
                                                onChanged: (bool? value) {
                                                  controller
                                                      .setIsMauaStudent(value);
                                                },
                                              );
                                            }),
                                            const SizedBox(width: 5),
                                            Flexible(
                                              child: Text(
                                                S
                                                    .of(context)
                                                    .registerStudentMauaPlaceholder,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14),
                                              ),
                                            )
                                          ],
                                        )
                                      : Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Observer(builder: (_) {
                                              return SizedBox(
                                                height: 24,
                                                width: 24,
                                                child: Checkbox(
                                                  activeColor:
                                                      AppColors.brandingBlue,
                                                  value:
                                                      controller.isMauaStudent,
                                                  onChanged: (bool? value) {
                                                    controller.setIsMauaStudent(
                                                        value);
                                                  },
                                                ),
                                              );
                                            }),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            Flexible(
                                              child: Text(
                                                S
                                                    .of(context)
                                                    .registerStudentMauaPlaceholder,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14),
                                              ),
                                            )
                                          ],
                                        ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Observer(builder: (_) {
                                  return InputBox(
                                    isRAField: true,
                                    disable: !controller.isMauaStudent,
                                    icon: Icons.person,
                                    placeholder:
                                        S.of(context).registerRAPlaceholder,
                                    setValue: controller.setRa,
                                    widthSize:
                                        MediaQuery.of(context).size.width < 650
                                            ? MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.48
                                            : 400,
                                  );
                                }),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Observer(builder: (context) {
                              return InputBox(
                                icon: Icons.lock,
                                placeholder:
                                    S.of(context).loginPasswordPlaceholder,
                                setValue: controller.setPassword,
                                isPassword: true,
                                showPwd: controller.showPwd,
                                onToggleVisibilityPwd:
                                    controller.toggleVisibilityPwd,
                              );
                            }),
                            const SizedBox(
                              height: 20,
                            ),
                            Observer(builder: (context) {
                              return InputBox(
                                icon: Icons.lock,
                                placeholder: S
                                    .of(context)
                                    .registerConfirmPasswordPlaceholder,
                                setValue: controller.setVerifyPassword,
                                isPassword: true,
                                showPwd: controller.showConfirmPwd,
                                onToggleVisibilityPwd:
                                    controller.toggleVisibilityConfirmPwd,
                              );
                            }),
                            const SizedBox(
                              height: 20,
                            ),
                            Observer(builder: (_) {
                              return CheckBoxWidget(
                                check: controller.acceptImage,
                                text: S.of(context).registerTerms('one'),
                                onChanged: (bool? value) {
                                  controller.setAcceptImage(value);
                                },
                              );
                            }),
                            const SizedBox(
                              height: 20,
                            ),
                            Observer(builder: (_) {
                              return CheckBoxWidget(
                                check: controller.acceptTermsOfUse,
                                text: S.of(context).registerTerms('two'),
                                link:
                                    'https://www.maua.br/a-maua/politica-de-privacidade',
                                onChanged: (bool? value) {
                                  controller.setAcceptTermsOfUse(value);
                                },
                              );
                            }),
                            const SizedBox(
                              height: 20,
                            ),
                            Observer(builder: (_) {
                              return CheckBoxWidget(
                                check: controller.canSendEmails,
                                text: S.of(context).registerTerms('three'),
                                onChanged: (bool? value) {
                                  controller.setCanSendEmails(value);
                                },
                              );
                            }),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width < 650
                                  ? MediaQuery.of(context).size.width * 0.85
                                  : 550,
                              height: 32,
                              child: Text(
                                S.of(context).notificationsTitle,
                                style: AppTextStyles.body.copyWith(
                                  color: AppColors.white,
                                  fontSize: 24,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Observer(builder: (_) {
                              return SwitchToggleWidget(
                                tipo:
                                    S.of(context).notificationsSchema('email'),
                                onChanged: (bool? value) {
                                  controller.setEmailNotifications(value);
                                },
                              );
                            }),
                            const SizedBox(
                              height: 16,
                            ),
                            Observer(builder: (_) {
                              return SwitchToggleWidget(
                                  tipo:
                                      S.of(context).notificationsSchema('sms'),
                                  onChanged: (bool? value) {
                                    controller.setSMSNotifications(value);
                                  });
                            }),
                            const SizedBox(
                              height: 16,
                            ),
                            Observer(builder: (_) {
                              return SwitchToggleWidget(
                                  tipo: S
                                      .of(context)
                                      .notificationsSchema('whatsapp'),
                                  onChanged: (bool? value) {
                                    controller.setWPPNotifications(value);
                                  });
                            }),
                            const SizedBox(
                              height: 16,
                            ),
                            Observer(builder: (_) {
                              return SwitchToggleWidget(
                                  tipo:
                                      S.of(context).notificationsSchema('app'),
                                  onChanged: (bool? value) {
                                    controller.setAPPWEBNotifications(value);
                                  });
                            }),
                            const SizedBox(
                              height: 30,
                            ),
                            Observer(builder: (_) {
                              return CustomElevatedButtonWidget(
                                isLoading: controller.isLoading,
                                title: S.of(context).registerTitle,
                                widthSize: MediaQuery.of(context).size.width <
                                        650
                                    ? MediaQuery.of(context).size.width * 0.85
                                    : 600,
                                heightSize: 50,
                                backgroundColor: AppColors.brandingOrange,
                                onPressed: controller.acceptTermsOfUse &&
                                        controller.acceptImage
                                    ? () async {
                                        if (controller.validateForm()) {
                                          if (controller
                                              .showDialogToConfirmEmail) {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return ActionConfirmationDialogWidget(
                                                  title:
                                                      'Tem certeza que seu e-mail (${controller.email}) está correto?',
                                                  content:
                                                      'Será necessário acessar sua caixa de entrada para validar seu cadastro.',
                                                  onPressed: () async {
                                                    controller
                                                        .setShowDialogToConfirmEmail(
                                                            false);
                                                    Navigator.of(context).pop();
                                                    await controller.register();
                                                  },
                                                  isLoading:
                                                      controller.isLoading,
                                                );
                                              },
                                            );
                                          } else {
                                            await controller.register();
                                          }
                                        } else if (MediaQuery.of(context)
                                                .size
                                                .width <=
                                            1024) {
                                          showErrorSnackBar(
                                              errorMessage: controller.errors,
                                              color: AppColors.redButton);
                                        }
                                      }
                                    : null,
                              );
                            }),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomElevatedButtonWidget(
                              title: 'Já tenho um cadastro',
                              widthSize: MediaQuery.of(context).size.width < 650
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
                          ]),
                      ],
                    ),
                  ),
                ],
              ));
        }),
      ),
    );
  }
}
