import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smile_front/app/shared/entities/infra/delivery_enum.dart';
import 'package:smile_front/app/shared/entities/infra/enrollment_state_enum.dart';
import 'package:smile_front/app/shared/models/enrollments_model.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';
import 'package:smile_front/app/shared/themes/breakpoint.dart';
import 'package:smile_front/app/shared/widgets/dialogs/action_confirmation_dialog_widget.dart';
import 'package:smile_front/generated/l10n.dart';

import '../../../../../../../shared/entities/screen_variables.dart';

class ActivitiesCardAllActivitiesDashboard extends StatelessWidget {
  final String title;
  final String hour;
  final String finalTime;
  final DeliveryEnum? deliveryEnum;
  final String? location;
  final Function() onTap;
  final Function()? onPressedSubscribe;
  final Function()? onPressedUnsubscribe;
  final EnrollmentsModel? activityEnrollment;
  final bool isLoading;
  final bool acceptingNewEnrollments;
  final bool isExtensive;
  final int takenSlots;
  final int totalSlots;
  final DateTime date;

  const ActivitiesCardAllActivitiesDashboard(
      {Key? key,
      this.deliveryEnum,
      required this.title,
      required this.hour,
      required this.onTap,
      required this.finalTime,
      required this.location,
      required this.activityEnrollment,
      required this.isLoading,
      required this.acceptingNewEnrollments,
      required this.takenSlots,
      required this.isExtensive,
      required this.totalSlots,
      this.onPressedSubscribe,
      this.onPressedUnsubscribe,
      required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd/MM').format(date);
    return Padding(
      padding: MediaQuery.of(context).size.width < breakpointLMobile
          ? const EdgeInsets.symmetric(horizontal: 8)
          : const EdgeInsets.symmetric(horizontal: 0),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      spreadRadius: 0.5,
                      blurRadius: 3,
                      offset: const Offset(5, 5), // changes position of shadow
                    ),
                  ]),
              width: MediaQuery.of(context).size.width < breakpointLMobile
                  ? MediaQuery.of(context).size.width
                  : MediaQuery.of(context).size.width > breakpointTablet
                      ? 1165
                      : 360,
              height: MediaQuery.of(context).size.width < breakpointTablet
                  ? 76
                  : 204,
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                    width: MediaQuery.of(context).size.width < tabletSize
                        ? 70
                        : 190,
                    height: MediaQuery.of(context).size.width < tabletSize
                        ? 76
                        : 204,
                    decoration: BoxDecoration(
                        color: AppColors.brandingBlue,
                        borderRadius: BorderRadius.circular(15)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(hour,
                          style: AppTextStyles.bold.copyWith(
                              fontSize:
                                  MediaQuery.of(context).size.width < tabletSize
                                      ? 20
                                      : 40)),
                    )),
                Expanded(
                  child: Padding(
                    padding:
                        MediaQuery.of(context).size.width < breakpointTablet
                            ? const EdgeInsets.symmetric(horizontal: 8)
                            : const EdgeInsets.only(left: 32, right: 64),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width <
                                        breakpointTablet
                                    ? 200
                                    : null,
                                child: Text(title,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyles.bold.copyWith(
                                        fontSize:
                                            MediaQuery.of(context).size.width <
                                                    breakpointTablet
                                                ? 14
                                                : 30,
                                        color: AppColors.brandingBlue)),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              if (isExtensive)
                                Tooltip(
                                  triggerMode: TooltipTriggerMode.tap,
                                  message: S.of(context).isExtensiveTooltip,
                                  child: Icon(
                                    Icons.star,
                                    size: 33,
                                    color: AppColors.brandingOrange,
                                  ),
                                ),
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      '${S.of(context).termination}: $finalTime',
                                      style: AppTextStyles.bold.copyWith(
                                          fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width <
                                                  breakpointTablet
                                              ? 12
                                              : 24,
                                          color: Colors.black)),
                                  Row(
                                    children: [
                                      Text(
                                          location == null || location == ''
                                              ? '${S.of(context).local}: Online'
                                              : '${S.of(context).local}: $location',
                                          style: AppTextStyles.bold.copyWith(
                                              fontSize: MediaQuery.of(context)
                                                          .size
                                                          .width <
                                                      breakpointTablet
                                                  ? 12
                                                  : 24,
                                              color: Colors.black)),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width <
                                                    breakpointTablet
                                                ? 16
                                                : 64,
                                      ),
                                      Text(
                                        'Data: $formattedDate',
                                        style: AppTextStyles.bold.copyWith(
                                            fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width <
                                                    breakpointTablet
                                                ? 12
                                                : 24,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                  width: MediaQuery.of(context).size.width <
                                          breakpointTablet
                                      ? 100
                                      : 200,
                                  height: MediaQuery.of(context).size.width <
                                          breakpointTablet
                                      ? 25
                                      : 50,
                                  child: acceptingNewEnrollments == true
                                      ? activityEnrollment != null
                                          ? activityEnrollment!.state !=
                                                  EnrollmentStateEnum.IN_QUEUE
                                              ? ElevatedButton(
                                                  style: ButtonStyle(
                                                    shape: MaterialStateProperty.all<
                                                            RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(
                                                                MediaQuery.of(context)
                                                                            .size
                                                                            .width <
                                                                        tabletSize
                                                                    ? 15
                                                                    : 20),
                                                            side: BorderSide(
                                                                color: AppColors
                                                                    .brandingOrange))),
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(AppColors
                                                                .brandingOrange),
                                                  ),
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return ActionConfirmationDialogWidget(
                                                            isLoading:
                                                                isLoading,
                                                            title: S
                                                                .of(context)
                                                                .unsubscribeVerification,
                                                            content: S
                                                                .of(context)
                                                                .unsubscribeLoseVanacy,
                                                            onPressed:
                                                                onPressedUnsubscribe);
                                                      },
                                                    );
                                                  },
                                                  child: Text(S.of(context).subscribedTitle,
                                                      style: AppTextStyles.bold.copyWith(
                                                          fontSize: MediaQuery.of(context)
                                                                      .size
                                                                      .width <
                                                                  breakpointTablet
                                                              ? 12
                                                              : 24,
                                                          color:
                                                              AppColors.white)))
                                              : ElevatedButton(
                                                  style: ButtonStyle(
                                                    shape: MaterialStateProperty.all<
                                                            RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(
                                                                MediaQuery.of(context)
                                                                            .size
                                                                            .width <
                                                                        breakpointTablet
                                                                    ? 15
                                                                    : 20),
                                                            side: BorderSide(
                                                                color: AppColors
                                                                    .brandingBlue))),
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(AppColors
                                                                .brandingBlue),
                                                  ),
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return ActionConfirmationDialogWidget(
                                                            isLoading:
                                                                isLoading,
                                                            title: S
                                                                .of(context)
                                                                .InQueueContent,
                                                            content: S
                                                                .of(context)
                                                                .exitQueueConfimation,
                                                            onPressed:
                                                                onPressedUnsubscribe);
                                                      },
                                                    );
                                                  },
                                                  child: Text(
                                                    S.of(context).inQueueTitle,
                                                    style: AppTextStyles.bold.copyWith(
                                                        fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width <
                                                                breakpointTablet
                                                            ? 12
                                                            : 24,
                                                        color: AppColors.white),
                                                  ),
                                                )
                                          : takenSlots < totalSlots
                                              ? ElevatedButton(
                                                  style: ButtonStyle(
                                                    shape: MaterialStateProperty.all<
                                                            RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(
                                                                MediaQuery.of(context)
                                                                            .size
                                                                            .width <
                                                                        breakpointTablet
                                                                    ? 15
                                                                    : 20),
                                                            side: BorderSide(
                                                                color: AppColors
                                                                    .brandingOrange))),
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(AppColors
                                                                .white),
                                                  ),
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return ActionConfirmationDialogWidget(
                                                            isLoading:
                                                                isLoading,
                                                            title: S
                                                                .of(context)
                                                                .subscribeVerification,
                                                            content: S
                                                                .of(context)
                                                                .scheduleActivityWarning,
                                                            onPressed:
                                                                onPressedSubscribe);
                                                      },
                                                    );
                                                  },
                                                  child: Text(
                                                    S.of(context).signUp,
                                                    style: AppTextStyles.bold.copyWith(
                                                        fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width <
                                                                breakpointTablet
                                                            ? 12
                                                            : 24,
                                                        color: AppColors
                                                            .brandingOrange),
                                                  ),
                                                )
                                              : ElevatedButton(
                                                  style: ButtonStyle(
                                                    shape: MaterialStateProperty.all<
                                                            RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(
                                                                MediaQuery.of(context)
                                                                            .size
                                                                            .width <
                                                                        breakpointTablet
                                                                    ? 15
                                                                    : 20),
                                                            side: BorderSide(
                                                                color: AppColors
                                                                    .brandingBlue))),
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(AppColors
                                                                .white),
                                                  ),
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return ActionConfirmationDialogWidget(
                                                            isLoading:
                                                                isLoading,
                                                            title: S
                                                                .of(context)
                                                                .availabeSpotUnsuficient,
                                                            content: S
                                                                .of(context)
                                                                .joinQueueConfimation,
                                                            onPressed:
                                                                onPressedSubscribe);
                                                      },
                                                    );
                                                  },
                                                  child: Text(
                                                    S
                                                        .of(context)
                                                        .joinQueueTitle,
                                                    style: AppTextStyles.bold.copyWith(
                                                        fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width <
                                                                breakpointTablet
                                                            ? 12
                                                            : 24,
                                                        color: AppColors
                                                            .brandingBlue),
                                                  ),
                                                )
                                      : Container(
                                          width: MediaQuery.of(context).size.width <
                                                  breakpointTablet
                                              ? 100
                                              : 200,
                                          height: MediaQuery.of(context).size.width < breakpointTablet ? 25 : 50,
                                          decoration: BoxDecoration(
                                            color: AppColors.gray,
                                            borderRadius: BorderRadius.circular(
                                                MediaQuery.of(context)
                                                            .size
                                                            .width <
                                                        tabletSize
                                                    ? 15
                                                    : 20),
                                          ),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              S.of(context).unavailabeTitle,
                                              style: AppTextStyles.bold
                                                  .copyWith(
                                                      fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width <
                                                              breakpointTablet
                                                          ? 12
                                                          : 24,
                                                      color: AppColors.white),
                                            ),
                                          ))),
                            ])
                      ],
                    ),
                  ),
                )
              ]),
            ),
            const SizedBox(
              height: 25,
            )
          ],
        ),
      ),
    );
  }
}
