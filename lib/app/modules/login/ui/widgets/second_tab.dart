import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:smile_front/app/modules/home/ui/pages/widgets/action_textbutton_widget.dart';
import 'package:smile_front/app/modules/login/presenter/controllers/register_controller.dart';
import 'package:smile_front/app/modules/login/ui/widgets/input_box.dart';
import 'package:smile_front/app/modules/login/ui/widgets/radios_ask_buttons.dart';

import '../../../../shared/themes/app_colors.dart';

class SecondTab extends StatefulWidget {
  const SecondTab({
    Key? key,
  }) : super(key: key);

  @override
  State<SecondTab> createState() => _SecondTabState();
}

class _SecondTabState extends ModularState<SecondTab, RegisterController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: Form(
            key: _formKey,
            child: Container(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height * 0.52,
                ),
                width: MediaQuery.of(context).size.width * 0.52,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(7),
                    bottomRight: Radius.circular(7),
                    topLeft: Radius.circular(7),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InputBox(
                        validation: controller.validateName,
                        heightSize: 50,
                        icon: Icons.person,
                        placeholder: 'Nome Completo',
                        setValue: controller.setName,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InputBox(
                            validation: controller.validateName,
                            heightSize: 50,
                            widthSize: 190,
                            icon: Icons.person,
                            placeholder: 'CPF',
                            setValue: controller.setCpf,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          InputBox(
                            validation: controller.validateEmail,
                            heightSize: 50,
                            widthSize: 390,
                            icon: Icons.mail,
                            placeholder: 'Email',
                            setValue: controller.setEmail,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Observer(builder: (context) {
                            return RadioAskButtons(
                              question: 'Aluno Mauá?',
                              awnser: controller.isMauaStudent,
                              widthSize: 290,
                              onPressed: controller.setIsMauaStudent,
                            );
                          }),
                          const SizedBox(
                            width: 20,
                          ),
                          Observer(builder: (context) {
                            return InputBox(
                              validation: controller.validateRa,
                              disable: !(controller.isMauaStudent),
                              heightSize: 50,
                              widthSize: 290,
                              icon: Icons.lock,
                              placeholder: 'RA',
                              setValue: controller.setRa,
                            );
                          }),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InputBox(
                            validation: controller.validateName,
                            heightSize: 50,
                            widthSize: 290,
                            icon: Icons.lock,
                            placeholder: 'Senha',
                            setValue: controller.setPassword,
                            isPassword: true,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          InputBox(
                            validation: controller.validateVerifyPassword,
                            heightSize: 50,
                            widthSize: 290,
                            icon: Icons.lock,
                            placeholder: 'Confirmar Senha',
                            setValue: controller.setVerifyPassword,
                            isPassword: true,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Observer(builder: (context) {
                        return RadioAskButtons(
                          question: 'Deseja receber notificações por Email?',
                          awnser: controller.aceptEmailNotifications,
                          onPressed: controller.setAceptEmailNotification,
                        );
                      }),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('Já Tenho Cadastro'),
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: ActionTextButtonWidget(
                              title: 'Cadastrar-se',
                              widthSize: 160,
                              heightSize: 50,
                              backgroundColor: AppColors.brandingOrange,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  controller.register();
                                  Modular.to.pushNamed('/login');
                                }
                              },
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )),
          ),
        ),
      ],
    );
  }
}
