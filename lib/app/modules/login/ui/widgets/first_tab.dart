import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/home/ui/pages/widgets/action_textbutton_widget.dart';
import 'package:smile_front/app/modules/login/ui/widgets/input_box.dart';

import '../../../../shared/themes/app_colors.dart';

class FirstTab extends StatelessWidget {
  const FirstTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          // height: MediaQuery.of(context).size.height * 0.52,
          width: MediaQuery.of(context).size.width * 0.52,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(7),
              bottomRight: Radius.circular(7),
              topRight: Radius.circular(7),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const InputBox(
                icon: Icons.person,
                placeholder: 'Usuário',
              ),
              const SizedBox(
                height: 20,
              ),
              const InputBox(
                icon: Icons.lock,
                placeholder: 'Senha',
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Esqueci minha senha'),
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: ActionTextButtonWidget(
                      title: 'Logar',
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
