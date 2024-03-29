import 'package:flutter/material.dart';
import 'package:smile_front/generated/l10n.dart';

import '../../../../shared/themes/app_colors.dart';

class RadioAskButtons extends StatelessWidget {
  final double? heightSize;
  final double? widthSize;
  final bool awnser;
  final String question;
  final Function(bool value) onPressed;

  const RadioAskButtons({
    Key? key,
    this.heightSize,
    this.widthSize,
    required this.awnser,
    required this.question,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthSize ?? 600,
      height: heightSize ?? 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              question,
              style: const TextStyle(fontSize: 15),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 40,
                  child: TextButton(
                    onPressed: () {
                      onPressed(true);
                    },
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.brandingBlue),
                        color: awnser ? AppColors.brandingBlue : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                Text(
                  S.of(context).yesTitle,
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 40,
                  child: TextButton(
                    onPressed: () {
                      onPressed(false);
                    },
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.brandingBlue),
                        color: awnser ? Colors.white : AppColors.brandingBlue,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                Text(
                  S.of(context).noTitle,
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
