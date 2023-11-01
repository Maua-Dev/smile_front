import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smile_front/app/shared/widgets/tooltip/tooltip_widget.dart';
import '../../../../../../shared/themes/app_colors.dart';
import '../../../../../../shared/themes/app_text_styles.dart';

class TextFieldDialogWidget extends StatelessWidget {
  final String? hintText;
  final String labelText;
  final String? value;
  final bool padding;
  final IconData? suffixIcon;
  final TooltipWidget? suffixTooltip;
  final String? Function(String? value)? validator;
  final void Function(String value)? onChanged;
  final void Function()? onPressedIcon;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? inputType;
  final bool? readonly;
  const TextFieldDialogWidget(
      {Key? key,
      this.hintText,
      this.validator,
      this.value,
      this.padding = true,
      this.inputFormatters,
      this.onChanged,
      required this.labelText,
      this.suffixIcon,
      this.suffixTooltip,
      this.onPressedIcon,
      this.inputType,
      this.readonly})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController(text: value);
    controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length));
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: padding ? 114 : 0, vertical: padding ? 8 : 0),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 6.0, left: 4),
              child: Text(
                labelText,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            Container(
              height: 72,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextFormField(
                readOnly: readonly ?? false,
                keyboardType: inputType ?? TextInputType.multiline,
                validator: validator,
                controller: controller,
                onChanged: onChanged,
                maxLines: null,
                textAlignVertical: TextAlignVertical.center,
                inputFormatters: inputFormatters,
                style: AppTextStyles.headline1.copyWith(
                    color: readonly ?? false
                        ? AppColors.gray
                        : AppColors.brandingBlue,
                    fontSize:
                        MediaQuery.of(context).size.width < 1200 ? 16 : 20),
                decoration: InputDecoration(
                    isDense: true,
                    suffixIcon: suffixIcon != null
                        ? IconButton(
                            icon: Icon(
                              suffixIcon,
                              color: AppColors.brandingBlue,
                            ),
                            onPressed: onPressedIcon,
                          )
                        : suffixTooltip,
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.brandingOrange),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.brandingOrange),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorStyle: TextStyle(
                      color: AppColors.brandingOrange,
                      fontSize: 16,
                      height: 1,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          BorderSide(color: AppColors.brandingBlue, width: 0.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          BorderSide(color: AppColors.brandingBlue, width: 0.0),
                    ),
                    labelStyle: AppTextStyles.headline1
                        .copyWith(color: AppColors.brandingBlue, fontSize: 22),
                    hintStyle: AppTextStyles.headline1
                        .copyWith(color: AppColors.brandingBlue, fontSize: 20),
                    contentPadding: suffixIcon != null
                        ? const EdgeInsets.only(left: 16, top: 16, bottom: 16)
                        : const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                    filled: true,
                    fillColor: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
