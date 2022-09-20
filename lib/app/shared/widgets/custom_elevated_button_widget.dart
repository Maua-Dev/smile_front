import 'package:flutter/material.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_web.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

class CustomElevatedButtonWidget extends StatelessWidget {
  final bool? isLoading;
  final String? title;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final double? widthSize;
  final double? heightSize;
  final double? paddingHorizontal;
  final double? paddingVertical;
  final double? borderRadius;
  final Function()? onPressed;

  const CustomElevatedButtonWidget({
    Key? key,
    this.backgroundColor,
    this.onPressed,
    this.title,
    this.widthSize,
    this.heightSize,
    this.paddingHorizontal,
    this.paddingVertical,
    this.isLoading,
    this.textStyle,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: paddingHorizontal ?? 0, vertical: paddingVertical ?? 0),
      child: SizedBox(
        width: widthSize,
        height: heightSize,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return backgroundColor!;
              } else if (states.contains(MaterialState.disabled)) {
                return AppColors.gray;
              }
              return backgroundColor!;
            }),
            alignment: Alignment.center,
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 15))),
          ),
          child: isLoading != null && isLoading!
              ? const CircularProgressIndicator()
              : TextRenderer(
                  child: Text(title ?? '',
                    textAlign: TextAlign.center,
                    style: textStyle ??
                        AppTextStyles.body.copyWith(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width < 1300
                                ? 20
                                : 24)),)
        ),
      ),
    );
  }
}
