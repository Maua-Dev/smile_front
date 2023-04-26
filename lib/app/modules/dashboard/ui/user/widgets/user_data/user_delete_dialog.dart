import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';
import 'package:smile_front/app/shared/widgets/custom_elevated_button_widget.dart';

class UserDeleteDialog extends StatelessWidget {
  final String? email;
  final Function(String) setEmailValue;
  final bool isEmailTypedCorrectly;
  final bool isLoading;

  const UserDeleteDialog({
    Key? key,
    required this.email,
    required this.setEmailValue,
    required this.isEmailTypedCorrectly,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width < 600 ? null : 500,
                  child: Observer(builder: (context) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Exclusão da conta',
                              style: AppTextStyles.titleH1.copyWith(
                                  fontSize: MediaQuery.of(context).size.width <
                                          500
                                      ? 18
                                      : MediaQuery.of(context).size.width < 1000
                                          ? 30
                                          : 36,
                                  color: AppColors.brandingBlue),
                            ),
                            IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(
                                Icons.close,
                                color: AppColors.redButton,
                                size: 30,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Text(
                            "Tem certeza que deseja excluir a sua conta? Todas as suas incrições, certificados e dados serão apagados permanentemente.",
                            style: AppTextStyles.bold.copyWith(
                                color: Colors.black,
                                fontSize: MediaQuery.of(context).size.width <
                                        500
                                    ? 14
                                    : MediaQuery.of(context).size.width < 1000
                                        ? 20
                                        : 24)),
                        const SizedBox(height: 32),
                        RichText(
                          text: TextSpan(
                              text: "Digite o seu e-mail",
                              style: AppTextStyles.body.copyWith(
                                  color: Colors.black,
                                  fontSize: MediaQuery.of(context).size.width <
                                          500
                                      ? 14
                                      : MediaQuery.of(context).size.width < 1000
                                          ? 18
                                          : 22),
                              children: [
                                TextSpan(
                                    text: " ($email) ",
                                    style: AppTextStyles.body.copyWith(
                                      color: AppColors.brandingOrange,
                                      fontWeight: FontWeight.bold,
                                      fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width <
                                              500
                                          ? 14
                                          : MediaQuery.of(context).size.width <
                                                  1000
                                              ? 18
                                              : 22,
                                    )),
                                TextSpan(
                                    text: "para completar a ação:",
                                    style: AppTextStyles.body.copyWith(
                                        color: Colors.black,
                                        fontSize:
                                            MediaQuery.of(context).size.width <
                                                    500
                                                ? 14
                                                : MediaQuery.of(context)
                                                            .size
                                                            .width <
                                                        1000
                                                    ? 18
                                                    : 22))
                              ]),
                        ),
                        const SizedBox(height: 16),
                        Observer(builder: (context) {
                          return TextFormField(
                            textAlignVertical: TextAlignVertical.center,
                            onChanged: setEmailValue,
                            style: AppTextStyles.body.copyWith(
                                color: Colors.white,
                                fontSize: MediaQuery.of(context).size.width <
                                        500
                                    ? 14
                                    : MediaQuery.of(context).size.width < 1000
                                        ? 18
                                        : 22),
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              fillColor: AppColors.brandingBlue,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: AppColors.brandingBlue, width: 0.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: AppColors.brandingBlue, width: 0.0),
                              ),
                            ),
                          );
                        }),
                        const SizedBox(height: 32),
                        Observer(builder: (context) {
                          return CustomElevatedButtonWidget(
                            isLoading: isLoading,
                            title: 'Deletar conta permanentemente',
                            widthSize: MediaQuery.of(context).size.width < 650
                                ? MediaQuery.of(context).size.width * 0.85
                                : 600,
                            heightSize: 50,
                            backgroundColor: AppColors.redButton,
                            onPressed:
                                isEmailTypedCorrectly == true ? () {} : null,
                          );
                        }),
                        const SizedBox(height: 8),
                      ],
                    );
                  })),
            ),
          ));
    });
  }
}
