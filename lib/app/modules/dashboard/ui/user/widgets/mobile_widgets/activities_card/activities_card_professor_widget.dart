// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smile_front/app/shared/entities/infra/delivery_enum.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';
import 'package:smile_front/generated/l10n.dart';
import '../../../../../../../shared/themes/breakpoint.dart';

class ActivitiesCardProfessorWidget extends StatelessWidget {
  final String title;
  final String hour;
  final String finalTime;
  final String? location;
  final Function() onTap;
  final bool isLoading;
  final Color? mainColor;
  final DeliveryEnum? deliveryEnum;
  final bool isExtensive;
  final DateTime date;
  const ActivitiesCardProfessorWidget({
    Key? key,
    required this.title,
    required this.hour,
    required this.finalTime,
    this.location,
    required this.onTap,
    required this.isLoading,
    this.mainColor,
    this.deliveryEnum,
    required this.isExtensive,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd/MM').format(date);
    String formattedLocation = location == null || location == ''
        ? '${S.of(context).local}: Online'
        : '${S.of(context).local}: $location';
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
              width: MediaQuery.of(context).size.width < breakpointTablet
                  ? MediaQuery.of(context).size.width
                  : 1165,
              height: MediaQuery.of(context).size.width < breakpointTablet
                  ? 76
                  : 204,
              child: Row(children: [
                Container(
                    width: MediaQuery.of(context).size.width < breakpointMobile
                        ? 70
                        : 190,
                    decoration: BoxDecoration(
                        color: mainColor ?? AppColors.brandingBlue,
                        borderRadius: BorderRadius.circular(15)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(hour,
                          style: AppTextStyles.headline1.copyWith(
                              fontSize: MediaQuery.of(context).size.width <
                                      breakpointTablet
                                  ? 20
                                  : 40)),
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
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyles.headline1.copyWith(
                                        fontSize:
                                            MediaQuery.of(context).size.width <
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
                        Row(children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Data: $formattedDate',
                                style: AppTextStyles.headline1.copyWith(
                                    fontSize: MediaQuery.of(context)
                                                .size
                                                .width <
                                            breakpointMobile
                                        ? 12
                                        : MediaQuery.of(context).size.width <
                                                breakpointTablet
                                            ? 16
                                            : 24,
                                    color: Colors.black),
                              ),
                              Row(
                                children: [
                                  Text(
                                    formattedLocation,
                                    style: AppTextStyles.headline1.copyWith(
                                        fontSize:
                                            MediaQuery.of(context).size.width <
                                                    breakpointMobile
                                                ? 12
                                                : MediaQuery.of(context)
                                                            .size
                                                            .width <
                                                        breakpointTablet
                                                    ? 16
                                                    : 24,
                                        color: Colors.black,
                                        overflow: TextOverflow.ellipsis),
                                    maxLines: 1,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width <
                                            breakpointTablet
                                        ? 16
                                        : 64,
                                  ),
                                  MediaQuery.of(context).size.width <
                                              breakpointLMobile ||
                                          formattedLocation.length > 13
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
      ),
    );
  }
}
