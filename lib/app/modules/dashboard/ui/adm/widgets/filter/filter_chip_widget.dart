import 'package:flutter/material.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

class FilterChipWidget extends StatelessWidget {
  final ActivityEnum activityType;
  final bool selected;
  final Function()? onTap;
  const FilterChipWidget({
    Key? key,
    this.onTap,
    required this.activityType,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
                color: selected ? AppColors.brandingBlue : AppColors.lightBlue,
                borderRadius: BorderRadius.circular(45)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                activityType.name,
                textAlign: TextAlign.center,
                style: AppTextStyles.body.copyWith(
                  color: selected ? Colors.white : AppColors.brandingBlue,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        )
      ],
    );
  }
}
