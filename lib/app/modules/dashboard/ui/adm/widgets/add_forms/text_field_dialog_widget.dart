import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../../shared/themes/app_colors.dart';
import '../../../../../../shared/themes/app_text_styles.dart';

class TextFieldDialogWidget extends StatelessWidget {
  final String? hintText;
  final String labelText;
  final String? value;
  final bool padding;
  final IconData? suffixIcon;
  final void Function(String value)? onChanged;
  final void Function()? onPressedIcon;
  final List<TextInputFormatter>? inputFormatters;
  const TextFieldDialogWidget({
    Key? key,
    this.hintText,
    this.value,
    this.padding = true,
    this.inputFormatters,
    this.onChanged,
    required this.labelText,
    this.suffixIcon,
    this.onPressedIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController(text: value);
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
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(5, 5), // changes position of shadow
                    ),
                  ]),
              child: TextFormField(
                controller: controller,
                onChanged: onChanged,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                textAlignVertical: TextAlignVertical.center,
                inputFormatters: inputFormatters,
                style: AppTextStyles.body.copyWith(
                    color: AppColors.brandingBlue,
                    fontSize:
                        MediaQuery.of(context).size.width < 1200 ? 16 : 20),
                decoration: InputDecoration(
                    suffixIcon: suffixIcon != null
                        ? IconButton(
                            icon: Icon(
                              suffixIcon,
                              color: AppColors.brandingBlue,
                            ),
                            onPressed: onPressedIcon,
                          )
                        : null,
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
                    labelStyle: AppTextStyles.titleH1
                        .copyWith(color: AppColors.brandingBlue, fontSize: 22),
                    hintStyle: AppTextStyles.body
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
