import 'package:flutter/material.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';

class InputBox extends StatelessWidget {
  final IconData icon;
  final String placeholder;
  final double? widthSize;
  final double? heightSize;
  final bool? disable;

  const InputBox({
    Key? key,
    required this.icon,
    required this.placeholder,
    this.widthSize,
    this.heightSize,
    this.disable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      width: widthSize ?? 600,
      height: heightSize ?? 60,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: disable != null
                  ? disable!
                      ? AppColors.lightBlue
                      : AppColors.brandingBlue
                  : AppColors.brandingBlue,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 25, top: heightSize != null ? heightSize! / 3.3 : 19),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 70),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding:
                    EdgeInsets.all(heightSize != null ? heightSize! / 4 : 19),
                child: Container(
                  margin: const EdgeInsets.only(left: 10.0),
                  child: TextFormField(
                    enabled: disable != null ? !disable! : true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: placeholder,
                      fillColor: AppColors.brandingBlue,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
