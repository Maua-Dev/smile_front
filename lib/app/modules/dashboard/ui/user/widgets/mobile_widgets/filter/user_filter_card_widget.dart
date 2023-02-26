// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';
import 'package:smile_front/app/shared/themes/breakpoint.dart';
import 'package:smile_front/generated/l10n.dart';

class UserFilterCardWidget extends StatelessWidget {
  final Function(ActivityEnum?)? onChangedActivitiesFilter;
  final ActivityEnum? typeFilter;
  final Function(DateTime?)? onChangedDateFilter;
  final DateTime? dateFilter;
  final Function(DateTime?)? onChangedTimeFilter;
  final DateTime? hourFilter;
  final Function()? resetFilters;
  const UserFilterCardWidget({
    Key? key,
    required this.onChangedActivitiesFilter,
    required this.onChangedDateFilter,
    required this.onChangedTimeFilter,
    required this.typeFilter,
    required this.dateFilter,
    required this.hourFilter,
    required this.resetFilters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        dateFilter != null ? DateFormat('dd/MM/yyyy').format(dateFilter!) : '';
    String formattedHour =
        hourFilter != null ? DateFormat('HH:mm').format(hourFilter!) : '';
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.brandingBlue,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    spreadRadius: 0.5,
                    blurRadius: 3,
                    offset: const Offset(5, 5), // changes position of shadow
                  ),
                ]),
            width: MediaQuery.of(context).size.width < breakpointLMobile
                ? 310
                : MediaQuery.of(context).size.width > breakpointTablet
                    ? 787
                    : 380,
            height:
                MediaQuery.of(context).size.width > breakpointTablet ? 47 : 36,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width < breakpointLMobile
                        ? 120
                        : MediaQuery.of(context).size.width > breakpointTablet
                            ? 227
                            : 160,
                    height: MediaQuery.of(context).size.width > breakpointTablet
                        ? 47
                        : 36,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          0,
                          MediaQuery.of(context).size.width > breakpointTablet
                              ? 8
                              : 2,
                          3,
                          MediaQuery.of(context).size.width > breakpointTablet
                              ? 7
                              : 8),
                      child: DropdownButtonFormField<ActivityEnum>(
                        value: typeFilter,
                        iconSize:
                            MediaQuery.of(context).size.width > breakpointTablet
                                ? 24
                                : 14,
                        isExpanded: true,
                        decoration: InputDecoration(
                          isDense: MediaQuery.of(context).size.width >
                                  breakpointTablet
                              ? true
                              : false,
                          hintText: S.of(context).activitiesTitle,
                          fillColor: AppColors.white,
                          filled: true,
                          hintStyle: AppTextStyles.body.copyWith(
                              fontSize: MediaQuery.of(context).size.width >
                                      breakpointTablet
                                  ? 25
                                  : 16),
                          border: InputBorder.none,
                        ),
                        items: ActivityEnum.values
                            .map((ActivityEnum activityEnum) {
                          return DropdownMenuItem<ActivityEnum>(
                              value: activityEnum,
                              child: Text(activityEnum.name.toString(),
                                  style: AppTextStyles.body.copyWith(
                                      fontSize:
                                          MediaQuery.of(context).size.width >
                                                  breakpointTablet
                                              ? 15
                                              : 10)));
                        }).toList(),
                        onChanged: onChangedActivitiesFilter,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width < breakpointLMobile
                        ? 80
                        : MediaQuery.of(context).size.width > breakpointTablet
                            ? 227
                            : 100,
                    height: MediaQuery.of(context).size.width > breakpointTablet
                        ? 47
                        : 36,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width > breakpointTablet
                              ? 12
                              : 6,
                          4,
                          MediaQuery.of(context).size.width > breakpointTablet
                              ? 12
                              : 0,
                          10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text(
                                formattedDate == ''
                                    ? S.of(context).dateTitle
                                    : formattedDate,
                                style: AppTextStyles.body.copyWith(
                                    fontSize: formattedDate == ''
                                        ? MediaQuery.of(context).size.width >
                                                breakpointTablet
                                            ? 25
                                            : 16
                                        : MediaQuery.of(context).size.width >
                                                breakpointTablet
                                            ? 16
                                            : 10)),
                          ),
                          IconButton(
                            onPressed: () {
                              showDatePicker(
                                  context: context,
                                  initialDate: DateTime.utc(2022, 5, 16),
                                  firstDate: DateTime(2022),
                                  lastDate: DateTime(2024),
                                  builder: ((context, child) {
                                    return Theme(
                                      data: Theme.of(context).copyWith(
                                          textTheme: TextTheme(
                                              headline5: AppTextStyles.body)),
                                      child: child!,
                                    );
                                  })).then((date) {
                                formattedDate =
                                    DateFormat('dd/MM/yyyy').format(date!);
                                onChangedDateFilter!(date);
                              });
                            },
                            highlightColor: AppColors.white,
                            hoverColor: AppColors.white,
                            icon: const Icon(Icons.arrow_drop_down),
                            color: Colors.black,
                            iconSize: MediaQuery.of(context).size.width >
                                    breakpointTablet
                                ? 24
                                : 14,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width < breakpointLMobile
                        ? 99
                        : MediaQuery.of(context).size.width > breakpointTablet
                            ? 227
                            : 105,
                    height: MediaQuery.of(context).size.width > breakpointTablet
                        ? 47
                        : 36,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width > breakpointTablet
                              ? 12
                              : 6,
                          4,
                          MediaQuery.of(context).size.width > breakpointTablet
                              ? 12
                              : 0,
                          10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text(
                                formattedHour == ''
                                    ? S.of(context).scheduleTitle
                                    : formattedHour,
                                style: AppTextStyles.body.copyWith(
                                    fontSize: formattedHour == ''
                                        ? MediaQuery.of(context).size.width >
                                                breakpointTablet
                                            ? 25
                                            : 16
                                        : MediaQuery.of(context).size.width >
                                                breakpointTablet
                                            ? 16
                                            : 10)),
                          ),
                          IconButton(
                            onPressed: () {
                              showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                  builder:
                                      (BuildContext context, Widget? child) {
                                    return Theme(
                                      data: ThemeData.light().copyWith(
                                        primaryColor: AppColors.brandingBlue,
                                        colorScheme: ColorScheme.light(
                                            primary: AppColors.brandingBlue),
                                      ),
                                      child: child!,
                                    );
                                  }).then((time) {
                                formattedHour = time!.format(context);
                                var now = DateTime.now();
                                now = DateTime(now.year, now.month, now.day,
                                    time.hour, time.minute);
                                onChangedTimeFilter!(now);
                              });
                            },
                            highlightColor: AppColors.white,
                            hoverColor: AppColors.white,
                            icon: const Icon(Icons.arrow_drop_down),
                            color: Colors.black,
                            iconSize: MediaQuery.of(context).size.width >
                                    breakpointTablet
                                ? 24
                                : 14,
                          ),
                        ],
                      ),
                    ),
                  ),
                ])),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 150,
          height: 30,
          child: ElevatedButton.icon(
              onPressed: resetFilters,
              icon: const Icon(Icons.delete),
              label: Text(S.of(context).cleanFiltersTitle)),
        ),
      ],
    );
  }
}
