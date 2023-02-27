import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;
import 'package:smile_front/app/modules/dashboard/presenter/controllers/user/more_info_controller.dart';
import 'package:smile_front/app/modules/dashboard/ui/user/widgets/mobile_widgets/extensionist_widget.dart';
import 'package:smile_front/app/shared/entities/infra/enrollment_state_enum.dart';
import 'package:smile_front/app/shared/entities/screen_variables.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../shared/themes/app_text_styles.dart';
import '../../../../shared/utils/utils.dart';
import '../../../../shared/widgets/dialogs/action_confirmation_dialog_widget.dart';
import '../../../../shared/widgets/dialogs/custom_alert_dialog_widget.dart';
import '../../domain/infra/activity_enum.dart';
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
    var weekday = controller.activity.startDate == null
        ? ''
        : DateFormat('EEEE')
            .format(controller.activity.startDate!)
            .split('-')
            .first
            .capitalize();
    var finalTime = controller.activity.startDate == null
        ? ''
        : Utils.getActivityFinalTime(
            controller.activity.startDate!, controller.activity.duration);
    return MediaQuery.of(context).size.width < tabletSize
        ? SafeArea(
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            Text(controller.activity.place!,
                                style: AppTextStyles.bold.copyWith(
                                    color: AppColors.white, fontSize: 20))
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
                                fontSize: MediaQuery.of(context).size.width <
                                        800
                                    ? 22
                                    : MediaQuery.of(context).size.width < 1000
                                        ? 26
                                        : 30),
                          )
                        : Center(
                            child: SizedBox(
                            width: 163,
                            height: 32,
                            child: RegisterButtonWidget(
                                isLoading: controller.isLoading,
                                isRegistered:
                                    controller.activity.enrollments!.state,
                                onPressed: () {
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
                                                Modular.to.pop();
                                              });
                                        });
                                      },
                                    );
                                  } else {
                                    if (controller
                                            .activity.enrollments!.state ==
                                        EnrollmentStateEnum.ENROLLED) {
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
                                        controller.activity.totalSlots) {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return CustomAlertDialogWidget(
                                            title: S
                                                .of(context)
                                                .availabeSpotUnsuficient,
                                          );
                                        },
                                      );
                                    } else {
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
                                                      builder: (BuildContext
                                                          context) {
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
                                }),
                          ));
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
                                  controller.activity.speakers[index].name !=
                                      '')
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
                                        fontSize: 13,
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
                            style: AppTextStyles.body.copyWith(
                                fontSize: MediaQuery.of(context).size.width <
                                        800
                                    ? 16
                                    : MediaQuery.of(context).size.width < 1000
                                        ? 18
                                        : 22,
                                color: Colors.black)),
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
              Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  width: 150,
                  height: 33,
                  child: ElevatedButton(
                      onPressed: (() {}),
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(
                                        color: AppColors.brandingOrange))),
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.white),
                      ),
                      child: Text(S.of(context).presenceValidateTitle,
                          style: AppTextStyles.bold.copyWith(
                              fontSize: 15, color: AppColors.brandingOrange))),
                ),
              )
            ]),
          ))
        : SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.05,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: AppColors.lilac),
                      child: Center(
                        child: Text(
                          controller.activity.type!.name,
                          textAlign: TextAlign.justify,
                          style: AppTextStyles.buttonBold.copyWith(
                            fontSize: MediaQuery.of(context).size.width < 800
                                ? 18
                                : MediaQuery.of(context).size.width < 1000
                                    ? 22
                                    : 28,
                            color: AppColors.brandingBlue,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '${controller.activity.activityCode} - ${controller.activity.title}',
                        textAlign: TextAlign.justify,
                        style: AppTextStyles.buttonBold.copyWith(
                            fontSize: MediaQuery.of(context).size.width < 800
                                ? 20
                                : MediaQuery.of(context).size.width < 1000
                                    ? 24
                                    : 28,
                            color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Observer(builder: (_) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                controller.activity.startDate == null
                                    ? ''
                                    : DateFormat('dd/MM')
                                        .format(controller.activity.startDate!),
                                style: AppTextStyles.buttonBold.copyWith(
                                    fontSize:
                                        MediaQuery.of(context).size.width < 800
                                            ? 10
                                            : MediaQuery.of(context)
                                                        .size
                                                        .width <
                                                    1000
                                                ? 14
                                                : 18,
                                    color: AppColors.brandingBlue),
                              ),
                              Text(
                                weekday,
                                style: AppTextStyles.buttonBold.copyWith(
                                    fontSize:
                                        MediaQuery.of(context).size.width < 800
                                            ? 14
                                            : MediaQuery.of(context)
                                                        .size
                                                        .width <
                                                    1000
                                                ? 20
                                                : 24,
                                    color: AppColors.brandingBlue),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                S.of(context).scheduleTitle,
                                style: AppTextStyles.buttonBold.copyWith(
                                    fontSize:
                                        MediaQuery.of(context).size.width < 800
                                            ? 10
                                            : MediaQuery.of(context)
                                                        .size
                                                        .width <
                                                    1000
                                                ? 14
                                                : 18,
                                    color: AppColors.brandingBlue),
                              ),
                              Text(
                                '$timeString - $finalTime',
                                style: AppTextStyles.buttonBold.copyWith(
                                    fontSize:
                                        MediaQuery.of(context).size.width < 800
                                            ? 14
                                            : MediaQuery.of(context)
                                                        .size
                                                        .width <
                                                    1000
                                                ? 20
                                                : 24,
                                    color: AppColors.brandingBlue),
                              ),
                            ],
                          ),
                          if (controller.activity.place != null)
                            Column(
                              children: [
                                Text(
                                  S.of(context).localTitle,
                                  style: AppTextStyles.buttonBold.copyWith(
                                      fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width <
                                              800
                                          ? 10
                                          : MediaQuery.of(context).size.width <
                                                  1000
                                              ? 14
                                              : 18,
                                      color: AppColors.brandingBlue),
                                ),
                                Text(
                                  controller.activity.place!,
                                  style: AppTextStyles.buttonBold.copyWith(
                                      fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width <
                                              800
                                          ? 14
                                          : MediaQuery.of(context).size.width <
                                                  1000
                                              ? 20
                                              : 24,
                                      color: AppColors.brandingBlue),
                                ),
                              ],
                            ),
                          if (controller.activity.link != null &&
                              controller.activity.enrollments!.state ==
                                  EnrollmentStateEnum.ENROLLED)
                            Column(
                              children: [
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 4),
                                        child: Transform.rotate(
                                          angle: 135 * math.pi / 180,
                                          child: Icon(
                                            Icons.link,
                                            color: AppColors.brandingBlue,
                                            size: MediaQuery.of(context)
                                                        .size
                                                        .width <
                                                    800
                                                ? 14
                                                : MediaQuery.of(context)
                                                            .size
                                                            .width <
                                                        1000
                                                    ? 20
                                                    : 24,
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () => launchUrl(
                                          Uri.parse(controller.activity.link!),
                                          mode: LaunchMode.externalApplication,
                                        ),
                                        child: Text('Link',
                                            style: AppTextStyles.buttonBold
                                                .copyWith(
                                                    decoration: TextDecoration
                                                        .underline,
                                                    fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width <
                                                            800
                                                        ? 14
                                                        : MediaQuery.of(context)
                                                                    .size
                                                                    .width <
                                                                1000
                                                            ? 20
                                                            : 24,
                                                    color: AppColors
                                                        .brandingBlue)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                        ],
                      );
                    }),
                    const SizedBox(
                      height: 16,
                    ),
                    Observer(builder: (_) {
                      return !controller.activity.acceptingNewEnrollments &&
                              !(controller.activity.enrollments!.state ==
                                  EnrollmentStateEnum.ENROLLED)
                          ? Text(
                              S.of(context).unavailabeSubscribe,
                              textAlign: TextAlign.center,
                              style: AppTextStyles.titleH1.copyWith(
                                  color: AppColors.brandingBlue,
                                  fontSize: MediaQuery.of(context).size.width <
                                          800
                                      ? 22
                                      : MediaQuery.of(context).size.width < 1000
                                          ? 26
                                          : 30),
                            )
                          : Center(
                              child: RegisterButtonWidget(
                                  isRegistered:
                                      controller.activity.enrollments!.state,
                                  isLoading: controller.isLoading,
                                  onPressed: () {
                                    if (!controller
                                            .activity.acceptingNewEnrollments &&
                                        (controller
                                                .activity.enrollments!.state ==
                                            EnrollmentStateEnum.ENROLLED)) {
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
                                                  Modular.to.pop();
                                                });
                                          });
                                        },
                                      );
                                    } else {
                                      if (controller
                                              .activity.enrollments!.state ==
                                          EnrollmentStateEnum.ENROLLED) {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Observer(builder: (context) {
                                              return ActionConfirmationDialogWidget(
                                                  isLoading:
                                                      controller.isLoading,
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
                                      } else if (controller
                                              .activity.takenSlots >=
                                          controller.activity.totalSlots) {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return CustomAlertDialogWidget(
                                              title: S
                                                  .of(context)
                                                  .availabeSpotUnsuficient,
                                            );
                                          },
                                        );
                                      } else {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Observer(builder: (context) {
                                              return ActionConfirmationDialogWidget(
                                                  isLoading:
                                                      controller.isLoading,
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
                                                        builder: (BuildContext
                                                            context) {
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
                    const SizedBox(
                      height: 16,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Descrição',
                          style: AppTextStyles.buttonBold.copyWith(
                              fontSize: MediaQuery.of(context).size.width < 800
                                  ? 20
                                  : MediaQuery.of(context).size.width < 1000
                                      ? 24
                                      : 28,
                              color: AppColors.brandingBlue)),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(controller.activity.description,
                          textAlign: TextAlign.justify,
                          style: AppTextStyles.body.copyWith(
                              fontSize: MediaQuery.of(context).size.width < 800
                                  ? 16
                                  : MediaQuery.of(context).size.width < 1000
                                      ? 18
                                      : 22,
                              color: Colors.black)),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.activity.speakers.length,
                      itemBuilder: (context, index) => Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (controller
                                      .activity.speakers[index].linkPhoto !=
                                  null)
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  height:
                                      MediaQuery.of(context).size.width * 0.1,
                                  child: CircleAvatar(
                                    radius: 102.0,
                                    backgroundImage: CachedNetworkImageProvider(
                                        controller.activity.speakers[index]
                                            .linkPhoto!), // for Network image
                                  ),
                                ),
                              Flexible(
                                child: Column(
                                  children: [
                                    if (controller.activity.speakers[index]
                                                .name !=
                                            null &&
                                        controller.activity.speakers[index]
                                                .name !=
                                            '')
                                      Text(
                                        controller
                                            .activity.speakers[index].name!,
                                        textAlign: TextAlign.justify,
                                        style: AppTextStyles.buttonBold
                                            .copyWith(
                                                fontSize: MediaQuery.of(context)
                                                            .size
                                                            .width <
                                                        800
                                                    ? 18
                                                    : MediaQuery.of(context)
                                                                .size
                                                                .width <
                                                            1000
                                                        ? 22
                                                        : 28,
                                                color: Colors.black),
                                      ),
                                    if (controller.activity.speakers[index]
                                                .company !=
                                            null &&
                                        controller.activity.speakers[index]
                                                .company !=
                                            '')
                                      Text(
                                        'Empresa: ${controller.activity.speakers[index].company}',
                                        textAlign: TextAlign.justify,
                                        style: AppTextStyles.buttonBold
                                            .copyWith(
                                                fontSize: MediaQuery.of(context)
                                                            .size
                                                            .width <
                                                        800
                                                    ? 12
                                                    : MediaQuery.of(context)
                                                                .size
                                                                .width <
                                                            1000
                                                        ? 14
                                                        : 20,
                                                color: AppColors.brandingBlue),
                                      ),
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
                              child: Text(
                                  controller.activity.speakers[index].bio!,
                                  textAlign: TextAlign.justify,
                                  style: AppTextStyles.body.copyWith(
                                      fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width <
                                              800
                                          ? 16
                                          : MediaQuery.of(context).size.width <
                                                  1000
                                              ? 18
                                              : 22,
                                      color: Colors.black)),
                            ),
                          const SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
