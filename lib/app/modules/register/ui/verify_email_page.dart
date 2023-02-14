import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/generated/l10n.dart';
import '../../../shared/utils/s3_assets_url.dart';
import '../../../shared/widgets/custom_elevated_button_widget.dart';
import '../../login/ui/widgets/smile_logo_widget.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({Key? key}) : super(key: key);

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
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
              decoration: BoxDecoration(color: AppColors.backgroundLogin),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 140,
                    ),
                    const Center(
                      child: SmileLogoWidget(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      S.of(context).emailNotificationTitle,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomElevatedButtonWidget(
                      title: S.of(context).loginTitle,
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
              )),
        ),
      ),
    );
  }
}
