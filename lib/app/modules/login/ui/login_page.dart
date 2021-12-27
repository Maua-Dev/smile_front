import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/login/presenter/controllers/register_controller.dart';
import 'package:smile_front/app/modules/login/ui/widgets/login_tab_bar.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/maua_campus_blur.png"),
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.23,
                vertical: MediaQuery.of(context).size.height * 0.13),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: AppColors.brandingBlue,
              ),
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.036,
                  left: MediaQuery.of(context).size.width * 0.044,
                  right: MediaQuery.of(context).size.width * 0.044,
                  bottom: MediaQuery.of(context).size.height * 0.01,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: SizedBox(
                          child: Image.asset('assets/images/logo_smile.png')),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Center(
                        // child: SizedBox(height: 450, child: LoginTabBar())),
                        child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.55,
                            child: const LoginTabBar())),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
