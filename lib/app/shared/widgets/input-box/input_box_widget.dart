import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';

class InputBoxWidget extends StatelessWidget {
  final IconData icon;
  final String placeholder;
  final double? widthSize;
  final bool? disable;
  final bool? isPassword;
  final String? Function(String?)? validation;
  final Function(String value) setValue;
  final Function(String)? onFieldSubmitted;
  final void Function(bool)? onToggleVisibilityPwd;
  final bool? showPwd;
  final bool? isRAField;
  final bool? isValidated;
  final PhoneNumber number = PhoneNumber(isoCode: 'BR');

  InputBoxWidget({
    Key? key,
    required this.icon,
    required this.placeholder,
    this.widthSize,
    this.disable,
    this.isPassword,
    this.validation,
    required this.setValue,
    this.onToggleVisibilityPwd,
    this.showPwd,
    this.isRAField,
    this.isValidated,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final maskRA = MaskTextInputFormatter(
        mask: "##.#####-#", filter: {"#": RegExp(r'[0-9]')});

    return SizedBox(
      width: widthSize ??
          (MediaQuery.of(context).size.width < 650
              ? MediaQuery.of(context).size.width * 0.85
              : 600),
      child: TextFormField(
          validator: validation,
          onChanged: setValue,
          onFieldSubmitted: onFieldSubmitted,
          obscureText: showPwd != null ? !showPwd! : false,
          enabled: disable != null ? !disable! : true,
          decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.all(24),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.brandingOrange),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.brandingOrange),
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: placeholder,
              filled: true,
              fillColor: disable != null
                  ? disable!
                      ? AppColors.gray.withOpacity(0.5)
                      : AppColors.white
                  : AppColors.white,
              hintStyle: TextStyle(color: AppColors.gray),
              errorStyle: TextStyle(
                color: AppColors.brandingOrange,
                fontSize: 16,
                height: 1,
              ),
              prefixIcon: Icon(
                icon,
                size: 24,
              ),
              suffixIcon: onToggleVisibilityPwd != null
                  ? InkWell(
                      onTap: () => onToggleVisibilityPwd!(showPwd!),
                      child: Icon(
                        showPwd! ? Icons.visibility : Icons.visibility_off,
                        color: AppColors.gray,
                        size: 20,
                      ),
                    )
                  : null),
          style: TextStyle(color: AppColors.gray),
          inputFormatters: isRAField != null ? [maskRA] : null),
    );
  }
}
