import 'package:flutter/material.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';

class FilterButtonWidget extends StatelessWidget {
  final int index;
  const FilterButtonWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.brandingBlue,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(ActivityEnum.values[index].name),
        ],
      ),
    );
  }
}
