import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../utils/string_extensions.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';
import '../responsivity_logged_user_home.dart';

class TimerNavigationButtonWidget extends StatelessWidget {
  final String time;
  final Function()? onPressed;
  const TimerNavigationButtonWidget(
      {Key? key, required this.time, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final weekDay = DateFormat('EEEE').format(DateTime.now()).capitalize();
    final day = DateTime.now().day.toString();
    final month = DateFormat('MMMM').format(DateTime.now());
    final year = DateTime.now().year.toString();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: SizedBox(
          height: timerNavigationHeight(height),
          width: timerNavigationWidth(size),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  time,
                  style: AppTextStyles.buttonBold
                      .copyWith(fontSize: timerNavigationTimeSize(size)),
                ),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: '$weekDay, ',
                        style: AppTextStyles.button
                            .copyWith(fontSize: timerNavigationTextSize(size))),
                    TextSpan(
                        text: '$day de $month ',
                        style: AppTextStyles.buttonBold
                            .copyWith(fontSize: timerNavigationTextSize(size))),
                    TextSpan(
                        text: 'de $year',
                        style: AppTextStyles.button
                            .copyWith(fontSize: timerNavigationTextSize(size))),
                  ]),
                ),
              ],
            ),
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
