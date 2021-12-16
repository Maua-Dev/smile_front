import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../utils/string_extensions.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

class TimerNavigationButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  const TimerNavigationButtonWidget({Key? key, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final timeNow = DateFormat('hh:mm');
    final weekDay = DateFormat('EEEE').format(DateTime.now()).capitalize();
    final day = DateTime.now().day.toString();
    final month = DateFormat('MMMM').format(DateTime.now());
    final year = DateTime.now().year.toString();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: SizedBox(
          height: 200,
          width: 616,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                timeNow.format(DateTime.now()),
                style: AppTextStyles.buttonBold.copyWith(fontSize: 100),
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: '$weekDay, ',
                      style: AppTextStyles.button.copyWith(fontSize: 25)),
                  TextSpan(
                      text: '$day de $month ',
                      style: AppTextStyles.buttonBold.copyWith(fontSize: 25)),
                  TextSpan(
                      text: 'de $year',
                      style: AppTextStyles.button.copyWith(fontSize: 25)),
                ]),
              ),
            ],
          ),
        ),
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
                const EdgeInsets.symmetric(horizontal: 24, vertical: 24)),
            elevation: MaterialStateProperty.all<double?>(10),
            backgroundColor:
                MaterialStateProperty.all<Color?>(AppColors.brandingBlue),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ))),
      ),
    );
  }
}
