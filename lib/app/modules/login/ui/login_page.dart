import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import '../../home/ui/pages/widgets/action_textbutton_widget.dart';
import '../presenter/controllers/login_controller.dart';
import 'widgets/input_box.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
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
                    height: 20,
                  ),
                  InputBox(
                    icon: Icons.person,
                    placeholder: 'CPF / RNE ou E-mail',
                    setValue: controller.setUsername,
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
                    height: 40,
                  ),
                  ActionTextButtonWidget(
                    title: 'Login',
                    widthSize: 600,
                    heightSize: 50,
                    backgroundColor: AppColors.brandingOrange,
                    onPressed: () {
                      controller.login();
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ActionTextButtonWidget(
                    title: 'Não tenho cadastro',
                    widthSize: 600,
                    heightSize: 50,
                    backgroundColor: AppColors.brandingBlue,
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
