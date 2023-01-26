import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

class FilterCardWidget extends StatefulWidget {
  final Function(ActivityEnum?)? onChangedActivitiesFilter;
  final Function(DateTime?)? onChangedDateFilter;
  final Function(DateTime?)? onChangedTimeFilter;
  const FilterCardWidget({
    Key? key,
    this.onChangedActivitiesFilter,
    this.onChangedDateFilter,
    this.onChangedTimeFilter,
  }) : super(key: key);

  @override
  State<FilterCardWidget> createState() => _FilterCardWidgetState();
}

class _FilterCardWidgetState extends State<FilterCardWidget> {
  String _dateString = '';
  String _timeString = '';

  @override
  Widget build(BuildContext context) {
    return Container(
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
        width: 787,
        height: 47,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            width: 227,
            height: 47,
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 3, 3, 0),
              child: DropdownButtonFormField(
                iconSize: 24,
                isExpanded: true,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'Atividades',
                  fillColor: AppColors.white,
                  filled: true,
                  hintStyle: AppTextStyles.body.copyWith(fontSize: 25),
                  border: InputBorder.none,
                ),
                items: ActivityEnum.values.map((ActivityEnum activityEnum) {
                  return DropdownMenuItem<ActivityEnum>(
                      value: activityEnum,
                      child: Text(activityEnum.name.toString(),
                          style: AppTextStyles.body.copyWith(fontSize: 15)));
                }).toList(),
                onChanged: widget.onChangedActivitiesFilter,
              ),
            ),
          ),
          Container(
            width: 227,
            height: 47,
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 4, 12, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(_dateString == '' ? 'Data' : _dateString,
                        style: AppTextStyles.body
                            .copyWith(fontSize: _dateString == '' ? 25 : 16)),
                  ),
                  IconButton(
                    onPressed: () {
                      showDatePicker(
                          context: context,
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
                        setState(() {
                          _dateString = DateFormat('dd/MM/yyyy').format(date!);
                        });
                        widget.onChangedDateFilter!(date);
                      });
                    },
                    highlightColor: AppColors.white,
                    hoverColor: AppColors.white,
                    icon: const Icon(Icons.arrow_drop_down),
                    color: Colors.black,
                    iconSize: 24,
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 227,
            height: 47,
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 4, 12, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(_timeString == '' ? 'Hora' : _timeString,
                        style: AppTextStyles.body
                            .copyWith(fontSize: _timeString == '' ? 25 : 16)),
                  ),
                  IconButton(
                    onPressed: () {
                      showTimePicker(
                          context: context,
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
                        setState(() {
                          _timeString = time!.format(context);
                        });
                        var now = DateTime.now();
                        now = DateTime(now.year, now.month, now.day, time!.hour,
                            time.minute);
                        widget.onChangedTimeFilter!(now);
                      });
                    },
                    highlightColor: AppColors.white,
                    hoverColor: AppColors.white,
                    icon: const Icon(Icons.arrow_drop_down),
                    color: Colors.black,
                    iconSize: 24,
                  ),
                ],
              ),
            ),
          ),
        ]));
  }
}
