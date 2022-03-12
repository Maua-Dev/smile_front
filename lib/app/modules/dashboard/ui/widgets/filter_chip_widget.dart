import 'package:flutter/material.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';

class FilterChipWidget extends StatelessWidget {
  final ActivityEnum activityType;
  final Function()? onTap;
  const FilterChipWidget({
    Key? key,
    this.onTap,
    required this.activityType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              color: AppColors.lightBlue,
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              activityType.name,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        )
      ],
    );
  }
}
