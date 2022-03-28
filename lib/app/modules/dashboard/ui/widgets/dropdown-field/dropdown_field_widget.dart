import 'package:flutter/material.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';

import '../../../../../shared/themes/app_text_styles.dart';

class DropDownFieldWidget<T> extends StatelessWidget {
  final String? titulo;
  final void Function(T? value)? onChanged;
  final List<DropdownMenuItem<T>> items;
  final T? value;
  const DropDownFieldWidget({
    Key? key,
    this.titulo,
    this.value,
    this.onChanged,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField<T>(
        icon: const Icon(
          Icons.keyboard_arrow_down,
          size: 28,
        ),
        iconEnabledColor: AppColors.brandingOrange,
        value: value,
        isExpanded: true,
        onChanged: onChanged,
        items: items,
        style: AppTextStyles.buttonBold.copyWith(
            fontSize: MediaQuery.of(context).size.width < 1000 ? 20 : 24,
            color: Colors.black),
        decoration: InputDecoration(
          labelText: titulo,
          labelStyle: AppTextStyles.buttonBold.copyWith(
              fontSize: MediaQuery.of(context).size.width < 1000 ? 24 : 28,
              color: AppColors.brandingPurple),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 22.5),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(color: AppColors.brandingPurple, width: 0.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(color: AppColors.brandingPurple, width: 0.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(color: AppColors.brandingPurple, width: 0.0),
          ),
        ),
      ),
    );
  }
}
