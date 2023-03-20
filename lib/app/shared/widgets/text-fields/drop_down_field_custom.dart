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
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: SizedBox(
        height: 80,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 6.0, left: 4),
              child: Text(
                titulo.toString(),
                style: const TextStyle(fontSize: 18),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButtonFormField<T>(
                  value: value,
                  isExpanded: true,
                  onChanged: onChanged,
                  items: items,
                  iconEnabledColor: AppColors.brandingBlue,
                  iconSize: 32,
                  style: textStyles ??
                      AppTextStyles.button.copyWith(
                          fontSize: 24, color: AppColors.brandingBlue),
                  decoration: InputDecoration(
                    labelStyle: AppTextStyles.titleH1
                        .copyWith(color: AppColors.brandingBlue, fontSize: 24),
                    hintStyle: textStyles ??
                        AppTextStyles.button.copyWith(
                            fontSize: 20, color: AppColors.brandingBlue),
                    fillColor: filledColor ?? AppColors.lightPurple,
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: AppColors.brandingBlue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: AppColors.brandingBlue),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
