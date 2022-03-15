import 'package:flutter/material.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

class DropDownFieldCustom<T> extends StatelessWidget {
  final String? titulo;
  final void Function(T? value)? onChanged;
  final List<DropdownMenuItem<T>> items;
  final TextStyle? textStyles;
  final Color? filledColor;
  final T? value;
  const DropDownFieldCustom(
      {Key? key,
      this.titulo,
      this.onChanged,
      required this.items,
      this.value,
      this.textStyles,
      this.filledColor})
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
          iconEnabledColor: AppColors.brandingPurple,
          iconSize: 32,
          style: textStyles ??
              AppTextStyles.button
                  .copyWith(fontSize: 24, color: AppColors.brandingPurple),
          decoration: InputDecoration(
            hintText: titulo,
            labelText: titulo,
            labelStyle: AppTextStyles.titleH1
                .copyWith(color: AppColors.brandingPurple, fontSize: 24),
            hintStyle: textStyles ??
                AppTextStyles.button
                    .copyWith(fontSize: 20, color: AppColors.brandingPurple),
            fillColor: filledColor ?? AppColors.lightPurple,
            filled: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(color: AppColors.brandingPurple),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(color: AppColors.brandingPurple),
            ),
          ),
        ),
      ),
    );
  }
}
