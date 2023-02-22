import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../shared/themes/app_colors.dart';

class EnableTextFieldCheckBoxWidget extends StatelessWidget {
  final bool check;
  final Function(bool?)? onChanged;
  final String title;
  const EnableTextFieldCheckBoxWidget({
    Key? key,
    required this.check,
    this.onChanged,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 600
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Observer(builder: (_) {
                return Checkbox(
                  activeColor: AppColors.brandingBlue,
                  value: check,
                  onChanged: onChanged,
                );
              }),
              const SizedBox(width: 5),
              Flexible(
                child: Text(
                  title,
                  style: TextStyle(color: AppColors.gray, fontSize: 14),
                ),
              )
            ],
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 24,
                width: 24,
                child: Checkbox(
                  activeColor: AppColors.brandingBlue,
                  value: check,
                  onChanged: onChanged,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Flexible(
                child: Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              )
            ],
          );
  }
}
