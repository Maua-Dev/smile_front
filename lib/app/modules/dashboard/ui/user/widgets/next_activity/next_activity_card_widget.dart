import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_web.dart';
import 'package:smile_front/app/shared/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math' as math;

import '../../../../../../shared/themes/app_colors.dart';
import '../../../../../../shared/themes/app_text_styles.dart';

class NextActivityCardWidget extends StatelessWidget {
  final String name;
  final String description;
  final DateTime? date;
  final int? totalParticipants;
  final String? link;
  final String? location;
  final DateTime? duration;
  final Function()? onTap;
  final bool isUser;
  const NextActivityCardWidget({
    Key? key,
    required this.name,
    required this.description,
    required this.date,
    this.totalParticipants,
    this.onTap,
    required this.duration,
    this.link,
    this.location,
    this.isUser = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var timeString = date == null ? '' : DateFormat('HH:mm').format(date!);
    var weekday = date == null
        ? ''
        : DateFormat('EEEE').format(date!).substring(0, 3).toUpperCase();
    var finalTime = duration == null || date == null
        ? ''
        : Utils.getActivityFinalTime(date!, duration!);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: MediaQuery.of(context).size.width,
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
                TextRenderer(
                  child: Text(
                    name,
                    maxLines: MediaQuery.of(context).size.width < 1000 ? 2 : 3,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.buttonBold.copyWith(
                        fontSize:
                            MediaQuery.of(context).size.width < 1000 ? 20 : 22,
                        color: Colors.white),
                  ),),
                const SizedBox(
                  height: 8,
                ),
                TextRenderer(
                  child: Text(
                  description,
                  style: AppTextStyles.button.copyWith(
                    fontSize:
                        MediaQuery.of(context).size.width < 1000 ? 14 : 16,
                    color: Colors.white,
                  ),
                ),),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: Icon(
                              Icons.date_range,
                              color: Colors.white,
                              size: MediaQuery.of(context).size.width < 500
                                  ? 18
                                  : MediaQuery.of(context).size.width < 1000
                                      ? 24
                                      : 26,
                            ),
                          ),
                          isUser
                              ? TextRenderer(
                                child: Text(weekday,
                                  style: AppTextStyles.button.copyWith(
                                      fontSize:
                                          MediaQuery.of(context).size.width <
                                                  500
                                              ? 12
                                              : 18,
                                      color: Colors.white)))
                              : const SizedBox.shrink(),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: Icon(
                              Icons.access_time_outlined,
                              color: Colors.white,
                              size: MediaQuery.of(context).size.width < 500
                                  ? 18
                                  : MediaQuery.of(context).size.width < 1000
                                      ? 24
                                      : 26,
                            ),
                          ),
                          TextRenderer(
                            child: Text('$timeString - $finalTime',
                              style: AppTextStyles.button.copyWith(
                                  fontSize:
                                      MediaQuery.of(context).size.width < 500
                                          ? 12
                                          : 18,
                                  color: Colors.white)))
                        ],
                      ),
                      if (!isUser)
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 4),
                              child: Icon(
                                isUser ? Icons.location_on : Icons.person,
                                color: Colors.white,
                                size: MediaQuery.of(context).size.width < 500
                                    ? 18
                                    : MediaQuery.of(context).size.width < 1000
                                        ? 24
                                        : 26,
                              ),
                            ),
                          TextRenderer(
                          child: RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: '0/',
                                  style: AppTextStyles.button.copyWith(
                                      fontSize: 18, color: Colors.white)),
                              TextSpan(
                                  text: '$totalParticipants',
                                  style: AppTextStyles.button.copyWith(
                                      fontSize:
                                          MediaQuery.of(context).size.width <
                                                  500
                                              ? 12
                                              : 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ]))),
                          ],
                        ),
                      if (isUser && location != null)
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 4),
                              child: Icon(
                                Icons.location_on,
                                color: Colors.white,
                                size: MediaQuery.of(context).size.width < 500
                                    ? 18
                                    : MediaQuery.of(context).size.width < 1000
                                        ? 24
                                        : 26,
                              ),
                            ),
                            TextRenderer(
                              child: Text(location!,
                                  style: AppTextStyles.button.copyWith(
                                      fontSize:
                                          MediaQuery.of(context).size.width < 500
                                              ? 12
                                              : 18,
                                      color: Colors.white)))
                          ],
                        ),
                      if (isUser && link != null)
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 4),
                              child: Transform.rotate(
                                angle: 135 * math.pi / 180,
                                child: Icon(
                                  Icons.link,
                                  color: Colors.white,
                                  size: MediaQuery.of(context).size.width < 500
                                      ? 18
                                      : MediaQuery.of(context).size.width < 1000
                                          ? 24
                                          : 26,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => launchUrl(
                                Uri.parse(link!),
                                mode: LaunchMode.externalApplication,
                              ),
                              child: TextRenderer(
                                child: Text('Link',
                                    style: AppTextStyles.button.copyWith(
                                      fontSize:
                                          MediaQuery.of(context).size.width < 500
                                              ? 12
                                              : 18,
                                      color: Colors.white,
                                      decoration: TextDecoration.underline,
                                    )),)
                            )
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
