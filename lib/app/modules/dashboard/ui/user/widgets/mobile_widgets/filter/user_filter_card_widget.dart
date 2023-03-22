// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/ui/user/widgets/mobile_widgets/filter/widgets/button_filter_widget.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';
import 'package:smile_front/generated/l10n.dart';
import '../../../../../../../shared/entities/infra/enroll_button_enum.dart';
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
  final EnrollButtonEnum? enrollmentFilter;
  final Function(EnrollButtonEnum?) onChangedEnrollmentFilter;
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
    this.enrollmentFilter,
    required this.onChangedEnrollmentFilter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        dateFilter != null ? DateFormat('dd/MM/yyyy').format(dateFilter!) : '';
    String formattedHour =
        hourFilter != null ? DateFormat('HH:mm').format(hourFilter!) : '';
    return SizedBox(
      width: MediaQuery.of(context).size.width < breakpointLMobile
          ? MediaQuery.of(context).size.width
          : MediaQuery.of(context).size.width < breakpointTablet
              ? 360
              : 1165,
      child: MediaQuery.of(context).size.width < breakpointTablet
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Column(
                children: [
                  ButtonFilterWidget(
                    title: typeFilter == null
                        ? S.of(context).activitiesTitle
                        : typeOnScreen!,
                    width: MediaQuery.of(context).size.width,
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: SizedBox(
                                width: 500,
                                height: 500,
                                child: ListView.builder(
                                    itemCount: ActivityEnum.values.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 12, horizontal: 30),
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      color: AppColors.white),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                            ),
                                          ),
                                          onPressed: () {
                                            onChangedActivitiesFilter!(
                                                ActivityEnum.values[index]);
                                            Modular.to.pop();
                                          },
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              ActivityEnum.values[index].name
                                                  .toString(),
                                              style: AppTextStyles.bold
                                                  .copyWith(
                                                      color: AppColors.white,
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
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ButtonFilterWidget(
                    title: enrollmentFilter == null
                        ? S.of(context).enrollmentTitle
                        : enrollmentFilter!.name,
                    width: MediaQuery.of(context).size.width,
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: SizedBox(
                                width: 500,
                                height: 500,
                                child: ListView.builder(
                                    itemCount: EnrollButtonEnum.values.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 12, horizontal: 30),
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      color: AppColors.white),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                            ),
                                          ),
                                          onPressed: () {
                                            onChangedEnrollmentFilter(
                                                EnrollButtonEnum.values[index]);
                                            Modular.to.pop();
                                          },
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              EnrollButtonEnum
                                                  .values[index].name
                                                  .toString(),
                                              style: AppTextStyles.bold
                                                  .copyWith(
                                                      color: AppColors.white,
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
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonFilterWidget(
                        title: formattedDate == ''
                            ? S.of(context).dateTitle
                            : formattedDate,
                        width: 140,
                        onPressed: () {
                          showDatePicker(
                              context: context,
                              initialEntryMode:
                                  DatePickerEntryMode.calendarOnly,
                              initialDate: DateTime.now(),
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
                      ),
                      ButtonFilterWidget(
                        title: formattedHour == ''
                            ? S.of(context).scheduleTitle
                            : formattedHour,
                        width: 140,
                        onPressed: () {
                          showTimePicker(
                              context: context,
                              initialEntryMode: TimePickerEntryMode.dialOnly,
                              initialTime: TimeOfDay.now(),
                              builder: (BuildContext context, Widget? child) {
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
                      ),
                      IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: resetFilters,
                          icon: Icon(
                            Icons.cleaning_services,
                            size: 35,
                            color: AppColors.brandingOrange,
                          )),
                    ],
                  ),
                ],
              ),
            )
          : Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              ButtonFilterWidget(
                title: typeFilter == null
                    ? S.of(context).activitiesTitle
                    : typeOnScreen!,
                width: 400,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: SizedBox(
                            width: 500,
                            height: 500,
                            child: ListView.builder(
                                itemCount: ActivityEnum.values.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 30),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              side: BorderSide(
                                                  color: AppColors.white),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                      ),
                                      onPressed: () {
                                        onChangedActivitiesFilter!(
                                            ActivityEnum.values[index]);
                                        Modular.to.pop();
                                      },
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          ActivityEnum.values[index].name
                                              .toString(),
                                          style: AppTextStyles.bold.copyWith(
                                              color: AppColors.white,
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
              ),
              ButtonFilterWidget(
                title: enrollmentFilter == null
                    ? S.of(context).enrollmentTitle
                    : enrollmentFilter!.name,
                width: 200,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: SizedBox(
                            width: 500,
                            height: 500,
                            child: ListView.builder(
                                itemCount: EnrollButtonEnum.values.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 30),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              side: BorderSide(
                                                  color: AppColors.white),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                      ),
                                      onPressed: () {
                                        onChangedEnrollmentFilter(
                                            EnrollButtonEnum.values[index]);
                                        Modular.to.pop();
                                      },
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          EnrollButtonEnum.values[index].name
                                              .toString(),
                                          style: AppTextStyles.bold.copyWith(
                                              color: AppColors.white,
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
              ),
              ButtonFilterWidget(
                title: formattedDate == ''
                    ? S.of(context).dateTitle
                    : formattedDate,
                width: 200,
                onPressed: () {
                  showDatePicker(
                      context: context,
                      initialEntryMode: DatePickerEntryMode.calendarOnly,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2022),
                      lastDate: DateTime(2024),
                      builder: ((context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                              textTheme:
                                  TextTheme(headline5: AppTextStyles.body)),
                          child: child!,
                        );
                      })).then((date) {
                    formattedDate = DateFormat('dd/MM/yyyy').format(date!);
                    onChangedDateFilter!(date);
                  });
                },
              ),
              ButtonFilterWidget(
                title: formattedHour == ''
                    ? S.of(context).scheduleTitle
                    : formattedHour,
                width: 180,
                onPressed: () {
                  showTimePicker(
                      context: context,
                      initialEntryMode: TimePickerEntryMode.dialOnly,
                      initialTime: TimeOfDay.now(),
                      builder: (BuildContext context, Widget? child) {
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
                    now = DateTime(
                        now.year, now.month, now.day, time.hour, time.minute);
                    onChangedTimeFilter!(now);
                  });
                },
              ),
              IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: resetFilters,
                  icon: Icon(
                    Icons.cleaning_services,
                    size: 35,
                    color: AppColors.brandingOrange,
                  )),
            ]),
    );
  }
}
