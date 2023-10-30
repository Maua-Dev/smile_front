import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smile_front/app/modules/dashboard/ui/user/widgets/status_button/status_button.dart';
import 'package:smile_front/app/shared/domain/enum/delivery_enum.dart';
import 'package:smile_front/app/shared/domain/enum/enrollment_state_enum.dart';
import 'package:smile_front/app/shared/infra/models/enrollments_model.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';
import 'package:smile_front/app/shared/themes/breakpoint.dart';
import 'package:smile_front/generated/l10n.dart';

class ActivitiesCardAllActivitiesDashboard extends StatelessWidget {
  final String title;
  final String hour;
  final String finalTime;
  final DeliveryEnum? deliveryEnum;
  final String? location;
  final Function() onTap;
  final Function()? onPressedSubscribe;
  final Function()? onPressedUnsubscribe;
  final EnrollmentsModel activityEnrollment;
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
    String formattedLocation = deliveryEnum == DeliveryEnum.hybrid
        ? '${S.of(context).local}: $location ou Online'
        : location == null || location == ''
            ? '${S.of(context).local}: Online'
            : '${S.of(context).local}: $location';
    return Padding(
      padding: MediaQuery.of(context).size.width < breakpointLMobile
          ? const EdgeInsets.symmetric(horizontal: 8)
          : const EdgeInsets.symmetric(horizontal: 0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
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
                        offset:
                            const Offset(5, 5), // changes position of shadow
                      ),
                    ]),
                width: MediaQuery.of(context).size.width < breakpointTablet
                    ? MediaQuery.of(context).size.width
                    : 1165,
                height: MediaQuery.of(context).size.width < breakpointTablet
                    ? 76
                    : 204,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Container(
                      width:
                          MediaQuery.of(context).size.width < breakpointMobile
                              ? 70
                              : 190,
                      decoration: BoxDecoration(
                          color: AppColors.brandingBlue,
                          borderRadius: BorderRadius.circular(15)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(hour,
                            style: AppTextStyles.headline1.copyWith(
                                fontSize: MediaQuery.of(context).size.width <
                                        breakpointMobile
                                    ? 14
                                    : MediaQuery.of(context).size.width <
                                            breakpointTablet
                                        ? 20
                                        : 30)),
                      )),
                  Expanded(
                    child: Padding(
                      padding: MediaQuery.of(context).size.width <
                              breakpointMobile
                          ? const EdgeInsets.symmetric(horizontal: 8)
                          : MediaQuery.of(context).size.width < breakpointTablet
                              ? const EdgeInsets.symmetric(horizontal: 16)
                              : const EdgeInsets.symmetric(horizontal: 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width <
                                          breakpointMobile
                                      ? MediaQuery.of(context).size.width / 2
                                      : MediaQuery.of(context).size.width <
                                              breakpointTablet
                                          ? MediaQuery.of(context).size.width /
                                              2.3
                                          : 650,
                                  child: Text(title,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTextStyles.headline1.copyWith(
                                          fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width <
                                                  breakpointMobile
                                              ? 14
                                              : MediaQuery.of(context)
                                                          .size
                                                          .width <
                                                      breakpointTablet
                                                  ? 18
                                                  : 30,
                                          color: AppColors.brandingBlue)),
                                ),
                                if (isExtensive) ...[
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Tooltip(
                                    triggerMode: TooltipTriggerMode.tap,
                                    message: S.of(context).isExtensiveTooltip,
                                    child: Icon(
                                      Icons.star,
                                      size: 33,
                                      color: AppColors.brandingOrange,
                                    ),
                                  ),
                                ]
                              ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      S
                                          .of(context)
                                          .dateWithPlaceholder(formattedDate),
                                      style: AppTextStyles.headline1.copyWith(
                                          fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width <
                                                  breakpointMobile
                                              ? 12
                                              : MediaQuery.of(context)
                                                          .size
                                                          .width <
                                                      breakpointTablet
                                                  ? 16
                                                  : 24,
                                          color: Colors.black),
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.31,
                                          child: Text(
                                            formattedLocation,
                                            style: AppTextStyles.headline1
                                                .copyWith(
                                                    fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width <
                                                            breakpointMobile
                                                        ? 10
                                                        : MediaQuery.of(context)
                                                                    .size
                                                                    .width <
                                                                breakpointTablet
                                                            ? 16
                                                            : 24,
                                                    color: Colors.black,
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                            maxLines: 2,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                      .size
                                                      .width <
                                                  breakpointTablet
                                              ? 16
                                              : 64,
                                        ),
                                        MediaQuery.of(context).size.width <
                                                    breakpointLMobile ||
                                                formattedLocation.length > 5
                                            ? const SizedBox.shrink()
                                            : Text(
                                                '${S.of(context).termination}: $finalTime',
                                                style: AppTextStyles.headline1
                                                    .copyWith(
                                                        fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width <
                                                                breakpointMobile
                                                            ? 12
                                                            : MediaQuery.of(context)
                                                                        .size
                                                                        .width <
                                                                    breakpointTablet
                                                                ? 16
                                                                : 24,
                                                        color: Colors.black)),
                                      ],
                                    ),
                                  ],
                                ),
                                if (activityEnrollment.state ==
                                    EnrollmentStateEnum.ENROLLED)
                                  StatusButtonWidget(
                                    onPressed: onPressedUnsubscribe,
                                    isLoading: isLoading,
                                    acceptingNewEnrollments:
                                        acceptingNewEnrollments,
                                    enrollmentStateEnum:
                                        activityEnrollment.state,
                                    buttonColor: AppColors.brandingOrange,
                                    buttonTitleColor: AppColors.white,
                                    buttonBorderColor: AppColors.brandingOrange,
                                    dialogTitle:
                                        S.of(context).unsubscribeVerification,
                                    dialogContent:
                                        S.of(context).unsubscribeLoseVanacy,
                                    buttonTitle: S.of(context).subscribedTitle,
                                  )
                                else if (activityEnrollment.state ==
                                    EnrollmentStateEnum.IN_QUEUE)
                                  // Botão aparecendo: Na fila
                                  StatusButtonWidget(
                                    onPressed: onPressedUnsubscribe,
                                    isLoading: isLoading,
                                    acceptingNewEnrollments:
                                        acceptingNewEnrollments,
                                    enrollmentStateEnum:
                                        activityEnrollment.state,
                                    buttonColor: AppColors.brandingBlue,
                                    buttonTitleColor: AppColors.white,
                                    buttonBorderColor: AppColors.brandingBlue,
                                    dialogContent:
                                        S.of(context).exitQueueConfimation,
                                    dialogTitle: S.of(context).InQueueContent,
                                    buttonTitle: S.of(context).inQueueTitle,
                                  )
                                else if (activityEnrollment.state ==
                                    EnrollmentStateEnum.COMPLETED)
                                  // Completa
                                  StatusButtonWidget(
                                    onPressed: onPressedUnsubscribe,
                                    isLoading: isLoading,
                                    acceptingNewEnrollments:
                                        acceptingNewEnrollments,
                                    enrollmentStateEnum:
                                        activityEnrollment.state,
                                    buttonColor: AppColors.greenButton,
                                    buttonTitleColor: AppColors.white,
                                    buttonBorderColor: AppColors.greenButton,
                                    dialogContent: S.of(context).completed,
                                    dialogTitle: S.of(context).completed,
                                    buttonTitle: S.of(context).completed,
                                    disableButton: true,
                                  )
                                else if (takenSlots < totalSlots)
                                  // Inscrever-se
                                  StatusButtonWidget(
                                    onPressed: onPressedSubscribe,
                                    isLoading: isLoading,
                                    acceptingNewEnrollments:
                                        acceptingNewEnrollments,
                                    enrollmentStateEnum:
                                        activityEnrollment.state,
                                    buttonColor: AppColors.white,
                                    buttonTitleColor: AppColors.brandingOrange,
                                    buttonBorderColor: AppColors.brandingOrange,
                                    dialogContent:
                                        S.of(context).scheduleActivityWarning,
                                    dialogTitle:
                                        S.of(context).subscribeVerification,
                                    buttonTitle: S.of(context).signUp,
                                  )
                                else if (takenSlots <= totalSlots)
                                  // Entrar na fila
                                  StatusButtonWidget(
                                    onPressed: onPressedSubscribe,
                                    isLoading: isLoading,
                                    acceptingNewEnrollments:
                                        acceptingNewEnrollments,
                                    enrollmentStateEnum:
                                        activityEnrollment.state,
                                    buttonColor: AppColors.white,
                                    buttonTitleColor: AppColors.brandingBlue,
                                    buttonBorderColor: AppColors.brandingBlue,
                                    dialogContent:
                                        S.of(context).scheduleActivityWarning,
                                    dialogTitle:
                                        S.of(context).subscribeVerification,
                                    buttonTitle: S.of(context).joinQueueTitle,
                                  ),
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
      ),
    );
  }
}
