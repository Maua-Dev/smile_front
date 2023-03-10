import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/more_info_controller.dart';
import 'package:smile_front/app/modules/dashboard/ui/user/widgets/mobile_widgets/extensionist_widget.dart';
import 'package:smile_front/app/shared/entities/infra/enrollment_state_enum.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../shared/themes/app_text_styles.dart';
import '../../../../shared/utils/utils.dart';
import '../../../../shared/widgets/dialogs/action_confirmation_dialog_widget.dart';
import '../../../../shared/widgets/dialogs/custom_alert_dialog_widget.dart';
import 'widgets/attendance_confirmation/attendance_confirmation_widget.dart';
import 'widgets/register_button_widget.dart';

class MoreInfoPage extends StatefulWidget {
  const MoreInfoPage({Key? key}) : super(key: key);

  @override
  State<MoreInfoPage> createState() => _MoreInfoPageState();
}

class _MoreInfoPageState
    extends ModularState<MoreInfoPage, MoreInfoController> {
  @override
  Widget build(BuildContext context) {
    var timeString = controller.activity.startDate == null
        ? ''
        : DateFormat('HH:mm').format(controller.activity.startDate!);
    var finalTime = controller.activity.startDate == null
        ? ''
        : Utils.getActivityFinalTime(
            controller.activity.startDate!, controller.activity.duration);
    return SafeArea(
        child: ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(children: [
            Text(
              '${controller.activity.activityCode} - ${controller.activity.title}',
              style: TextStyle(
                  color: AppColors.brandingOrange,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 78,
                    height: 49,
                    decoration: BoxDecoration(
                        color: AppColors.brandingBlue,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(S.of(context).dayTitle,
                              style: AppTextStyles.bold.copyWith(
                                  color: AppColors.white, fontSize: 12)),
                          Text(
                              DateFormat('dd/MM')
                                  .format(controller.activity.startDate!),
                              style: AppTextStyles.bold.copyWith(
                                  color: AppColors.white, fontSize: 20))
                        ]),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 138,
                    height: 49,
                    decoration: BoxDecoration(
                        color: AppColors.brandingBlue,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(S.of(context).scheduleTitle,
                              style: AppTextStyles.bold.copyWith(
                                  color: AppColors.white, fontSize: 12)),
                          Text('$timeString - $finalTime',
                              style: AppTextStyles.bold.copyWith(
                                  color: AppColors.white, fontSize: 20))
                        ]),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 78,
                    height: 49,
                    decoration: BoxDecoration(
                        color: AppColors.brandingBlue,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(S.of(context).localTitle,
                              style: AppTextStyles.bold.copyWith(
                                  color: AppColors.white, fontSize: 12)),
                          controller.activity.place != null
                              ? Text(controller.activity.place!,
                                  style: AppTextStyles.bold.copyWith(
                                      color: AppColors.white, fontSize: 20))
                              : controller.activity.link != null
                                  ? TextButton(
                                      onPressed: () {
                                        launchUrl(Uri.parse(
                                            controller.activity.link!));
                                      },
                                      child: Text(
                                        'Online',
                                        style: AppTextStyles.bold.copyWith(
                                          color: AppColors.white,
                                          fontSize: 20,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ))
                                  : const SizedBox.shrink()
                        ]),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 50,
                ),
                Observer(builder: (_) {
                  return !controller.activity.acceptingNewEnrollments
                      ? Text(
                          S.of(context).unavailabeActivityRegistration,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.titleH1.copyWith(
                              color: AppColors.brandingBlue,
                              fontSize: MediaQuery.of(context).size.width < 800
                                  ? 22
                                  : 26),
                        )
                      : Center(
                          child: RegisterButtonWidget(
                              activityIsFull: controller.activity.takenSlots >=
                                  controller.activity.totalSlots,
                              isLoading: controller.isLoading,
                              isRegistered:
                                  // controller.activity.enrollments == null
                                  EnrollmentStateEnum.NONE,
                              // : controller.activity.enrollments!.state,
                              onPressed: () {
                                var isReg = controller.activity.enrollments ==
                                        null
                                    ? EnrollmentStateEnum.NONE
                                    : controller.activity.enrollments!.state;

                                if (!controller
                                    .activity.acceptingNewEnrollments) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Observer(builder: (context) {
                                        return ActionConfirmationDialogWidget(
                                            isLoading: controller.isLoading,
                                            title: S
                                                .of(context)
                                                .unsubscribeVerification,
                                            content: S
                                                .of(context)
                                                .unsubscribeVerificationClosedRegistration,
                                            onPressed: () {
                                              controller
                                                  .unsubscribeUserActivity();
                                              Modular.to.navigate(
                                                '/user/home/more-info',
                                              );
                                              Modular.to.pop();
                                            });
                                      });
                                    },
                                  );
                                } else {
                                  if (isReg == EnrollmentStateEnum.ENROLLED ||
                                      isReg == EnrollmentStateEnum.COMPLETED) {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Observer(builder: (context) {
                                          return ActionConfirmationDialogWidget(
                                              isLoading: controller.isLoading,
                                              title: S
                                                  .of(context)
                                                  .unsubscribeVerification,
                                              content: S
                                                  .of(context)
                                                  .unsubscribeLoseVanacy,
                                              onPressed: () {
                                                controller
                                                    .unsubscribeUserActivity();

                                                Modular.to.pop();
                                              });
                                        });
                                      },
                                    );
                                  } else if (controller.activity.takenSlots >=
                                          controller.activity.totalSlots &&
                                      controller.activity.enrollments != null) {
                                    if (controller
                                            .activity.enrollments!.state ==
                                        EnrollmentStateEnum.IN_QUEUE) {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return ActionConfirmationDialogWidget(
                                              isLoading: controller.isLoading,
                                              title:
                                                  S.of(context).InQueueContent,
                                              content: S
                                                  .of(context)
                                                  .exitQueueConfimation,
                                              onPressed: () {
                                                controller
                                                    .unsubscribeUserActivity();
                                                Modular.to.pop();
                                              });
                                        },
                                      );
                                    }
                                  } else if (controller.activity.takenSlots >=
                                      controller.activity.totalSlots) {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return ActionConfirmationDialogWidget(
                                            isLoading: controller.isLoading,
                                            title: S.of(context).joinQueueTitle,
                                            content: S
                                                .of(context)
                                                .joinQueueConfimation,
                                            onPressed: () {
                                              controller
                                                  .subscribeUserActivity();
                                              Modular.to.pop();
                                            });
                                      },
                                    );
                                  } else if (isReg !=
                                      EnrollmentStateEnum.ENROLLED) {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Observer(builder: (context) {
                                          return ActionConfirmationDialogWidget(
                                              isLoading: controller.isLoading,
                                              title: S
                                                  .of(context)
                                                  .subscribeVerification,
                                              content: S
                                                  .of(context)
                                                  .scheduleActivityWarning,
                                              onPressed: () {
                                                if (controller
                                                    .checkIsOkForSubscribe()) {
                                                  controller
                                                      .subscribeUserActivity();
                                                  Modular.to.pop();
                                                } else {
                                                  showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return CustomAlertDialogWidget(
                                                        title: S
                                                            .of(context)
                                                            .alreadySubscribedOnThisPeriodWarning,
                                                      );
                                                    },
                                                  );
                                                }
                                              });
                                        });
                                      },
                                    );
                                  }
                                }
                              }));
                }),
                ExtensionistWidget(
                    isExtensionist: controller.activity.isExtensive)
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  S.of(context).descriptionTitle,
                  style: AppTextStyles.bold
                      .copyWith(color: AppColors.brandingBlue),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                controller.activity.description,
                style: AppTextStyles.body
                    .copyWith(color: Colors.black, fontSize: 16),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  S.of(context).speakersTitle,
                  style: AppTextStyles.bold
                      .copyWith(color: AppColors.brandingBlue),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.activity.speakers.length,
              itemBuilder: (context, index) => Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                            color: AppColors.brandingBlue,
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (controller.activity.speakers[index].name !=
                                    null &&
                                controller.activity.speakers[index].name != '')
                              Text(
                                controller.activity.speakers[index].name!,
                                textAlign: TextAlign.justify,
                                style: AppTextStyles.bold.copyWith(
                                    fontSize: 24, color: Colors.black),
                              ),
                            if (controller.activity.speakers[index].company !=
                                    null &&
                                controller.activity.speakers[index].company !=
                                    '')
                              Text(
                                  "${S.of(context).companyTitle} ${controller.activity.speakers[index].company}",
                                  textAlign: TextAlign.justify,
                                  style: AppTextStyles.bold.copyWith(
                                      fontSize: 16,
                                      color: AppColors.brandingBlue)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  if (controller.activity.speakers[index].bio != null &&
                      controller.activity.speakers[index].bio != '')
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(controller.activity.speakers[index].bio!,
                          textAlign: TextAlign.justify,
                          style: AppTextStyles.body
                              .copyWith(fontSize: 16, color: Colors.black)),
                    ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Observer(builder: (context) {
              return AttendanceConfirmationWidget(
                enrollmentState: controller.enrollmentState,
                checkCanViewConfirmAttendance:
                    controller.canViewConfirmAttendance,
                isLoading: controller.isLoadingConfirmAttendance,
                onConfirmCode: controller.onConfirmCode,
              );
            }),
          ]),
        ),
      ),
    ));
  }
}
