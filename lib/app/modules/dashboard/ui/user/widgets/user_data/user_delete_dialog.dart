import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';
import 'package:smile_front/app/shared/widgets/custom_elevated_button_widget.dart';

import '../../../../../../../generated/l10n.dart';

class UserDeleteDialog extends StatelessWidget {
  final String? email;
  final Function(String) onChangedEmail;
  final Function() deleteUser;
  final bool isEmailTypedCorrectly;
  final bool isLoading;

  const UserDeleteDialog({
    Key? key,
    required this.deleteUser,
    required this.email,
    required this.onChangedEmail,
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
                              style: AppTextStyles.headline1.copyWith(
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
                        Text(S.of(context).deleteMessage,
                            style: AppTextStyles.headline1.copyWith(
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
                              text: S.of(context).deleteEmailType,
                              style: AppTextStyles.headline1.copyWith(
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
                                    style: AppTextStyles.headline1.copyWith(
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
                                    text: S.of(context).deleteCompleteAction,
                                    style: AppTextStyles.headline1.copyWith(
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
                            onChanged: onChangedEmail,
                            style: AppTextStyles.headline1.copyWith(
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
                            title: S.of(context).deleteAccountPermanent,
                            widthSize: MediaQuery.of(context).size.width < 650
                                ? MediaQuery.of(context).size.width * 0.85
                                : 600,
                            heightSize: 50,
                            backgroundColor: AppColors.redButton,
                            onPressed: isEmailTypedCorrectly == true
                                ? () {
                                    deleteUser();
                                  }
                                : null,
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
