import 'package:flutter/material.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

class MainNavigationButtonWidget extends StatelessWidget {
  final String userName;
  final String activityName;
  final String activityDate;
  final String activityTime;
  final String? activityRemainTime;
  final Function()? onPressed;
  const MainNavigationButtonWidget(
      {Key? key,
      this.onPressed,
      required this.userName,
      required this.activityName,
      required this.activityDate,
      required this.activityTime,
      this.activityRemainTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: SizedBox(
          height: 500,
          width: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: 'Olá, ',
                      style: AppTextStyles.button.copyWith(fontSize: 45)),
                  TextSpan(
                      text: '$userName!',
                      style: AppTextStyles.buttonBold.copyWith(fontSize: 45)),
                ]),
              ),
              Text(
                'Sua próxima atividade é',
                style: AppTextStyles.button,
              ),
              Text(activityName,
                  style: AppTextStyles.buttonBold.copyWith(fontSize: 35)),
              Row(
                children: [
                  const Icon(
                    Icons.calendar_today,
                    size: 25,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(activityDate, style: AppTextStyles.button),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.timer,
                    size: 25,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(activityTime, style: AppTextStyles.button),
                  ),
                  Text('($activityRemainTime)', style: AppTextStyles.button),
                ],
              ),
              Center(
                child: Text('Clique aqui para mais informações',
                    style: AppTextStyles.thinButton),
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
