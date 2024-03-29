import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/modules/dashboard/ui/user/widgets/user_data/user_delete_dialog.dart';
import 'package:smile_front/generated/l10n.dart';
import '../../../../../../shared/themes/app_colors.dart';
import '../../../../../../shared/themes/app_text_styles.dart';
import '../../../../../../shared/widgets/custom_elevated_button_widget.dart';
import '../../../../presenter/controllers/user/user_dashboard_controller.dart';

class NameAlterationDialog extends StatefulWidget {
  final String name;
  final String socialName;
  final Function(String)? onChangedName;
  final Function(String)? onChangedSocialName;
  final Function(bool)? onChangedWantSocialName;
  final Function(bool)? onChangedCertificateWithSocialName;
  final bool certificateWithSocialName;
  final bool wantSocialName;
  final bool isLoading;
  final Function()? changeData;

  const NameAlterationDialog({
    Key? key,
    this.onChangedName,
    required this.name,
    required this.socialName,
    this.onChangedSocialName,
    required this.wantSocialName,
    this.onChangedWantSocialName,
    this.onChangedCertificateWithSocialName,
    required this.certificateWithSocialName,
    required this.isLoading,
    this.changeData,
  }) : super(key: key);

  @override
  State<NameAlterationDialog> createState() => _NameAlterationDialogState();
}

class _NameAlterationDialogState extends State<NameAlterationDialog> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var controller = Modular.get<UserDashboardController>();
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: SizedBox(
            width: MediaQuery.of(context).size.width < 600 ? null : 500,
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).updateUserTitle,
                        style: AppTextStyles.titleH1.copyWith(
                            fontSize: MediaQuery.of(context).size.width < 500
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
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        S.of(context).registerFullNamePlaceholder,
                        style: AppTextStyles.body.copyWith(
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.width < 500
                                ? 14
                                : MediaQuery.of(context).size.width < 1000
                                    ? 20
                                    : 24),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Observer(builder: (_) {
                    return TextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp("[a-zA-ZÀ-ÖØ-öø-ÿ-\\s]")),
                      ],
                      initialValue: widget.name,
                      textAlignVertical: TextAlignVertical.center,
                      onChanged: controller.setName,
                      style: AppTextStyles.body.copyWith(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width < 500
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
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.of(context).socialNameAsk,
                          style: AppTextStyles.body.copyWith(
                              color: Colors.black,
                              fontSize: MediaQuery.of(context).size.width < 500
                                  ? 14
                                  : MediaQuery.of(context).size.width < 1000
                                      ? 20
                                      : 24),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: SizedBox(
                            width: 30,
                            child: Observer(builder: (_) {
                              return CupertinoSwitch(
                                value: widget.wantSocialName,
                                onChanged: widget.onChangedWantSocialName,
                                trackColor: AppColors.gray,
                                thumbColor: AppColors.brandingBlue,
                                activeColor: AppColors.lightPurple,
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        S.of(context).registerSocialNamePlaceholder,
                        style: AppTextStyles.body.copyWith(
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.width < 500
                                ? 14
                                : MediaQuery.of(context).size.width < 1000
                                    ? 20
                                    : 24),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp("[a-zA-ZÀ-ÖØ-öø-ÿ-\\s]")),
                    ],
                    initialValue: widget.socialName,
                    enabled: widget.wantSocialName ? true : false,
                    textAlignVertical: TextAlignVertical.center,
                    onChanged: widget.onChangedSocialName,
                    style: AppTextStyles.body.copyWith(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width < 500
                            ? 14
                            : MediaQuery.of(context).size.width < 1000
                                ? 16
                                : 20),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      fillColor: widget.wantSocialName
                          ? AppColors.brandingBlue
                          : AppColors.gray,
                      filled: true,
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            BorderSide(color: AppColors.gray, width: 0.0),
                      ),
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
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  if (widget.wantSocialName)
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            MediaQuery.of(context).size.width < 410
                                ? "${S.of(context).socialNameCertificateAsk('title')}\n${S.of(context).socialNameCertificateAsk('certificate')}"
                                : "${S.of(context).socialNameCertificateAsk('title')}${S.of(context).socialNameCertificateAsk('certificate')}",
                            style: AppTextStyles.body.copyWith(
                                color: Colors.black,
                                fontSize: MediaQuery.of(context).size.width <
                                        500
                                    ? 14
                                    : MediaQuery.of(context).size.width < 1000
                                        ? 20
                                        : 24),
                          ),
                          CupertinoSwitch(
                            value: widget.certificateWithSocialName,
                            onChanged:
                                widget.onChangedCertificateWithSocialName,
                            trackColor: AppColors.gray,
                            thumbColor: AppColors.brandingBlue,
                            activeColor: AppColors.lightPurple,
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                            text: TextSpan(
                                text:
                                    '${S.of(context).notificationsSchemaTitle}\n',
                                style: AppTextStyles.body.copyWith(
                                  color: Colors.black,
                                  fontSize: MediaQuery.of(context).size.width <
                                          500
                                      ? 14
                                      : MediaQuery.of(context).size.width < 1000
                                          ? 18
                                          : 24,
                                ),
                                children: [
                              TextSpan(
                                  text: S
                                      .of(context)
                                      .notificationsSchema('email'),
                                  style: AppTextStyles.body.copyWith(
                                    color: AppColors.brandingOrange,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.width < 500
                                            ? 14
                                            : MediaQuery.of(context)
                                                        .size
                                                        .width <
                                                    1000
                                                ? 18
                                                : 24,
                                  ))
                            ])),
                        Observer(builder: (_) {
                          return CupertinoSwitch(
                            value: controller.acceptEmailNotifications,
                            onChanged: (bool? value) {
                              controller.setEmailNotifications(value);
                            },
                            trackColor: AppColors.gray,
                            thumbColor: AppColors.brandingBlue,
                            activeColor: AppColors.lightPurple,
                          );
                        }),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: S.of(context).updateUserInfo('title'),
                        style: AppTextStyles.body.copyWith(
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.width < 500
                                ? 12
                                : MediaQuery.of(context).size.width < 1000
                                    ? 14
                                    : 16),
                        children: [
                          TextSpan(
                            text: S.of(context).updateUserInfo('date'),
                            style: AppTextStyles.titleH1.copyWith(
                                color: Colors.black,
                                fontSize: MediaQuery.of(context).size.width <
                                        500
                                    ? 12
                                    : MediaQuery.of(context).size.width < 1000
                                        ? 14
                                        : 16),
                          ),
                          TextSpan(
                            text: S.of(context).updateUserInfo('description2'),
                            style: AppTextStyles.body.copyWith(
                                color: Colors.black,
                                fontSize: MediaQuery.of(context).size.width <
                                        500
                                    ? 12
                                    : MediaQuery.of(context).size.width < 1000
                                        ? 14
                                        : 16),
                          ),
                        ]),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Observer(builder: (_) {
                    return CustomElevatedButtonWidget(
                      isLoading: widget.isLoading,
                      title: S.of(context).alterData,
                      widthSize: MediaQuery.of(context).size.width < 650
                          ? MediaQuery.of(context).size.width * 0.85
                          : 600,
                      heightSize: 50,
                      backgroundColor: AppColors.brandingOrange,
                      onPressed: (controller
                                  .wasAcceptEmailNotificationUpdated ||
                              controller.wasNameUpdated ||
                              controller.wasSocialNameUpdated ||
                              controller.wasWantSocialNameUpdated ||
                              controller.wasCertificateWithSocialNameUpdated)
                          ? () async {
                              if (formKey.currentState!.validate()) {
                                await widget.changeData!();
                              }
                            }
                          : null,
                    );
                  }),
                  const SizedBox(
                    height: 12,
                  ),
                  TextButton(
                      onPressed: () {
                        controller.setIsEmailTypedCorrectly(false);
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Observer(builder: (context) {
                              return UserDeleteDialog(
                                deleteUser: controller.deleteUserAccount,
                                email: controller.email,
                                isEmailTypedCorrectly:
                                    controller.isEmailTypedCorrectly,
                                isLoading: controller.isLoading,
                                onChangedEmail: controller.validateEmailTyped,
                              );
                            });
                          },
                        );
                      },
                      child: Text(S.of(context).deleteAccount,
                          style: AppTextStyles.body.copyWith(
                              color: AppColors.redButton, fontSize: 16)))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
