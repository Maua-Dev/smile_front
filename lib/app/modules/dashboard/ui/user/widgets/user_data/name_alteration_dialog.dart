import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:smile_front/app/modules/register/ui/widgets/switch_toggle_widget.dart';
import 'package:smile_front/app/shared/themes/breakpoint.dart';
import 'package:smile_front/app/shared/utils/screen_helper.dart';
import 'package:smile_front/app/shared/widgets/dialogs/custom_alert_dialog_widget.dart';
import 'package:smile_front/generated/l10n.dart';
import '../../../../../../shared/themes/app_colors.dart';
import '../../../../../../shared/themes/app_text_styles.dart';
import '../../../../../../shared/widgets/custom_elevated_button_widget.dart';
import '../../../../presenter/controllers/user/user_dashboard_controller.dart';

class NameAlterationDialog extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    var controller = Modular.get<UserDashboardController>();
    final maskBrazilianPhone = MaskTextInputFormatter(
        mask: "(##) #####-####", filter: {"#": RegExp(r'[0-9]')});
    final maskPhone = MaskTextInputFormatter(
        mask: "+###############", filter: {"#": RegExp(r'[0-9]')});
    final maskNewPhone = MaskTextInputFormatter(
        mask: "###############", filter: {"#": RegExp(r'[0-9]')});
    const countryPicker = FlCountryCodePicker();
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SizedBox(
          width: MediaQuery.of(context).size.width < 600 ? null : 500,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Alteração de dados',
                      style: AppTextStyles.titleH1.copyWith(
                          fontSize: MediaQuery.of(context).size.width < 500
                              ? 24
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
                      'Nome:',
                      style: AppTextStyles.body.copyWith(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width < 500
                              ? 16
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
                  initialValue: name,
                  textAlignVertical: TextAlignVertical.center,
                  onChanged: onChangedName,
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
                      borderSide:
                          BorderSide(color: AppColors.brandingBlue, width: 0.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                          BorderSide(color: AppColors.brandingBlue, width: 0.0),
                    ),
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
                      Text(
                        'Deseja nome social?',
                        style: AppTextStyles.body.copyWith(
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.width < 500
                                ? 16
                                : MediaQuery.of(context).size.width < 1000
                                    ? 20
                                    : 24),
                      ),
                      CupertinoSwitch(
                        value: wantSocialName,
                        onChanged: onChangedWantSocialName,
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
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Nome social:',
                      style: AppTextStyles.body.copyWith(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width < 500
                              ? 16
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
                  initialValue: socialName,
                  enabled: wantSocialName ? true : false,
                  textAlignVertical: TextAlignVertical.center,
                  onChanged: onChangedSocialName,
                  style: AppTextStyles.body.copyWith(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width < 500
                          ? 12
                          : MediaQuery.of(context).size.width < 1000
                              ? 16
                              : 20),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    fillColor: wantSocialName
                        ? AppColors.brandingBlue
                        : AppColors.gray,
                    filled: true,
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: AppColors.gray, width: 0.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                          BorderSide(color: AppColors.brandingBlue, width: 0.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                          BorderSide(color: AppColors.brandingBlue, width: 0.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                if (wantSocialName)
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          MediaQuery.of(context).size.width < 410
                              ? 'Usar nome social\nno certificado?'
                              : 'Usar nome social no certificado?',
                          style: AppTextStyles.body.copyWith(
                              color: Colors.black,
                              fontSize: MediaQuery.of(context).size.width < 500
                                  ? 16
                                  : MediaQuery.of(context).size.width < 1000
                                      ? 20
                                      : 24),
                          textAlign: TextAlign.center,
                        ),
                        CupertinoSwitch(
                          value: certificateWithSocialName,
                          onChanged: onChangedCertificateWithSocialName,
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
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Telefone:',
                      style: AppTextStyles.body.copyWith(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width < 500
                              ? 16
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
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (controller.phone == '')
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: GestureDetector(
                            onTap: () async {
                              final code = await countryPicker.showPicker(
                                  context: context);
                              controller.setCountryCode(code);
                              controller.setBrazilianPhone(code);
                              if (controller.countryCode == null) {
                                controller.setCountryCode(const CountryCode(
                                    name: 'Brazil',
                                    code: 'BR',
                                    dialCode: '+55'));
                              }
                            },
                            child: Container(
                              height: 60,
                              width: 110,
                              decoration: BoxDecoration(
                                  color: AppColors.brandingBlue,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                          child: controller.countryCode != null
                                              ? controller
                                                  .countryCode!.flagImage
                                              : null),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        controller.countryCode != null
                                            ? controller.countryCode!.dialCode
                                            : "DDI",
                                        style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (controller.phone == '')
                        const SizedBox(
                          width: 10,
                        ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: SizedBox(
                          width: controller.phone == ''
                              ? Screen.width(context) < breakpointMobile
                                  ? 260
                                  : 380
                              : Screen.width(context) < breakpointMobile
                                  ? 388
                                  : 500,
                          child: TextFormField(
                            inputFormatters: controller.phone != ''
                                ? [maskPhone]
                                : controller.countryCode!.code == "BR"
                                    ? [maskBrazilianPhone]
                                    : [maskNewPhone],
                            validator: controller.validatePhone,
                            initialValue: controller.phoneToChange,
                            keyboardType: TextInputType.number,
                            textAlignVertical: TextAlignVertical.center,
                            onChanged: controller.setPhone,
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
                          ),
                        ),
                      ),
                    ],
                  );
                }),
                Observer(builder: (_) {
                  return SwitchToggleWidget(
                    isSwitched: controller.acceptEmailNotifications,
                    tipo: S.of(context).notificationsSchema('email'),
                    onChanged: (bool? value) {
                      controller.setEmailNotifications(value);
                    },
                  );
                }),
                Observer(builder: (_) {
                  return SwitchToggleWidget(
                      isSwitched: controller.acceptSMSNotifications,
                      tipo: S.of(context).notificationsSchema('sms'),
                      onChanged: (bool? value) {
                        controller.setSMSNotifications(value);
                        if (!controller.isPhoneFieldFilled) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomAlertDialogWidget(
                                  title: S.of(context).notificationsSmsAlert,
                                );
                              });
                        }
                      });
                }),
                const SizedBox(
                  height: 32,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text:
                          '* O nome que aqui constar, será o que utilizaremos para fins de emissão de certificado. Qualquer alteração no seu cadastro poderá ser feita até o dia ',
                      style: AppTextStyles.body.copyWith(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width < 500
                              ? 12
                              : MediaQuery.of(context).size.width < 1000
                                  ? 14
                                  : 16),
                      children: [
                        TextSpan(
                          text: '25/05/2023',
                          style: AppTextStyles.titleH1.copyWith(
                              color: Colors.black,
                              fontSize: MediaQuery.of(context).size.width < 500
                                  ? 12
                                  : MediaQuery.of(context).size.width < 1000
                                      ? 14
                                      : 16),
                        ),
                        TextSpan(
                          text:
                              ', sob pena do certificado ser emitido com os dados aqui fornecidos.',
                          style: AppTextStyles.body.copyWith(
                              color: Colors.black,
                              fontSize: MediaQuery.of(context).size.width < 500
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
                CustomElevatedButtonWidget(
                  isLoading: isLoading,
                  title: 'Alterar dados',
                  widthSize: MediaQuery.of(context).size.width < 650
                      ? MediaQuery.of(context).size.width * 0.85
                      : 600,
                  heightSize: 50,
                  backgroundColor: AppColors.brandingOrange,
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      controller.replaceCharactersPhone();
                      await changeData!();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
