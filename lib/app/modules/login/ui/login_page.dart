import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/login/ui/widgets/smile_logo_widget.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import '../../../shared/utils/s3_assets_url.dart';
import '../../../shared/widgets/custom_elevated_button_widget.dart';
import '../presenter/controllers/login_controller.dart';
import '../../../shared/widgets/input-box/input_box.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
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
                        SizedBox(
                          height: MediaQuery.of(context).size.width < 650
                              ? 40
                              : 140,
                        ),
                        const Center(
                          child: SmileLogoWidget(),
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
                        const SizedBox(
                          height: 20,
                        ),
                        InputBox(
                          icon: Icons.person,
                          placeholder: 'CPF ou E-mail',
                          setValue: controller.setUsername,
                          validation: controller.validateCpf,
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
                            onFieldSubmitted: (value) async {
                              if (_formKey.currentState!.validate()) {
                                await controller.login();
                              }
                            },
                            validation: controller.validateField,
                            showPwd: controller.showPwd,
                            onToggleVisibilityPwd:
                                controller.toggleVisibilityPwd,
                          );
                        }),
                        const SizedBox(
                          height: 40,
                        ),
                        Observer(builder: (_) {
                          return CustomElevatedButtonWidget(
                            isLoading: controller.isLoading,
                            title: 'Login',
                            widthSize: MediaQuery.of(context).size.width < 650
                                ? MediaQuery.of(context).size.width * 0.85
                                : 600,
                            heightSize: 50,
                            backgroundColor: AppColors.brandingOrange,
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                await controller.login();
                              }
                            },
                          );
                        }),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomElevatedButtonWidget(
                          title: 'Não tenho cadastro',
                          widthSize: MediaQuery.of(context).size.width < 650
                              ? MediaQuery.of(context).size.width * 0.85
                              : 600,
                          heightSize: 50,
                          backgroundColor: AppColors.brandingPurple,
                          onPressed: () {
                            Modular.to.navigate('/login/cadastro');
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white.withOpacity(0),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 20),
                              textStyle: const TextStyle(
                                fontSize: 20,
                              )),
                          onPressed: () {
                            Modular.to.navigate('/login/esqueci-minha-senha');
                          },
                          child: const Text(
                            'Esqueci minha senha',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                          width: (MediaQuery.of(context).size.width < 650
                              ? MediaQuery.of(context).size.width * 0.85
                              : 600),
                          decoration: BoxDecoration(
                              color: AppColors.gray,
                              borderRadius: BorderRadius.circular(8)),
                          child: const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text(
                              'Em caso de erro ao se logar, envie um e-mail para: dev@maua.br',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
