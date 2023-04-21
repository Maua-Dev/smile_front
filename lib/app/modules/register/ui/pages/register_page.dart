import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/register/ui/widgets/check_box_widget.dart';
import 'package:smile_front/app/modules/register/ui/widgets/dialog/select_role_dialog.dart';
import 'package:smile_front/app/modules/register/ui/widgets/enable_text_field_check_box_widget.dart';
import 'package:smile_front/app/modules/register/ui/widgets/switch_toggle_widget.dart';
import 'package:smile_front/app/shared/entities/infra/user_roles_enum.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import '../../../../../generated/l10n.dart';
import '../../../../shared/themes/app_text_styles.dart';
import '../../../../shared/widgets/custom_elevated_button_widget.dart';
import '../../../../shared/widgets/dialogs/action_confirmation_dialog_widget.dart';
import '../../../../shared/widgets/input-box/input_box_widget.dart';
import '../../../login/ui/widgets/smile_logo_widget.dart';
import '../../presenter/controllers/register_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState
    extends ModularState<RegisterPage, RegisterController> {
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _showSelectRoleDialog();
  }

  _showSelectRoleDialog() async {
    await Future.delayed(const Duration(milliseconds: 50));
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return const SelectRoleDialog();
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
            decoration: BoxDecoration(color: AppColors.backgroundLogin),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Modular.to.navigate('/login');
                          },
                          icon: Icon(
                            Icons.keyboard_arrow_left_rounded,
                            color: AppColors.white,
                            size: 40,
                          )),
                      SizedBox(
                        height:
                            MediaQuery.of(context).size.width < 800 ? 80 : 150,
                      ),
                    ],
                  ),
                  const Center(
                    child: SmileLogoWidget(),
                  ),
                  Column(children: [
                    if (MediaQuery.of(context).size.width > 1024)
                      Observer(builder: (_) {
                        if (controller.errors != '') {
                          return Container(
                            width: 500,
                            decoration: BoxDecoration(
                              color: AppColors.lightRedButton,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 16.0,
                              ),
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
                    Observer(builder: (_) {
                      return CustomElevatedButtonWidget(
                        title: controller.role.personalizedNamed.toUpperCase(),
                        backgroundColor: AppColors.brandingOrange,
                        widthSize: MediaQuery.of(context).size.width < 650
                            ? MediaQuery.of(context).size.width * 0.85
                            : 600,
                        heightSize: 50,
                        onPressed: () {
                          _showSelectRoleDialog();
                        },
                      );
                    }),
                    const SizedBox(
                      height: 20,
                    ),
                    InputBoxWidget(
                      icon: Icons.person,
                      placeholder: S.of(context).registerFullNamePlaceholder,
                      setValue: controller.setName,
                      validation: controller.validateName,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Container(
                            width: MediaQuery.of(context).size.width < 650
                                ? MediaQuery.of(context).size.width * 0.35
                                : 190,
                            height: 60,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Observer(builder: (_) {
                              return EnableTextFieldCheckBoxWidget(
                                check: controller.hasSocialName,
                                onChanged: controller.setHasSocialName,
                                title:
                                    S.of(context).registerSocialNamePlaceholder,
                                tooltipButton: Tooltip(
                                  triggerMode: TooltipTriggerMode.tap,
                                  message:
                                      S.of(context).registerSocialNameTooltip,
                                  child: Icon(Icons.help,
                                      color: AppColors.brandingOrange),
                                ),
                              );
                            }),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Observer(builder: (_) {
                          return InputBoxWidget(
                            disable: !controller.hasSocialName,
                            icon: Icons.person,
                            placeholder:
                                S.of(context).registerSocialNamePlaceholder,
                            setValue: controller.setSocialName,
                            widthSize: MediaQuery.of(context).size.width < 650
                                ? MediaQuery.of(context).size.width * 0.48
                                : 400,
                            validation: controller.validateSocialName,
                          );
                        }),
                      ],
                    ),
                    Observer(builder: (_) {
                      return InputBoxWidget(
                        isEmail: true,
                        icon: Icons.email_rounded,
                        placeholder: controller.role == UserRolesEnum.PROFESSOR
                            ? S.of(context).registerEmailProfessorPlaceholder
                            : S.of(context).registerEmailPlaceholder,
                        setValue: controller.setEmail,
                        validation: controller.validateEmail,
                      );
                    }),
                    InputBoxWidget(
                      isEmail: true,
                      icon: Icons.email_rounded,
                      placeholder: controller.role == UserRolesEnum.PROFESSOR
                          ? S
                              .of(context)
                              .registerEmailProfessorConfirmationPlaceholder
                          : S.of(context).registerEmailConfirmationPlaceholder,
                      setValue: controller.setVerifyEmail,
                      validation: controller.validateVerifyEmail,
                    ),
                    Observer(builder: (_) {
                      if (controller.role == UserRolesEnum.STUDENT) {
                        return InputBoxWidget(
                          isRAField: true,
                          icon: Icons.person,
                          placeholder: S.of(context).registerRAPlaceholder,
                          setValue: controller.setRa,
                          validation: controller.validateRa,
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    }),
                    Observer(builder: (context) {
                      return InputBoxWidget(
                        icon: Icons.lock,
                        placeholder: S.of(context).loginPasswordPlaceholder,
                        setValue: controller.setPassword,
                        isPassword: true,
                        showPwd: controller.showPwd,
                        onToggleVisibilityPwd: controller.toggleVisibilityPwd,
                        validation: controller.validatePassword,
                      );
                    }),
                    Observer(builder: (context) {
                      return InputBoxWidget(
                        icon: Icons.lock,
                        placeholder:
                            S.of(context).registerConfirmPasswordPlaceholder,
                        setValue: controller.setVerifyPassword,
                        isPassword: true,
                        showPwd: controller.showConfirmPwd,
                        onToggleVisibilityPwd:
                            controller.toggleVisibilityConfirmPwd,
                        validation: controller.validateVerifyPassword,
                      );
                    }),
                    const SizedBox(
                      height: 20,
                    ),
                    Observer(builder: (_) {
                      return CheckBoxWidget(
                        check: controller.acceptTermsOfUse,
                        title: S.of(context).registerTerms('two'),
                        link:
                            'https://www.maua.br/a-maua/politica-de-privacidade',
                        onChanged: (bool? value) {
                          controller.setAcceptTermsOfUse(value);
                        },
                      );
                    }),
                    const SizedBox(
                      height: 12,
                    ),
                    Observer(builder: (_) {
                      return SwitchToggleWidget(
                        isSwitched: controller.acceptEmailNotifications,
                        tipo: S.of(context).notificationsSchema('email'),
                        onChanged: (bool? value) {
                          controller.setEmailNotifications(value);
                        },
                      );
                    }),
                    const SizedBox(
                      height: 16,
                    ),
                    Observer(builder: (_) {
                      return CustomElevatedButtonWidget(
                        isLoading: controller.isLoading,
                        title: S.of(context).registerTitle,
                        widthSize: MediaQuery.of(context).size.width < 650
                            ? MediaQuery.of(context).size.width * 0.85
                            : 600,
                        heightSize: 50,
                        backgroundColor: AppColors.brandingOrange,
                        onPressed: controller.acceptTermsOfUse
                            ? () async {
                                FocusScopeNode currentFocus =
                                    FocusScope.of(context);
                                if (!currentFocus.hasPrimaryFocus) {
                                  currentFocus.unfocus();
                                }
                                if (_formKey.currentState!.validate()) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ActionConfirmationDialogWidget(
                                        title: S
                                            .of(context)
                                            .confirmEmailAndPhoneNotificationTitle(
                                                controller.email),
                                        content: S
                                            .of(context)
                                            .confirmEmailNotificationSubtitle,
                                        onPressed: () async {
                                          Navigator.of(context).pop();
                                          await controller.register();
                                          if (controller.successRegistration) {
                                            Modular.to.navigate(
                                                '/login/cadastro/email');
                                          }
                                        },
                                        isLoading: controller.isLoading,
                                      );
                                    },
                                  );
                                }
                              }
                            : null,
                      );
                    }),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomElevatedButtonWidget(
                      title: S.of(context).haveRegistrationTitle,
                      widthSize: MediaQuery.of(context).size.width < 650
                          ? MediaQuery.of(context).size.width * 0.85
                          : 600,
                      heightSize: 50,
                      backgroundColor: AppColors.white,
                      fontColor: AppColors.backgroundLogin,
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
            )),
      )),
    );
  }
}
