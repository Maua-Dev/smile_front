import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';
import 'package:smile_front/app/shared/themes/breakpoint.dart';
import 'package:smile_front/app/shared/widgets/dialogs/action_confirmation_dialog_widget.dart';
import 'package:smile_front/app/shared/widgets/dialogs/custom_alert_dialog_widget.dart';
import 'package:smile_front/generated/l10n.dart';

class MobileActivitiesCardAllActivitiesDashboard extends StatelessWidget {
  final String title;
  final String hour;
  final String finalTime;
  final String? location;
  final Function() onTap;
  final Function()? onPressedSubscribe;
  final Function()? onPressedUnsubscribe;
  final bool isUserSubscribed;
  final bool isLoading;
  final bool isUserInQueue;
  final bool acceptingNewEnrollments;
  final bool isExtensive;
  final int takenSlots;
  final int totalSlots;

  const MobileActivitiesCardAllActivitiesDashboard(
      {Key? key,
      required this.title,
      required this.hour,
      required this.onTap,
      required this.finalTime,
      required this.location,
      required this.isUserSubscribed,
      required this.isLoading,
      required this.acceptingNewEnrollments,
      required this.takenSlots,
      required this.isUserInQueue,
      required this.isExtensive,
      required this.totalSlots,
      this.onPressedSubscribe,
      this.onPressedUnsubscribe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
            width: MediaQuery.of(context).size.width < breakpointTablet
                ? 342
                : 1165,
            height:
                MediaQuery.of(context).size.width < breakpointTablet ? 76 : 204,
            child: Row(children: [
              Container(
                  width: MediaQuery.of(context).size.width < breakpointTablet
                      ? 70
                      : 190,
                  height: MediaQuery.of(context).size.width < breakpointTablet
                      ? 76
                      : 204,
                  decoration: BoxDecoration(
                      color: AppColors.brandingBlue,
                      borderRadius: BorderRadius.circular(15)),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(hour,
                        style: AppTextStyles.bold.copyWith(
                            fontSize: MediaQuery.of(context).size.width <
                                    breakpointTablet
                                ? 20
                                : 40)),
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 2),
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
                                ? 215
                                : 500,
                            height: MediaQuery.of(context).size.width <
                                    breakpointTablet
                                ? 34
                                : 50,
                            child: Text(title,
                                maxLines: 2,
                                style: AppTextStyles.bold.copyWith(
                                    fontSize:
                                        MediaQuery.of(context).size.width <
                                                breakpointTablet
                                            ? 16
                                            : 30,
                                    color: AppColors.brandingBlue)),
                          ),
                          if (MediaQuery.of(context).size.width >
                              breakpointTablet)
                            const SizedBox(width: 200),
                          if (isExtensive)
                            Icon(
                              Icons.star,
                              color: AppColors.brandingOrange,
                              size: MediaQuery.of(context).size.width <
                                      breakpointTablet
                                  ? 20
                                  : 40,
                            ),
                            if(isUserInQueue)
                              const Text('fila funcionando')
                        ]),
                    Row(children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${S.of(context).termination}: $finalTime',
                              style: AppTextStyles.bold.copyWith(
                                  fontSize: MediaQuery.of(context).size.width <
                                          breakpointTablet
                                      ? 12
                                      : 24,
                                  color: Colors.black)),
                          Text('${S.of(context).local}: $location',
                              style: AppTextStyles.bold.copyWith(
                                  fontSize: MediaQuery.of(context).size.width <
                                          breakpointTablet
                                      ? 12
                                      : 24,
                                  color: Colors.black)),
                        ],
                      ),
                      SizedBox(
                        width:
                            MediaQuery.of(context).size.width < breakpointTablet
                                ? 53
                                : 368,
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width < breakpointTablet
                              ? 100
                              : 200,
                          height: MediaQuery.of(context).size.width < breakpointTablet
                              ? 25
                              : 50,
                          child: isUserSubscribed
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
                                                color:
                                                    AppColors.brandingOrange))),
                                    backgroundColor: MaterialStateProperty.all(
                                        AppColors.brandingOrange),
                                  ),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Observer(builder: (context) {
                                          return ActionConfirmationDialogWidget(
                                              isLoading: isLoading,
                                              title: S
                                                  .of(context)
                                                  .unsubscribeAlert,
                                              content: acceptingNewEnrollments
                                                  ? S
                                                      .of(context)
                                                      .unsubscribeAcceptingNewEnrollments
                                                  : S
                                                      .of(context)
                                                      .unsubscribeNotAcceptingNewEnrollments,
                                              onPressed: onPressedUnsubscribe);
                                        });
                                      },
                                    );
                                  },
                                  child: Text(S.of(context).subscribedTitle,
                                      style: AppTextStyles.bold.copyWith(
                                          fontSize:
                                              MediaQuery.of(context).size.width <
                                                      breakpointTablet
                                                  ? 12
                                                  : 24,
                                          color: AppColors.white)))
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
                                                color:
                                                    AppColors.brandingOrange))),
                                    backgroundColor: MaterialStateProperty.all(
                                        AppColors.white),
                                  ),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Observer(builder: (context) {
                                          return takenSlots < totalSlots
                                              ? ActionConfirmationDialogWidget(
                                                  isLoading: isLoading,
                                                  title: S
                                                      .of(context)
                                                      .subscribeAlert,
                                                  content: S
                                                      .of(context)
                                                      .subscribeScheduleAtention,
                                                  onPressed: onPressedSubscribe)
                                              : CustomAlertDialogWidget(
                                                  title: S
                                                      .of(context)
                                                      .subscribeSlotsSoldOut,
                                                );
                                        });
                                      },
                                    );
                                  },
                                  child: Text(S.of(context).subcribeTitle,
                                      style: AppTextStyles.bold.copyWith(
                                          fontSize:
                                              MediaQuery.of(context).size.width <
                                                      breakpointTablet
                                                  ? 12
                                                  : 24,
                                          color: AppColors.brandingOrange))))
                    ])
                  ],
                ),
              )
            ]),
          ),
          const SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }
}
