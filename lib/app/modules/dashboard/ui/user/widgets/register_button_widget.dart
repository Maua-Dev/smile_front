import 'package:flutter/material.dart';
import 'package:smile_front/app/shared/entities/infra/enrollment_state_enum.dart';
import 'package:smile_front/generated/l10n.dart';
import '../../../../../shared/themes/app_colors.dart';
import '../../../../../shared/themes/app_text_styles.dart';

class RegisterButtonWidget extends StatelessWidget {
  final EnrollmentStateEnum isRegistered;
  final bool activityIsFull;
  final bool isLoading;
  final Function()? onPressed;
  const RegisterButtonWidget(
      {Key? key,
      required this.isRegistered,
      required this.activityIsFull,
      this.onPressed,
      required this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 163,
      child: ElevatedButton(
          style: ButtonStyle(
              padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 8)),
              elevation: MaterialStateProperty.all(20),
              backgroundColor: MaterialStateProperty.all(
                isRegistered == EnrollmentStateEnum.ENROLLED
                    ? AppColors.redButton
                    : isRegistered == EnrollmentStateEnum.COMPLETED
                        ? AppColors.greenButton
                        : AppColors.brandingBlue,
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
              )),
          onPressed: onPressed,
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.white,
                ))
              : Text(
                  isRegistered == EnrollmentStateEnum.ENROLLED
                      ? S.of(context).unsubscribe
                      : isRegistered == EnrollmentStateEnum.IN_QUEUE
                          ? S.of(context).inQueueTitle
                          : activityIsFull
                              ? S.of(context).joinQueueTitle
                              : isRegistered == EnrollmentStateEnum.COMPLETED
                                  ? S.of(context).completed
                                  : S.of(context).signUp,
                  style: AppTextStyles.buttonBold.copyWith(
                      fontSize: isRegistered == EnrollmentStateEnum.IN_QUEUE
                          ? 14
                          : MediaQuery.of(context).size.width < 500
                              ? 16
                              : 18,
                      color: Colors.white))),
    );
  }
}
