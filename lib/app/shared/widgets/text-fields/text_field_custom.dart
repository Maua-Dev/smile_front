import 'package:flutter/material.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

class TextFieldCustom extends StatelessWidget {
  final String? titulo;
  final void Function(String value)? onChanged;
  final String? value;
  const TextFieldCustom({
    Key? key,
    this.titulo,
    this.onChanged,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController(text: value);
    return Expanded(
      flex: 4,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: AppTextStyles.button
            .copyWith(fontSize: 24, color: AppColors.brandingPurple),
        decoration: InputDecoration(
          fillColor: AppColors.lightPurple,
          filled: true,
          hintText: titulo,
          hintStyle: AppTextStyles.button
              .copyWith(fontSize: 24, color: AppColors.brandingPurple),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: CircleAvatar(
              backgroundColor: AppColors.brandingPurple,
              radius: 25,
              child: const Icon(
                Icons.search,
                size: 32,
                color: Colors.white,
              ),
            ),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(color: AppColors.lightPurple),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(color: AppColors.lightPurple),
          ),
        ),
      ),
    );
  }
}
