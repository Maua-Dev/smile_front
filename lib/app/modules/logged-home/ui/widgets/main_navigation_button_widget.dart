import 'package:flutter/material.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';
import '../responsivity_logged_home.dart';

class MainNavigationButtonWidget extends StatelessWidget {
  final String userName;
  final String activityName;
  final String activityDate;
  final String activityTime;
  final String? activityRemainTime;
  final Function()? onPressed;
  final double? cardWidth;
  const MainNavigationButtonWidget(
      {Key? key,
      this.onPressed,
      required this.userName,
      required this.activityName,
      required this.activityDate,
      required this.activityTime,
      this.activityRemainTime,
      this.cardWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: SizedBox(
          height: height * 0.4,
          width: cardWidth ?? width * 0.3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: 'Olá, ',
                          style: AppTextStyles.button.copyWith(
                              fontSize: mainNavigationTitleSize(height))),
                      TextSpan(
                          text: '$userName!',
                          style: AppTextStyles.buttonBold.copyWith(
                              fontSize: mainNavigationTitleSize(height))),
                    ]),
                  ),
                  Text(
                    'Sua próxima atividade é',
                    style: AppTextStyles.button.copyWith(
                        fontSize: mainNavigationCopyButtonSize(width)),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: Column(
                  children: [
                    Text(activityName,
                        style: AppTextStyles.buttonBold.copyWith(
                            fontSize:
                                mainNavigationActivitySize(width, height))),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: mainNavigationIconSize(width),
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(activityDate,
                                style: AppTextStyles.button.copyWith(
                                    fontSize:
                                        mainNavigationCopyButtonSize(width))),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.timer,
                          size: mainNavigationIconSize(width),
                          color: Colors.white,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(activityTime,
                              style: AppTextStyles.button.copyWith(
                                  fontSize:
                                      mainNavigationCopyButtonSize(width))),
                        ),
                        Text('($activityRemainTime)',
                            style: AppTextStyles.button.copyWith(
                                fontSize: mainNavigationCopyButtonSize(width))),
                      ],
                    ),
                  ],
                ),
              ),
              Center(
                child: Text('Clique aqui para mais informações',
                    style: AppTextStyles.thinButton.copyWith(
                        fontSize: mainNavigationCopyButtonSize(width))),
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
