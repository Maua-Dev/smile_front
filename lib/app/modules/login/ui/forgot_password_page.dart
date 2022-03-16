import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import '../../home/ui/pages/widgets/action_textbutton_widget.dart';
import '../presenter/controllers/login_controller.dart';
import 'widgets/input_box.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState
    extends ModularState<ForgotPassword, LoginController> {
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
                  Center(
                    child: Image.asset(
                      'assets/images/logo_smile.png',
                      width: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Observer(builder: (_) {
                    if (controller.errors != '') {
                      return Container(
                        width: 300,
                        decoration: BoxDecoration(
                            color: Colors.red[100],
                            border: Border.all(color: Colors.red),
                            borderRadius: BorderRadius.circular(8)),
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
                                    color: Colors.black, fontSize: 16),
                              ),
                              const SizedBox(
                                width: 10,
                              )
                            ],
                          ),
                        ),
                      );
                    }
                    return Container();
                  }),
                  const Text(
                    'Uma nova senha será enviada no email cadastrado',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InputBox(
                    icon: Icons.person,
                    placeholder: 'CPF / RNE',
                    setValue: controller.setUsername,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Observer(builder: (_) {
                    return ActionTextButtonWidget(
                      isLoading: controller.isLoading,
                      title: 'Enviar',
                      widthSize: 600,
                      heightSize: 50,
                      backgroundColor: AppColors.brandingOrange,
                      onPressed: () {
                        // gerar nova senha
                      },
                    );
                  }),
                  const SizedBox(
                    height: 20,
                  ),
                  ActionTextButtonWidget(
                    title: 'Não tenho cadastro',
                    widthSize: 600,
                    heightSize: 50,
                    backgroundColor: AppColors.brandingPurple,
                    onPressed: () {
                      Modular.to.navigate('/login/cadastro');
                    },
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
