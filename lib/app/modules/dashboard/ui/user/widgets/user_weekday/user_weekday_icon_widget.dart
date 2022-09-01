import 'package:flutter/material.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/weekdays_enum.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

class UserWeekdayIconWidget extends StatelessWidget {
  final int? weekday;
  final int myIndex;
  final int indexToShow;
  final Function()? onPressed;

  const UserWeekdayIconWidget(
      {Key? key,
      this.weekday,
      required this.myIndex,
      this.onPressed,
      required this.indexToShow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          backgroundColor: indexToShow == myIndex
              ? AppColors.brandingPurple
              : AppColors.lilac,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          )),
      child: Column(
        children: [
          Text(
            weekday != null ? WeekdaysEnum.values[weekday!].abreviation : '',
            style: AppTextStyles.titleH1.copyWith(
                fontSize: MediaQuery.of(context).size.width < 800 ? 24 : 32,
                color: indexToShow == myIndex
                    ? Colors.white
                    : AppColors.brandingPurple),
          ),
          Text(
            weekday != null ? WeekdaysEnum.values[weekday!].date : '',
            style: AppTextStyles.button.copyWith(
                fontSize: MediaQuery.of(context).size.width < 800 ? 16 : 24,
                color: indexToShow == myIndex
                    ? Colors.white
                    : AppColors.brandingPurple),
          ),
        ],
      ),
    );
  }
}
