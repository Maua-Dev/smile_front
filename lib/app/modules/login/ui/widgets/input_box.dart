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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      width: widthSize ?? 600,
      height: heightSize ?? 60,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.gray,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 10),
          child: TextFormField(
            textAlignVertical: TextAlignVertical.center,
            validator: (value) {
              return validation!(value!);
            },
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
                fontSize: 24,
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
