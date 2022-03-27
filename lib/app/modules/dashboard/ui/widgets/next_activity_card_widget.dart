import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../shared/themes/app_colors.dart';
import '../../../../shared/themes/app_text_styles.dart';
import '../../utils/final_time_calculation.dart';

class NextActivityCardWidget extends StatelessWidget {
  final String name;
  final String description;
  final DateTime? date;
  final int? totalParticipants;
  final DateTime? duration;
  final Function()? onTap;
  const NextActivityCardWidget({
    Key? key,
    required this.name,
    required this.description,
    required this.date,
    required this.totalParticipants,
    this.onTap,
    required this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dateString = date == null ? '' : DateFormat('dd/MM/yyyy').format(date!);
    var timeString = date == null ? '' : DateFormat('HH:mm').format(date!);
    var finalTime = duration == null || date == null
        ? ''
        : getActivityFinalTime(date!, duration!);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.2,
          decoration: BoxDecoration(
            color: AppColors.brandingOrange,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                spreadRadius: 0.5,
                blurRadius: 3,
                offset: const Offset(5, 5), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 8,
                ),
                Text(
                  name,
                  maxLines: MediaQuery.of(context).size.width < 1000 ? 2 : 3,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.buttonBold.copyWith(
                      fontSize:
                          MediaQuery.of(context).size.width < 1000 ? 20 : 22,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 8,
                ),
                Flexible(
                  child: Text(
                    description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.button.copyWith(
                      fontSize:
                          MediaQuery.of(context).size.width < 1000 ? 14 : 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: Icon(
                              Icons.calendar_today,
                              color: Colors.white,
                              size: MediaQuery.of(context).size.width < 1000
                                  ? 18
                                  : 20,
                            ),
                          ),
                          Text(dateString,
                              style: AppTextStyles.button
                                  .copyWith(fontSize: 18, color: Colors.white))
                        ],
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: Icon(
                              Icons.access_time_outlined,
                              color: Colors.white,
                              size: MediaQuery.of(context).size.width < 1000
                                  ? 18
                                  : 20,
                            ),
                          ),
                          Text('$timeString - $finalTime',
                              style: AppTextStyles.button
                                  .copyWith(fontSize: 18, color: Colors.white))
                        ],
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                              size: MediaQuery.of(context).size.width < 1000
                                  ? 18
                                  : 20,
                            ),
                          ),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: '0/',
                                style: AppTextStyles.button.copyWith(
                                    fontSize: 18, color: Colors.white)),
                            TextSpan(
                                text: '$totalParticipants',
                                style: AppTextStyles.button.copyWith(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ])),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
