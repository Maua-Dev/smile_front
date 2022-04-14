import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/themes/app_colors.dart';
import '../../../../../shared/themes/app_text_styles.dart';
import '../../../../../shared/widgets/action_textbutton_widget.dart';

class NameAlterationDialog extends StatelessWidget {
  final String name;
  final String socialName;
  final Function(String)? onChangedName;
  final Function(String)? onChangedSocialName;
  final Function(bool)? onChangedWantSocialName;
  final Function(bool)? onChangedCertificateWithSocialName;
  final String? Function(String?)? nameValidation;
  final String? Function(String?)? socialNameValidation;
  final bool certificateWithSocialName;
  final bool wantSocialName;
  final bool isLoading;
  final Function()? changeName;

  const NameAlterationDialog(
      {Key? key,
      this.onChangedName,
      required this.name,
      required this.socialName,
      this.onChangedSocialName,
      required this.wantSocialName,
      this.onChangedWantSocialName,
      this.onChangedCertificateWithSocialName,
      required this.certificateWithSocialName,
      this.nameValidation,
      this.socialNameValidation,
      required this.isLoading,
      this.changeName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Alteração de nome',
                    style: AppTextStyles.titleH1.copyWith(
                        fontSize: MediaQuery.of(context).size.width < 500
                            ? 28
                            : MediaQuery.of(context).size.width < 1000
                                ? 34
                                : 40,
                        color: AppColors.brandingPurple),
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
                    style: AppTextStyles.body
                        .copyWith(color: Colors.black, fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                validator: nameValidation,
                initialValue: name,
                textAlignVertical: TextAlignVertical.center,
                onChanged: onChangedName,
                style: AppTextStyles.body
                    .copyWith(color: Colors.white, fontSize: 16),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  fillColor: AppColors.brandingPurple,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        BorderSide(color: AppColors.brandingPurple, width: 0.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        BorderSide(color: AppColors.brandingPurple, width: 0.0),
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
                      style: AppTextStyles.body
                          .copyWith(color: Colors.black, fontSize: 20),
                    ),
                    CupertinoSwitch(
                      value: wantSocialName,
                      onChanged: onChangedWantSocialName,
                      trackColor: AppColors.gray,
                      thumbColor: AppColors.brandingPurple,
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
                    style: AppTextStyles.body
                        .copyWith(color: Colors.black, fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                validator: socialNameValidation,
                initialValue: socialName,
                enabled: wantSocialName ? true : false,
                textAlignVertical: TextAlignVertical.center,
                onChanged: onChangedSocialName,
                style: AppTextStyles.body
                    .copyWith(color: Colors.white, fontSize: 16),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  fillColor: wantSocialName
                      ? AppColors.brandingPurple
                      : AppColors.gray,
                  filled: true,
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: AppColors.gray, width: 0.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        BorderSide(color: AppColors.brandingPurple, width: 0.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        BorderSide(color: AppColors.brandingPurple, width: 0.0),
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
                        'Usar nome social\nno certificado?',
                        style: AppTextStyles.body
                            .copyWith(color: Colors.black, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      CupertinoSwitch(
                        value: certificateWithSocialName,
                        onChanged: onChangedCertificateWithSocialName,
                        trackColor: AppColors.gray,
                        thumbColor: AppColors.brandingPurple,
                        activeColor: AppColors.lightPurple,
                      ),
                    ],
                  ),
                ),
              const SizedBox(
                height: 32,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text:
                        '* O nome que aqui constar, será o que utilizaremos para fins de emissão de certificado. Qualquer alteração no seu cadastro poderá ser feita até o dia ',
                    style: AppTextStyles.body
                        .copyWith(color: Colors.black, fontSize: 14),
                    children: [
                      TextSpan(
                        text: '23/05/2022',
                        style: AppTextStyles.titleH1
                            .copyWith(color: Colors.black, fontSize: 14),
                      ),
                      TextSpan(
                        text:
                            ', sob pena do certificado ser emitido com os dados aqui fornecidos.',
                        style: AppTextStyles.body
                            .copyWith(color: Colors.black, fontSize: 14),
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
                    await changeName!();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
