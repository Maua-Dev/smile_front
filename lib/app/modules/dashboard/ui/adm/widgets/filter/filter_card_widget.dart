// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';
import 'package:smile_front/generated/l10n.dart';
import '../../../user/widgets/mobile_widgets/filter/widgets/button_filter_widget.dart';

class FilterCardWidget extends StatelessWidget {
  final Function(ActivityEnum?)? onChangedActivitiesFilter;
  final ActivityEnum? typeFilter;
  final String? typeOnScreen;
  final Function(DateTime?)? onChangedDateFilter;
  final DateTime? dateFilter;
  final Function(DateTime?)? onChangedTimeFilter;
  final DateTime? hourFilter;
  final Function()? resetFilters;
  const FilterCardWidget({
    Key? key,
    this.typeOnScreen,
    this.onChangedActivitiesFilter,
    this.onChangedDateFilter,
    this.onChangedTimeFilter,
    this.typeFilter,
    this.dateFilter,
    this.hourFilter,
    this.resetFilters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        dateFilter != null ? DateFormat('dd/MM/yyyy').format(dateFilter!) : '';
    String formattedHour =
        hourFilter != null ? DateFormat('HH:mm').format(hourFilter!) : '';
    return Row(children: [
      Flexible(
        child: ButtonFilterWidget(
          title: typeFilter == null
              ? S.of(context).activitiesTitle
              : typeOnScreen!,
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
                                        side:
                                            BorderSide(color: AppColors.white),
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
                                    ActivityEnum.values[index].name.toString(),
                                    style: AppTextStyles.bold.copyWith(
                                        color: AppColors.white, fontSize: 16),
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
      ),
      const SizedBox(
        width: 8,
      ),
      Flexible(
        child: ButtonFilterWidget(
          title: formattedDate == '' ? S.of(context).dateTitle : formattedDate,
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
                            TextTheme(headlineSmall: AppTextStyles.body)),
                    child: child!,
                  );
                })).then((date) {
              formattedDate = DateFormat('dd/MM/yyyy').format(date!);
              onChangedDateFilter!(date);
            });
          },
        ),
      ),
      const SizedBox(
        width: 8,
      ),
      Flexible(
        child: ButtonFilterWidget(
          title:
              formattedHour == '' ? S.of(context).scheduleTitle : formattedHour,
          onPressed: () {
            showTimePicker(
                context: context,
                initialEntryMode: TimePickerEntryMode.dialOnly,
                initialTime: TimeOfDay.now(),
                builder: (BuildContext context, Widget? child) {
                  return Theme(
                    data: ThemeData.light().copyWith(
                      primaryColor: AppColors.brandingBlue,
                      colorScheme:
                          ColorScheme.light(primary: AppColors.brandingBlue),
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
      ),
      const SizedBox(
        width: 8,
      ),
      IconButton(
          padding: EdgeInsets.zero,
          onPressed: resetFilters,
          icon: Icon(
            Icons.cleaning_services,
            size: 35,
            color: AppColors.brandingOrange,
          )),
    ]);
  }
}
