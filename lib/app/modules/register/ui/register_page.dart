import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
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
      body: Form(
        key: _formKey,
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/maua_campus_blur.png"),
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
                    Image.asset(
                      'assets/images/logo_smile.png',
                      width: 300,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InputBox(
                      icon: Icons.person,
                      placeholder: 'Nome Completo',
                      setValue: controller.setName,
                      validation: controller.validateName,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InputBox(
                      icon: Icons.person,
                      placeholder: 'CPF / RNE',
                      setValue: controller.setCpf,
                      validation: controller.validateCpf,
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
                          width: 190,
                          height: 60,
                          decoration: BoxDecoration(
                            color: AppColors.gray,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Observer(builder: (_) {
                                return Checkbox(
                                  activeColor: AppColors.brandingPurple,
                                  value: controller.isMauaStudent,
                                  onChanged: (bool? value) {
                                    controller.setIsMauaStudent(value);
                                  },
                                );
                              }),
                              const SizedBox(width: 5),
                              const Text(
                                'Sou Aluno Mauá',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
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
                            widthSize: 400,
                            validation: controller.isMauaStudent
                                ? controller.validateRa
                                : null,
                          );
                        }),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InputBox(
                      icon: Icons.lock,
                      placeholder: 'Senha',
                      setValue: controller.setPassword,
                      isPassword: true,
                      validation: controller.validateName,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InputBox(
                      icon: Icons.lock,
                      placeholder: 'Confirme sua senha',
                      setValue: controller.setVerifyPassword,
                      isPassword: true,
                      validation: controller.validateVerifyPassword,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ActionTextButtonWidget(
                      title: 'Cadastrar',
                      widthSize: 600,
                      heightSize: 50,
                      backgroundColor: AppColors.brandingOrange,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          controller.register();
                          Modular.to.navigate('/login');
                        }
                        controller.register();
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ActionTextButtonWidget(
                      title: 'Já tenho um cadastro',
                      widthSize: 600,
                      heightSize: 50,
                      backgroundColor: AppColors.brandingPurple,
                      onPressed: () {
                        Modular.to.navigate('/login');
                      },
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
