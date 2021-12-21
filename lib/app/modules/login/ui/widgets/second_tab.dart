import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/home/ui/pages/widgets/action_textbutton_widget.dart';
import 'package:smile_front/app/modules/login/ui/widgets/input_box.dart';
import 'package:smile_front/app/modules/login/ui/widgets/radios_ask_buttons.dart';

import '../../../../shared/themes/app_colors.dart';

class SecondTab extends StatefulWidget {
  const SecondTab({Key? key}) : super(key: key);

  @override
  State<SecondTab> createState() => _SecondTabState();
}

class _SecondTabState extends State<SecondTab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          // height: MediaQuery.of(context).size.height * 0.52,
          // height: 1000,
          // height: MediaQuery.of(context).size.height * 0.7,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const InputBox(
                heightSize: 50,
                icon: Icons.person,
                placeholder: 'Nome Completo',
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  InputBox(
                    heightSize: 50,
                    widthSize: 190,
                    icon: Icons.person,
                    placeholder: 'CPF',
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InputBox(
                    heightSize: 50,
                    widthSize: 390,
                    icon: Icons.mail,
                    placeholder: 'Email',
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  RadioAskButtons(
                    question: 'Aluno Mauá?',
                    awnser: true,
                    widthSize: 290,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InputBox(
                    disable: true,
                    heightSize: 50,
                    widthSize: 290,
                    icon: Icons.lock,
                    placeholder: 'RA',
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  InputBox(
                    heightSize: 50,
                    widthSize: 290,
                    icon: Icons.lock,
                    placeholder: 'Senha',
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InputBox(
                    heightSize: 50,
                    widthSize: 290,
                    icon: Icons.lock,
                    placeholder: 'Confirmar Senha',
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              // Container(
              //   width: 600,
              //   height: 50,
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.circular(10),
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.black.withOpacity(0.2),
              //         spreadRadius: 1,
              //         blurRadius: 10,
              //         offset: const Offset(1, 1),
              //       ),
              //     ],
              //   ),
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         const Text(
              //           'Deseja receber notificações por Email?',
              //           style: TextStyle(fontSize: 15),
              //         ),
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Container(
              //               width: 16,
              //               height: 16,
              //               decoration: BoxDecoration(
              //                   color: AppColors.brandingBlue,
              //                   borderRadius: BorderRadius.circular(8)),
              //             ),
              //             const SizedBox(width: 6),
              //             const Text(
              //               'Sim',
              //               style: TextStyle(fontSize: 15),
              //             ),
              //             const SizedBox(width: 20),
              //             Container(
              //               width: 16,
              //               height: 16,
              //               decoration: BoxDecoration(
              //                   color: AppColors.brandingBlue,
              //                   borderRadius: BorderRadius.circular(8)),
              //             ),
              //             const SizedBox(width: 6),
              //             const Text(
              //               'Não',
              //               style: TextStyle(fontSize: 15),
              //             ),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              const RadioAskButtons(
                question: 'Deseja receber notificações por Email?',
                awnser: true,
              ),
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
                        Modular.to.pushNamed('/login');
                      },
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}
