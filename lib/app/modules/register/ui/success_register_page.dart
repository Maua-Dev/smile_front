import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import '../../../shared/utils/s3_assets_url.dart';
import '../../home/ui/pages/widgets/action_textbutton_widget.dart';
import '../presenter/controllers/register_controller.dart';

class SuccessRegisterPage extends StatefulWidget {
  const SuccessRegisterPage({Key? key}) : super(key: key);

  @override
  _SuccessRegisterPageState createState() => _SuccessRegisterPageState();
}

class _SuccessRegisterPageState
    extends ModularState<SuccessRegisterPage, RegisterController> {
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
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 140,
                        ),
                        CachedNetworkImage(
                          width: 300,
                          fit: BoxFit.cover,
                          imageUrl: smileLogoUrl,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Icon(
                          Icons.check_circle,
                          color: AppColors.greenButton,
                          size: 64,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Seu cadastro foi confirmado com sucesso!',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ActionTextButtonWidget(
                          title: 'Fazer Login',
                          widthSize: MediaQuery.of(context).size.width < 650
                              ? MediaQuery.of(context).size.width * 0.85
                              : 600,
                          heightSize: 50,
                          backgroundColor: AppColors.brandingOrange,
                          onPressed: () {
                            Modular.to.navigate('/login');
                          },
                        ),
                        const SizedBox(
                          height: 280,
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
