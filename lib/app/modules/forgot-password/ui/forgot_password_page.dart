import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import '../../../shared/utils/s3_assets_url.dart';
import '../../../shared/widgets/action_textbutton_widget.dart';
import '../../login/ui/widgets/smile_logo_widget.dart';
import '../presenter/controller/forgot_password_controller.dart';
import '../../../shared/widgets/input-box/input_box.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState
    extends ModularState<ForgotPasswordPage, ForgotPasswordController> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Center(
                        child: SmileLogoWidget(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Observer(builder: (_) {
                        if (controller.errors != '') {
                          return Container(
                            width: 500,
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
                      Observer(builder: (context) {
                        if (controller.emailSent) {
                          return Center(
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(42.0),
                                  child: Text(
                                    "Você receberá um e-mail com um link para alterar sua senha! Verifique a caixa de spam.",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                CustomElevatedButtonWidget(
                                  title: 'Retornar ao login',
                                  widthSize: MediaQuery.of(context).size.width <
                                          650
                                      ? MediaQuery.of(context).size.width * 0.85
                                      : 600,
                                  heightSize: 50,
                                  backgroundColor: AppColors.brandingOrange,
                                  onPressed: () {
                                    Modular.to.navigate('/login');
                                  },
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(42.0),
                                child: Text(
                                  'Um código será enviado no email cadastrado',
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              InputBox(
                                icon: Icons.person,
                                placeholder: 'CPF ou Email',
                                setValue: controller.setUsername,
                                validation: controller.validateUsername,
                                onFieldSubmitted: (value) async {
                                  if (_formKey.currentState!.validate()) {
                                    await controller.forgotPassword();
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Observer(builder: (_) {
                                return CustomElevatedButtonWidget(
                                  isLoading: controller.isLoading,
                                  title: 'Enviar',
                                  widthSize: MediaQuery.of(context).size.width <
                                          650
                                      ? MediaQuery.of(context).size.width * 0.85
                                      : 600,
                                  heightSize: 50,
                                  backgroundColor: AppColors.brandingOrange,
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      await controller.forgotPassword();
                                    }
                                  },
                                );
                              }),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomElevatedButtonWidget(
                                title: 'Não tenho cadastro',
                                widthSize: MediaQuery.of(context).size.width <
                                        650
                                    ? MediaQuery.of(context).size.width * 0.85
                                    : 600,
                                heightSize: 50,
                                backgroundColor: AppColors.brandingPurple,
                                onPressed: () {
                                  Modular.to.navigate('/login/cadastro');
                                },
                              ),
                            ],
                          );
                        }
                      }),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
