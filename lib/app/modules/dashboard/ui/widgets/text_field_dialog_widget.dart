import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../shared/themes/app_colors.dart';
import '../../../../shared/themes/app_text_styles.dart';

class TextFieldDialogWidget extends StatelessWidget {
  final String hintText;
  final String? value;
  final bool padding;
  final void Function(String value)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  const TextFieldDialogWidget({
    Key? key,
    required this.hintText,
    this.value,
    this.padding = true,
    this.inputFormatters,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController(text: value);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: padding ? 114 : 0, vertical: padding ? 8 : 0),
      child: TextField(
        onChanged: onChanged,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        textAlignVertical: TextAlignVertical.center,
        inputFormatters: inputFormatters,
        controller: controller,
        style: AppTextStyles.body
            .copyWith(color: AppColors.brandingBlue, fontSize: 20),
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(color: AppColors.brandingBlue, width: 0.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(color: AppColors.brandingBlue, width: 0.0),
            ),
            hintText: hintText,
            labelText: hintText,
            labelStyle: AppTextStyles.titleH1
                .copyWith(color: AppColors.brandingBlue, fontSize: 22),
            hintStyle: AppTextStyles.body
                .copyWith(color: AppColors.brandingBlue, fontSize: 20),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            filled: true,
            fillColor: Colors.white),
      ),
    );
  }
}
