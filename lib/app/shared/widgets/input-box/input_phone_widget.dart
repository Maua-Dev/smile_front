import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/generated/l10n.dart';

class InputPhoneWidget extends StatelessWidget {
  final IconData icon;
  final String placeholder;
  final double? widthSize;
  final String? Function(String?)? validation;
  final Function(String value) setValue;
  final void Function(String?)? onFieldSubmitted;
  final PhoneNumber number = PhoneNumber(isoCode: 'BR');

  InputPhoneWidget({
    Key? key,
    required this.icon,
    required this.placeholder,
    this.widthSize,
    this.validation,
    required this.setValue,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: widthSize ??
            (MediaQuery.of(context).size.width < 650
                ? MediaQuery.of(context).size.width * 0.85
                : 600),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: InternationalPhoneNumberInput(
            validator: validation,
            onFieldSubmitted: onFieldSubmitted,
            onInputChanged: (PhoneNumber number) {
              setValue(number.phoneNumber!);
            },
            selectorConfig: const SelectorConfig(
              useEmoji: true,
              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
            ),
            keyboardType: const TextInputType.numberWithOptions(
                signed: true, decimal: true),
            ignoreBlank: true,
            maxLength: 20,
            initialValue: number,
            searchBoxDecoration: InputDecoration(
              hintText: S.of(context).registerCountryPlaceholder,
              hintStyle: TextStyle(color: AppColors.white),
              fillColor: AppColors.gray,
              filled: true,
              errorStyle: TextStyle(
                color: AppColors.brandingOrange,
                fontSize: 16,
                height: 1,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.brandingOrange),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.brandingOrange),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            selectorTextStyle: TextStyle(
              color: AppColors.placeholder,
              fontSize: 16,
            ),
            formatInput: true,
            textStyle: TextStyle(color: AppColors.white),
            inputDecoration: InputDecoration(
              fillColor: AppColors.gray,
              filled: true,
              errorStyle: TextStyle(
                color: AppColors.brandingOrange,
                fontSize: 16,
                height: 1,
              ),
              prefixIcon: Icon(icon, size: 24),
              contentPadding: const EdgeInsets.all(24),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.brandingOrange),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.brandingOrange),
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: S.of(context).registerPhonePlaceholder,
              hintStyle: TextStyle(color: AppColors.placeholder),
            ),
          ),
        ));
  }
}
