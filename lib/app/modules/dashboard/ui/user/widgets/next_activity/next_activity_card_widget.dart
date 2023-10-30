import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import 'package:smile_front/app/shared/helpers/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math' as math;

import '../../../../../../shared/entities/screen_variables.dart';
import '../../../../../../shared/themes/app_colors.dart';
import '../../../../../../shared/themes/app_text_styles.dart';
import '../../../../../../shared/themes/breakpoint.dart';

class NextActivityCardWidget extends StatelessWidget {
  final String name;
  final String description;
  final DateTime? date;
  final int? totalParticipants;
  final String? link;
  final String? location;
  final int? duration;
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
      padding: MediaQuery.of(context).size.width < breakpointLMobile
          ? const EdgeInsets.symmetric(horizontal: 8, vertical: 16)
          : const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            width: MediaQuery.of(context).size.width < breakpointTablet
                ? MediaQuery.of(context).size.width
                : 1165,
            height: MediaQuery.of(context).size.width < tabletSize ? 164 : 204,
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
                    maxLines:
                        MediaQuery.of(context).size.width < tabletSize ? 2 : 3,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.headline3.copyWith(
                        fontSize: MediaQuery.of(context).size.width < tabletSize
                            ? 20
                            : 30,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Html(
                    data: description,
                    style: {
                      "body": Style(
                        margin: EdgeInsets.zero,
                        padding: EdgeInsets.zero,
                        fontSize: FontSize(
                            MediaQuery.of(context).size.width < tabletSize
                                ? 14
                                : 16),
                        color: Colors.white,
                        textAlign: TextAlign.justify,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                    },
                    onLinkTap: (url, context, attributes, element) =>
                        url != null
                            ? launchUrl(Uri.parse(url),
                                mode: LaunchMode.externalApplication)
                            : null,
                  ),
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
                                size: MediaQuery.of(context).size.width <
                                        tabletSize
                                    ? 18
                                    : 26,
                              ),
                            ),
                            isUser
                                ? Text(weekday,
                                    style: AppTextStyles.headline1.copyWith(
                                        fontSize:
                                            MediaQuery.of(context).size.width <
                                                    tabletSize
                                                ? 12
                                                : 18,
                                        color: Colors.white))
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
                                size: MediaQuery.of(context).size.width <
                                        tabletSize
                                    ? 18
                                    : 26,
                              ),
                            ),
                            Text('$timeString - $finalTime',
                                style: AppTextStyles.headline1.copyWith(
                                    fontSize:
                                        MediaQuery.of(context).size.width <
                                                tabletSize
                                            ? 12
                                            : 18,
                                    color: Colors.white))
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
                                  size: MediaQuery.of(context).size.width <
                                          tabletSize
                                      ? 18
                                      : 26,
                                ),
                              ),
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: '0/',
                                    style: AppTextStyles.headline1.copyWith(
                                        fontSize: 18, color: Colors.white)),
                                TextSpan(
                                    text: '$totalParticipants',
                                    style: AppTextStyles.headline1.copyWith(
                                        fontSize:
                                            MediaQuery.of(context).size.width <
                                                    tabletSize
                                                ? 12
                                                : 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ])),
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
                                  size: MediaQuery.of(context).size.width <
                                          tabletSize
                                      ? 18
                                      : 26,
                                ),
                              ),
                              Text(location!,
                                  style: AppTextStyles.headline1.copyWith(
                                      fontSize:
                                          MediaQuery.of(context).size.width <
                                                  tabletSize
                                              ? 12
                                              : 18,
                                      color: Colors.white))
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
                                    size: MediaQuery.of(context).size.width <
                                            tabletSize
                                        ? 18
                                        : 26,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => launchUrl(
                                  Uri.parse(link!),
                                  mode: LaunchMode.externalApplication,
                                ),
                                child: Text('Link',
                                    style: AppTextStyles.headline1.copyWith(
                                      fontSize:
                                          MediaQuery.of(context).size.width <
                                                  tabletSize
                                              ? 12
                                              : 18,
                                      color: Colors.white,
                                      decoration: TextDecoration.underline,
                                    )),
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
      ),
    );
  }
}
