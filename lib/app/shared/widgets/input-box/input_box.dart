import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';

class InputBox extends StatelessWidget {
  final IconData icon;
  final String placeholder;
  final double? widthSize;
  final double? heightSize;
  final bool? disable;
  final bool? isPassword;
  final String? Function(String value)? validation;
  final Function(String value) setValue;
  final void Function(String?)? onFieldSubmitted;
  final void Function(bool)? onToggleVisibilityPwd;
  final bool? showPwd;
  final bool? isCpfField;
  final bool? isRAField;
  final bool? isValidated;

  const InputBox({
    Key? key,
    required this.icon,
    required this.placeholder,
    this.widthSize,
    this.heightSize,
    this.disable,
    this.isPassword,
    this.validation,
    required this.setValue,
    this.onFieldSubmitted,
    this.onToggleVisibilityPwd,
    this.showPwd,
    this.isCpfField,
    this.isRAField,
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
      height: heightSize ?? 60,
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
          padding: const EdgeInsets.only(top: 10.0, left: 10),
          child: TextFormField(
            inputFormatters: isCpfField != null
                ? [maskCpf]
                : isRAField != null
                    ? [maskRA]
                    : null,
            textAlignVertical: TextAlignVertical.center,
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
                contentPadding: const EdgeInsets.only(bottom: 30),
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
                            showPwd! ? Icons.visibility : Icons.visibility_off,
                            color: AppColors.brandingPurple,
                            size: 20,
                          ),
                        ),
                      )
                    : null),
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
