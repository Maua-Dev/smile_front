// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/shared/entities/screen_variables.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';
import 'package:smile_front/generated/l10n.dart';

import '../../../../../../../shared/themes/breakpoint.dart';

class UserFilterCardWidget extends StatelessWidget {
  final Function(ActivityEnum?)? onChangedActivitiesFilter;
  final Color? mainColor;
  final ActivityEnum? typeFilter;
  final String? typeOnScreen;
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
    required this.typeOnScreen,
    required this.typeFilter,
    required this.dateFilter,
    required this.hourFilter,
    required this.resetFilters,
    this.mainColor,
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
                color: mainColor ?? AppColors.brandingBlue,
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
                        ? 127
                        : MediaQuery.of(context).size.width > breakpointTablet
                            ? 230
                            : 130,
                    height: MediaQuery.of(context).size.width > breakpointTablet
                        ? 47
                        : 36,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width > tabletSize
                              ? 12
                              : 6,
                          4,
                          MediaQuery.of(context).size.width > tabletSize
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
                                typeFilter == null
                                    ? S.of(context).activitiesTitle
                                    : typeOnScreen!,
                                style: AppTextStyles.body.copyWith(
                                    fontSize: typeFilter == null
                                        ? MediaQuery.of(context).size.width >
                                                tabletSize
                                            ? 25
                                            : 16
                                        : MediaQuery.of(context).size.width >
                                                tabletSize
                                            ? 14
                                            : 7)),
                          ),
                          IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      content: SizedBox(
                                        width: 500,
                                        height: 500,
                                        child: ListView.builder(
                                            itemCount:
                                                ActivityEnum.values.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 12,
                                                        horizontal: 30),
                                                child: ElevatedButton(
                                                  style: ButtonStyle(
                                                    shape: MaterialStateProperty
                                                        .all<
                                                            RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                          side: BorderSide(
                                                              color: AppColors
                                                                  .white),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    onChangedActivitiesFilter!(
                                                        ActivityEnum
                                                            .values[index]);
                                                    Modular.to.pop();
                                                  },
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      ActivityEnum
                                                          .values[index].name
                                                          .toString(),
                                                      style: AppTextStyles.bold
                                                          .copyWith(
                                                              color: AppColors
                                                                  .white,
                                                              fontSize: 16),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                      ),
                                    );
                                  });
                            },
                            highlightColor: AppColors.white,
                            hoverColor: AppColors.white,
                            icon: const Icon(Icons.arrow_drop_down),
                            color: Colors.black,
                            iconSize:
                                MediaQuery.of(context).size.width > tabletSize
                                    ? 24
                                    : 14,
                          ),
                        ],
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
                          MediaQuery.of(context).size.width > tabletSize
                              ? 12
                              : 6,
                          4,
                          MediaQuery.of(context).size.width > tabletSize
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
                                                tabletSize
                                            ? 25
                                            : 16
                                        : MediaQuery.of(context).size.width >
                                                tabletSize
                                            ? 14
                                            : 7)),
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
                            iconSize:
                                MediaQuery.of(context).size.width > tabletSize
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
                          MediaQuery.of(context).size.width > tabletSize
                              ? 12
                              : 6,
                          4,
                          MediaQuery.of(context).size.width > tabletSize
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
                                                tabletSize
                                            ? 25
                                            : 16
                                        : MediaQuery.of(context).size.width >
                                                tabletSize
                                            ? 14
                                            : 7)),
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
                            iconSize:
                                MediaQuery.of(context).size.width > tabletSize
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
              style: ElevatedButton.styleFrom(backgroundColor: mainColor),
              icon: const Icon(Icons.delete),
              label: Text(S.of(context).cleanFiltersTitle)),
        ),
      ],
    );
  }
}
