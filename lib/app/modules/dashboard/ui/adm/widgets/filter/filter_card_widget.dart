// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

class FilterCardWidget extends StatelessWidget {
  const FilterCardWidget({
    Key? key,
  }) : super(key: key);

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
          DropdownButtonFormField(
            isExpanded: true,
            decoration: InputDecoration(
              isDense: true,
              isCollapsed: false,
              hintText: 'Atividades',
              fillColor: AppColors.white,
              constraints: const BoxConstraints(maxHeight: 47, maxWidth: 227),
              filled: true,
              hintStyle: AppTextStyles.body.copyWith(fontSize: 30),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
            items: ActivityEnum.values.map((ActivityEnum activityEnum) {
              return DropdownMenuItem<ActivityEnum>(
                  value: activityEnum,
                  child: Text(activityEnum.name.toString(),
                      style: AppTextStyles.body.copyWith(fontSize: 20)));
            }).toList(),
            onChanged: (value) {},
          ),
          InkWell(
            child: Container(
              width: 227,
              height: 47,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Data',
                        style: AppTextStyles.body.copyWith(fontSize: 30)),
                    const Icon(
                      Icons.arrow_drop_down,
                      size: 24,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
            onTap: () {
              showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2022),
                  lastDate: DateTime(2222));
            },
          ),
          InkWell(
            child: Container(
              width: 227,
              height: 47,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Hora',
                        style: AppTextStyles.body.copyWith(fontSize: 30)),
                    const Icon(
                      Icons.arrow_drop_down,
                      size: 24,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
            onTap: () {
              showTimePicker(
                  context: context,
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
                  });
            },
          )
        ]));
  }
}
