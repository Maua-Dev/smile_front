import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

import 'activity_card_widget.dart';

class ActivitiesCarouselWidget extends StatelessWidget {
  final String? weekday;
  final Color? cardColor;
  final Color? textColor;
  final List<ActivityModel> list;

  const ActivitiesCarouselWidget({
    Key? key,
    required this.list,
    this.weekday,
    this.cardColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        weekday != null
            ? Padding(
                padding: const EdgeInsets.only(left: 72.0),
                child: Row(
                  children: [
                    Text(
                      weekday ?? '',
                      style: AppTextStyles.titleH1.copyWith(
                          fontSize: 40, color: AppColors.brandingBlue),
                    ),
                  ],
                ),
              )
            : Container(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 78, vertical: 32),
          child: SizedBox(
            height: 250,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: list.length,
                itemBuilder: (BuildContext ctx, index) {
                  String date =
                      DateFormat('dd/MM/yyyy').format(list[index].date);
                  String time = DateFormat('hh:mm').format(list[index].date);
                  return ActivityCardWidget(
                    cardColor: cardColor,
                    textColor: textColor,
                    name: list[index].title,
                    description: list[index].description,
                    date: date,
                    time: time,
                    maxParticipants: list[index].totalParticipants.toString(),
                    totalParticipants: list[index].totalParticipants.toString(),
                  );
                }),
          ),
        )
      ],
    );
  }
}
