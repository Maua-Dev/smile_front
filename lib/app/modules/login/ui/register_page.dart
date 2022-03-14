import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import '../../home/ui/pages/widgets/action_textbutton_widget.dart';
import '../presenter/controllers/register_controller.dart';
import 'widgets/input_box.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState
    extends ModularState<RegisterPage, RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InputBox(
                    icon: Icons.person,
                    placeholder: 'CPF / RNE',
                    setValue: controller.setCpf,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InputBox(
                    icon: Icons.email_rounded,
                    placeholder: 'E-mail',
                    setValue: controller.setEmail,
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
                                activeColor: AppColors.brandingBlue,
                                value: controller.isMauaStudent,
                                onChanged: (bool? value) {
                                  controller.setIsMauaStudent(value);
                                },
                              );
                            }),
                            const SizedBox(width: 5),
                            const Text(
                              'Sou Aluno Mauá',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
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
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InputBox(
                    icon: Icons.lock,
                    placeholder: 'Confirme sua senha',
                    setValue: controller.setVerifyPassword,
                    isPassword: true,
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
                    backgroundColor: AppColors.brandingBlue,
                    onPressed: () {
                      Modular.to.navigate('/login');
                    },
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
