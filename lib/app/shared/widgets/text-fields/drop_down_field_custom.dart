import 'package:flutter/material.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

class DropDownFieldCustom<T> extends StatelessWidget {
  final String? titulo;
  final void Function(T? value)? onChanged;
  final List<DropdownMenuItem<T>> items;
  final T? value;
  const DropDownFieldCustom(
      {Key? key, this.titulo, this.onChanged, required this.items, this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<T>(
          value: value,
          isExpanded: true,
          onChanged: onChanged,
          items: items,
          iconEnabledColor: AppColors.brandingBlue,
          iconSize: 32,
          style: AppTextStyles.button
              .copyWith(fontSize: 24, color: AppColors.brandingBlue),
          decoration: InputDecoration(
            hintText: titulo,
            hintStyle: AppTextStyles.button
                .copyWith(fontSize: 24, color: AppColors.brandingBlue),
            fillColor: AppColors.lightBlue,
            filled: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(color: AppColors.lightBlue),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(color: AppColors.lightBlue),
            ),
          ),
        ),
      ),
    );
  }
}
