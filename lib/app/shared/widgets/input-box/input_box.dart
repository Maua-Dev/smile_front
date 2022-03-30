import 'package:flutter/material.dart';
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

  const InputBox(
      {Key? key,
      required this.icon,
      required this.placeholder,
      this.widthSize,
      this.heightSize,
      this.disable,
      this.isPassword,
      this.validation,
      required this.setValue,
      this.onFieldSubmitted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      // ignore: prefer_if_null_operators
      width: widthSize != null
          ? widthSize
          : MediaQuery.of(context).size.width < 650
              ? MediaQuery.of(context).size.width * 0.85
              : 600,
      height: heightSize ?? 60,
      child: Container(
        decoration: BoxDecoration(
          color: disable != null
              ? disable!
                  ? const Color(0xFF5C5C5C).withOpacity(0.2)
                  : AppColors.grey
              : AppColors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 10),
          child: TextFormField(
            textAlignVertical: TextAlignVertical.center,
            validator: (value) {
              return validation!(value!);
            },
            onFieldSubmitted: onFieldSubmitted,
            onChanged: setValue,
            obscureText: isPassword ?? false,
            enabled: disable != null ? !disable! : true,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(top: 10),
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
            ),
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
