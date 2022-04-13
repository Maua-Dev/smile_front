import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/register/ui/widgets/check_box_widget.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../shared/utils/s3_assets_url.dart';
import '../../home/ui/pages/widgets/action_textbutton_widget.dart';
import '../../../shared/widgets/input-box/input_box.dart';
import '../presenter/controllers/register_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState
    extends ModularState<RegisterPage, RegisterController> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Observer(builder: (context) {
          return Form(
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
                            height: 140,
                          ),
                          CachedNetworkImage(
                            width: 300,
                            fit: BoxFit.cover,
                            imageUrl: smileLogoUrl,
                          ),
                          if (controller.successRegistration)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 32.0, horizontal: 72),
                              child: Center(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: const Center(
                                        child: Text(
                                          'Enviamos um email para você, por favor acesse sua caixa de entrada e clique no link de confirmação para validar seu cadastro.',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          else
                            Column(children: [
                              Observer(builder: (_) {
                                if (controller.errors != '') {
                                  return Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 20.0),
                                    child: Container(
                                      width: 400,
                                      decoration: BoxDecoration(
                                          color: Colors.red[100],
                                          border: Border.all(color: Colors.red),
                                          borderRadius:
                                              BorderRadius.circular(8)),
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
                                                  color: Colors.black,
                                                  fontSize: 16),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                return Container();
                              }),
                              InputBox(
                                icon: Icons.person,
                                placeholder: 'Nome Completo',
                                setValue: controller.setName,
                                validation: controller.validateName,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width <
                                            650
                                        ? MediaQuery.of(context).size.width *
                                            0.35
                                        : 190,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: AppColors.gray,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: MediaQuery.of(context).size.width >
                                            600
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Observer(builder: (_) {
                                                return Checkbox(
                                                  activeColor:
                                                      AppColors.brandingPurple,
                                                  value:
                                                      controller.hasSocialName,
                                                  onChanged: (bool? value) {
                                                    controller.setHasSocialName(
                                                        value);
                                                  },
                                                );
                                              }),
                                              const SizedBox(width: 5),
                                              const Text(
                                                'Nome Social',
                                                style: TextStyle(
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
                                                return Checkbox(
                                                  activeColor:
                                                      AppColors.brandingPurple,
                                                  value:
                                                      controller.hasSocialName,
                                                  onChanged: (bool? value) {
                                                    controller.setHasSocialName(
                                                        value);
                                                  },
                                                );
                                              }),
                                              const SizedBox(width: 5),
                                              const Flexible(
                                                child: Text(
                                                  'Nome Social',
                                                  style: TextStyle(
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
                                      placeholder: 'Nome Social',
                                      setValue: controller.setSocialName,
                                      widthSize: MediaQuery.of(context)
                                                  .size
                                                  .width <
                                              650
                                          ? MediaQuery.of(context).size.width *
                                              0.48
                                          : 400,
                                      validation: controller.validateSocialName,
                                    );
                                  }),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              InputBox(
                                icon: Icons.person,
                                placeholder: 'CPF / RNE',
                                setValue: controller.setCpf,
                                validation: controller.validateCpf,
                                isCpfField: true,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              InputBox(
                                icon: Icons.email_rounded,
                                placeholder: 'E-mail',
                                setValue: controller.setEmail,
                                validation: controller.validateEmail,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width <
                                            650
                                        ? MediaQuery.of(context).size.width *
                                            0.35
                                        : 190,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: AppColors.gray,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: MediaQuery.of(context).size.width >
                                            600
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Observer(builder: (_) {
                                                return Checkbox(
                                                  activeColor:
                                                      AppColors.brandingPurple,
                                                  value:
                                                      controller.isMauaStudent,
                                                  onChanged: (bool? value) {
                                                    controller.setIsMauaStudent(
                                                        value);
                                                  },
                                                );
                                              }),
                                              const SizedBox(width: 5),
                                              const Flexible(
                                                child: Text(
                                                  'Aluno Mauá',
                                                  style: TextStyle(
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
                                                return Checkbox(
                                                  activeColor:
                                                      AppColors.brandingPurple,
                                                  value:
                                                      controller.isMauaStudent,
                                                  onChanged: (bool? value) {
                                                    controller.setIsMauaStudent(
                                                        value);
                                                  },
                                                );
                                              }),
                                              const SizedBox(width: 5),
                                              const Flexible(
                                                child: Text(
                                                  'Aluno Mauá',
                                                  style: TextStyle(
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
                                      disable: !controller.isMauaStudent,
                                      icon: Icons.person,
                                      placeholder: 'RA',
                                      setValue: controller.setRa,
                                      widthSize: MediaQuery.of(context)
                                                  .size
                                                  .width <
                                              650
                                          ? MediaQuery.of(context).size.width *
                                              0.48
                                          : 400,
                                      validation: controller.validateRa,
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
                                  placeholder: 'Senha',
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
                                  placeholder: 'Confirme sua senha',
                                  setValue: controller.setVerifyPassword,
                                  isPassword: true,
                                  validation: controller.validateVerifyPassword,
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
                                  text:
                                      'Tenho ciência de que o evento será todo gravado e fotografado, com a finalidade de divulgação da Smile',
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
                                  text: 'Li e Aceito os Termos de Uso',
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
                                  text:
                                      'Autorizo o envio de notificação por email, para fins de divulgação da Smile',
                                  onChanged: (bool? value) {
                                    controller.setCanSendEmails(value);
                                  },
                                );
                              }),
                              const SizedBox(
                                height: 40,
                              ),
                              Observer(builder: (_) {
                                return ActionTextButtonWidget(
                                  isLoading: controller.isLoading,
                                  title: 'Cadastrar',
                                  widthSize: MediaQuery.of(context).size.width <
                                          650
                                      ? MediaQuery.of(context).size.width * 0.85
                                      : 600,
                                  heightSize: 50,
                                  backgroundColor: AppColors.brandingOrange,
                                  onPressed: controller.acceptTermsOfUse &&
                                          controller.acceptImage
                                      ? () async {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            await controller.register();
                                          }
                                        }
                                      : null,
                                );
                              }),
                              const SizedBox(
                                height: 20,
                              ),
                              ActionTextButtonWidget(
                                title: 'Já tenho um cadastro',
                                widthSize: MediaQuery.of(context).size.width <
                                        650
                                    ? MediaQuery.of(context).size.width * 0.85
                                    : 600,
                                heightSize: 50,
                                backgroundColor: AppColors.brandingPurple,
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
                )),
          );
        }),
      ),
    );
  }
}
