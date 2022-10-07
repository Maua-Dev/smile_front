import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';

class InputBox extends StatelessWidget {
  final IconData icon;
  final String placeholder;
  final double? widthSize;
  final bool? disable;
  final bool? isPassword;
  final String? Function(String value)? validation;
  final Function(String value) setValue;
  final void Function(String?)? onFieldSubmitted;
  final void Function(bool)? onToggleVisibilityPwd;
  //final void Function(String) setPhone;
  final bool? showPwd;
  final bool? isCpfField;
  final bool? isRAField;
  final bool? isPhoneField;
  final bool? isValidated;
  final PhoneNumber number = PhoneNumber(isoCode: 'BR');

  InputBox({
    Key? key,
    required this.icon,
    required this.placeholder,
    this.widthSize,
    this.disable,
    this.isPassword,
    this.validation,
    required this.setValue,
    this.onFieldSubmitted,
    this.onToggleVisibilityPwd,
    this.showPwd,
    this.isCpfField,
    this.isRAField,
    this.isPhoneField,
    this.isValidated,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final maskCpf = MaskTextInputFormatter(
        mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')});
    final maskRA = MaskTextInputFormatter(
        mask: "##.#####-#", filter: {"#": RegExp(r'[0-9]')});

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      width: widthSize ??
          (MediaQuery.of(context).size.width < 650
              ? MediaQuery.of(context).size.width * 0.85
              : 600),
      height: 60,
      child: Container(
        decoration: BoxDecoration(
            color: disable != null
                ? disable!
                    ? const Color(0xFF5C5C5C).withOpacity(0.2)
                    : AppColors.gray
                : AppColors.gray,
            borderRadius: BorderRadius.circular(10),
            border: isValidated != null
                ? !isValidated!
                    ? Border.all(color: Colors.red)
                    : null
                : null),
        child: Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.width < 650 ? 5 : 10, left: 10),
          child: isPhoneField == true
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 12),
                  child: InternationalPhoneNumberInput(
                    onFieldSubmitted: onFieldSubmitted,
                    onInputChanged: (PhoneNumber number) {
                      setValue(number.phoneNumber!);
                    },
                    selectorConfig: const SelectorConfig(
                      useEmoji: true,
                      selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                    ),
                    ignoreBlank: true,
                    initialValue: number,
                    searchBoxDecoration: InputDecoration(
                      fillColor: AppColors.brandingPurple,
                      hintText: 'Pesquisar por país ou DDI',
                      hintStyle: TextStyle(color: AppColors.brandingPurple),
                    ),
                    selectorTextStyle: TextStyle(
                      color: AppColors.placeholder,
                      fontSize: 16,
                    ),
                    textStyle: TextStyle(color: AppColors.white),
                    spaceBetweenSelectorAndTextField: 0,
                    inputDecoration: InputDecoration(
                      prefixIcon: Icon(icon, size: 24),
                      contentPadding: const EdgeInsets.only(bottom: 6),
                      border: InputBorder.none,
                      hintText: 'Telefone Celular',
                      hintStyle: TextStyle(color: AppColors.placeholder),
                    ),
                  ),
                )
              : TextFormField(
                  validator: (value) {
                    if (validation != null) {
                      return validation!(value!);
                    }
                    return null;
                  },
                  onFieldSubmitted: onFieldSubmitted,
                  onChanged: setValue,
                  obscureText: showPwd != null ? !showPwd! : false,
                  enabled: disable != null ? !disable! : true,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 15),
                      border: InputBorder.none,
                      hintText: placeholder,
                      fillColor: Colors.white,
                      isDense: true,
                      hintStyle: TextStyle(color: AppColors.placeholder),
                      errorStyle: TextStyle(
                        color: AppColors.brandingOrange,
                        fontSize: 16,
                        height: 0.08,
                      ),
                      prefixIcon: Icon(icon, size: 24),
                      suffixIcon: onToggleVisibilityPwd != null
                          ? Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: InkWell(
                                onTap: () => onToggleVisibilityPwd!(showPwd!),
                                child: Icon(
                                  showPwd!
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: AppColors.brandingPurple,
                                  size: 20,
                                ),
                              ),
                            )
                          : null),
                  style: const TextStyle(color: Colors.white),
                  inputFormatters: isCpfField != null
                      ? [maskCpf]
                      : isRAField != null
                          ? [maskRA]
                          : null),
        ),
      ),
    );
  }
}
