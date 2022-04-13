import 'package:flutter/material.dart';

import '../../../../shared/themes/app_colors.dart';

class CheckBoxWidget extends StatelessWidget {
  final bool check;
  final Function(bool?)? onChanged;
  final String text;
  const CheckBoxWidget(
      {Key? key, required this.check, this.onChanged, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      width: MediaQuery.of(context).size.width < 650
          ? MediaQuery.of(context).size.width * 0.85
          : 600,
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.gray,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Checkbox(
            activeColor: AppColors.brandingPurple,
            value: check,
            onChanged: onChanged,
          ),
          const SizedBox(width: 5),
          Flexible(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}
