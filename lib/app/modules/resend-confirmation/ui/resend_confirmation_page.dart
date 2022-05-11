import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import '../../../shared/utils/s3_assets_url.dart';
import '../../../shared/widgets/custom_elevated_button_widget.dart';
import '../../login/ui/widgets/smile_logo_widget.dart';
import '../presenter/controller/resend_confirmation_controller.dart';
import '../../../shared/widgets/input-box/input_box.dart';

class ResendConfirmationPage extends StatefulWidget {
  const ResendConfirmationPage({Key? key}) : super(key: key);

  @override
  _ResendConfirmationPageState createState() => _ResendConfirmationPageState();
}

class _ResendConfirmationPageState
    extends ModularState<ResendConfirmationPage, ResendConfirmationController> {
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
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        const Center(
                          child: SmileLogoWidget(),
                        ),
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
                                      "Você receberá um e-mail (no-reply@verificationemail.com) com um link para confirmar sua conta! Verifique a caixa de spam ou promocional.",
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  CustomElevatedButtonWidget(
                                    title: 'Retornar ao login',
                                    widthSize:
                                        MediaQuery.of(context).size.width < 650
                                            ? MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.85
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
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.0),
                                  child: SizedBox(
                                    width: 600,
                                    child: Text(
                                      'Seu cadastro pode não ter sido confirmado, para isso você deve clicar no link enviado por e-mail.\nCaso não tenha encontrado o e-mail (no-reply@verificationemail.com) em sua caixa de entrada, verifique a caixa de spam ou promocional ou reenvie o código inserindo seu CPF no campo abaixo:',
                                      style: TextStyle(color: Colors.white),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                InputBox(
                                  icon: Icons.person,
                                  placeholder: 'CPF',
                                  setValue: controller.setCpf,
                                  isCpfField: true,
                                  onFieldSubmitted: (value) async {
                                    if (controller.validateForm()) {
                                      await controller.resendConfirmation();
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
                                    widthSize:
                                        MediaQuery.of(context).size.width < 650
                                            ? MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.85
                                            : 600,
                                    heightSize: 50,
                                    backgroundColor: AppColors.brandingOrange,
                                    onPressed: () async {
                                      if (controller.validateForm()) {
                                        await controller.resendConfirmation();
                                      }
                                    },
                                  );
                                }),
                                const SizedBox(
                                  height: 20,
                                ),
                                CustomElevatedButtonWidget(
                                  title: 'Voltar para o Login',
                                  widthSize: MediaQuery.of(context).size.width <
                                          650
                                      ? MediaQuery.of(context).size.width * 0.85
                                      : 600,
                                  heightSize: 50,
                                  backgroundColor: AppColors.brandingPurple,
                                  onPressed: () {
                                    Modular.to.navigate('/login');
                                  },
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                              ],
                            );
                          }
                        }),
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
