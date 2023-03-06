import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smile_front/app/shared/entities/infra/delivery_enum.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';
import 'package:smile_front/generated/l10n.dart';

import '../../../../../../../shared/entities/screen_variables.dart';
import '../../../../../../../shared/themes/breakpoint.dart';

class MobileActivitiesCardUserDashboard extends StatelessWidget {
  final String title;
  final String hour;
  final String finalTime;
  final String? location;
  final Function() onTap;
  final bool isLoading;
  final Color? mainColor;
  final bool isExtensive;
  final DateTime date;
  const MobileActivitiesCardUserDashboard({
    Key? key,
    required this.title,
    required this.hour,
    required this.onTap,
    required this.isLoading,
    required this.finalTime,
    required this.location,
    this.mainColor,
    required this.isExtensive,
    required this.date,
    DeliveryEnum? deliveryEnum,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd/MM').format(date);
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
            width: MediaQuery.of(context).size.width < breakpointLMobile
                ? 280
                : MediaQuery.of(context).size.width > breakpointTablet
                    ? 1165
                    : 342,
            height:
                MediaQuery.of(context).size.width < breakpointTablet ? 76 : 204,
            child: Row(children: [
              Container(
                  width:
                      MediaQuery.of(context).size.width < tabletSize ? 70 : 190,
                  height:
                      MediaQuery.of(context).size.width < tabletSize ? 76 : 204,
                  decoration: BoxDecoration(
                      color: mainColor ?? AppColors.brandingBlue,
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
                  padding: MediaQuery.of(context).size.width < breakpointTablet
                      ? const EdgeInsets.symmetric(horizontal: 8)
                      : const EdgeInsets.only(left: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
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
                                              ? 14
                                              : 30,
                                      color:
                                          mainColor ?? AppColors.brandingBlue)),
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
                      Row(children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${S.of(context).termination}: $finalTime',
                                style: AppTextStyles.bold.copyWith(
                                    fontSize:
                                        MediaQuery.of(context).size.width <
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
                                        fontSize:
                                            MediaQuery.of(context).size.width <
                                                    breakpointTablet
                                                ? 12
                                                : 24,
                                        color: Colors.black)),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width <
                                          breakpointTablet
                                      ? 16
                                      : 64,
                                ),
                                Text(
                                  'Data: $formattedDate',
                                  style: AppTextStyles.bold.copyWith(
                                      fontSize:
                                          MediaQuery.of(context).size.width <
                                                  breakpointTablet
                                              ? 12
                                              : 24,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ])
                    ],
                  ),
                ),
              ),
              Padding(
                padding: MediaQuery.of(context).size.width < breakpointTablet
                    ? const EdgeInsets.only(right: 8)
                    : const EdgeInsets.only(right: 64),
                child: Icon(Icons.arrow_forward_ios_sharp,
                    size: MediaQuery.of(context).size.width < breakpointTablet
                        ? 20
                        : 40),
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
