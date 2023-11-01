import 'package:flutter/material.dart';
import 'package:smile_front/app/shared/domain/enum/enrollment_state_enum.dart';
import '../../../../../../../generated/l10n.dart';
import '../../../../../../shared/domain/entities/screen_variables.dart';
import '../../../../../../shared/themes/app_colors.dart';
import '../../../../../../shared/themes/app_text_styles.dart';
import '../../../../../../shared/themes/breakpoint.dart';
import '../../../../../../shared/widgets/dialogs/action_confirmation_dialog_widget.dart';

class StatusButtonWidget extends StatelessWidget {
  final bool isLoading;
  final Function()? onPressed;
  final bool acceptingNewEnrollments;
  final EnrollmentStateEnum enrollmentStateEnum;
  final Color buttonColor;
  final Color buttonBorderColor;
  final Color buttonTitleColor;
  final String dialogTitle;
  final String dialogContent;
  final String buttonTitle;
  final bool? disableButton;
  const StatusButtonWidget({
    Key? key,
    required this.onPressed,
    required this.isLoading,
    required this.acceptingNewEnrollments,
    required this.enrollmentStateEnum,
    required this.buttonColor,
    required this.buttonBorderColor,
    required this.buttonTitleColor,
    required this.dialogContent,
    required this.dialogTitle,
    required this.buttonTitle,
    this.disableButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (acceptingNewEnrollments == true ||
        enrollmentStateEnum == EnrollmentStateEnum.ENROLLED ||
        enrollmentStateEnum == EnrollmentStateEnum.COMPLETED ||
        enrollmentStateEnum == EnrollmentStateEnum.IN_QUEUE) {
      return SizedBox(
        width: MediaQuery.of(context).size.width < breakpointTablet ? 105 : 200,
        height: MediaQuery.of(context).size.width < breakpointTablet ? 25 : 50,
        child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width < tabletSize
                              ? 15
                              : 20),
                      side: BorderSide(color: buttonBorderColor))),
              backgroundColor: MaterialStateProperty.all(buttonColor),
            ),
            onPressed: () {
              if (disableButton != null) {
                if (!disableButton!) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ActionConfirmationDialogWidget(
                          isLoading: isLoading,
                          title: dialogTitle,
                          content: dialogContent,
                          onPressed: onPressed);
                    },
                  );
                }
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return ActionConfirmationDialogWidget(
                        isLoading: isLoading,
                        title: dialogTitle,
                        content: dialogContent,
                        onPressed: onPressed);
                  },
                );
              }
            },
            child: Text(buttonTitle,
                style: AppTextStyles.headline1.copyWith(
                    fontSize:
                        MediaQuery.of(context).size.width < breakpointTablet
                            ? 12
                            : 24,
                    color: buttonTitleColor))),
      );
    } else {
      return SizedBox(
        width: MediaQuery.of(context).size.width < breakpointTablet ? 105 : 210,
        height: MediaQuery.of(context).size.width < breakpointTablet ? 25 : 50,
        child: Container(
            width: MediaQuery.of(context).size.width < breakpointTablet
                ? 100
                : 200,
            height:
                MediaQuery.of(context).size.width < breakpointTablet ? 25 : 50,
            decoration: BoxDecoration(
              color: AppColors.gray,
              borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width < tabletSize ? 15 : 20),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                S.of(context).unavailabeTitle,
                style: AppTextStyles.headline1.copyWith(
                    fontSize:
                        MediaQuery.of(context).size.width < breakpointTablet
                            ? 12
                            : 24,
                    color: AppColors.white),
              ),
            )),
      );
    }
  }
}
