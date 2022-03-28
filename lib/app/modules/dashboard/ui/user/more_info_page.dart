import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/utils/capitalize.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../shared/models/activity_model.dart';
import '../../../../shared/themes/app_text_styles.dart';
import '../../utils/final_time_calculation.dart';

class MoreInfoPage extends StatefulWidget {
  final ActivityModel activity;

  const MoreInfoPage({Key? key, required this.activity}) : super(key: key);

  @override
  State<MoreInfoPage> createState() => _MoreInfoPageState();
}

class _MoreInfoPageState extends State<MoreInfoPage> {
  @override
  Widget build(BuildContext context) {
    var timeString = widget.activity.schedule[0].date == null
        ? ''
        : DateFormat('HH:mm').format(widget.activity.schedule[0].date!);
    var weekday = widget.activity.schedule[0].date == null
        ? ''
        : DateFormat('EEEE')
            .format(widget.activity.schedule[0].date!)
            .split('-')
            .first
            .capitalize();
    var finalTime = widget.activity.schedule[0].duration == null ||
            widget.activity.schedule[0].date == null
        ? ''
        : getActivityFinalTime(widget.activity.schedule[0].date!,
            widget.activity.schedule[0].duration!);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                widget.activity.type!.name.toUpperCase(),
                style: AppTextStyles.buttonBold.copyWith(
                    fontSize:
                        MediaQuery.of(context).size.width < 1000 ? 22 : 28,
                    color: AppColors.brandingPurple),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            widget.activity.title,
            style: AppTextStyles.buttonBold.copyWith(
                fontSize: MediaQuery.of(context).size.width < 1000 ? 22 : 28,
                color: Colors.black),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    widget.activity.schedule[0].date == null
                        ? ''
                        : DateFormat('dd/MM')
                            .format(widget.activity.schedule[0].date!),
                    style: AppTextStyles.buttonBold.copyWith(
                        fontSize:
                            MediaQuery.of(context).size.width < 1000 ? 14 : 18,
                        color: AppColors.brandingPurple),
                  ),
                  Text(
                    weekday,
                    style: AppTextStyles.buttonBold.copyWith(
                        fontSize:
                            MediaQuery.of(context).size.width < 1000 ? 20 : 24,
                        color: AppColors.brandingPurple),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Horário',
                    style: AppTextStyles.buttonBold.copyWith(
                        fontSize:
                            MediaQuery.of(context).size.width < 1000 ? 14 : 18,
                        color: AppColors.brandingPurple),
                  ),
                  Text(
                    '$timeString - $finalTime',
                    style: AppTextStyles.buttonBold.copyWith(
                        fontSize:
                            MediaQuery.of(context).size.width < 1000 ? 20 : 24,
                        color: AppColors.brandingPurple),
                  ),
                ],
              ),
              if (widget.activity.schedule[0].location != null)
                Column(
                  children: [
                    Text(
                      'Local',
                      style: AppTextStyles.buttonBold.copyWith(
                          fontSize: MediaQuery.of(context).size.width < 1000
                              ? 14
                              : 18,
                          color: AppColors.brandingPurple),
                    ),
                    Text(
                      widget.activity.schedule[0].location!,
                      style: AppTextStyles.buttonBold.copyWith(
                          fontSize: MediaQuery.of(context).size.width < 1000
                              ? 20
                              : 24,
                          color: AppColors.brandingPurple),
                    ),
                  ],
                ),
              if (widget.activity.schedule[0].link != null)
                Column(
                  children: [
                    Text(
                      'Zoom',
                      style: AppTextStyles.buttonBold.copyWith(
                          fontSize: MediaQuery.of(context).size.width < 1000
                              ? 14
                              : 18,
                          color: AppColors.brandingPurple),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: Transform.rotate(
                            angle: 135 * math.pi / 180,
                            child: Icon(
                              Icons.link,
                              color: AppColors.brandingPurple,
                              size: MediaQuery.of(context).size.width < 1000
                                  ? 20
                                  : 24,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () =>
                              launch(widget.activity.schedule[0].link!),
                          child: Text('Link',
                              style: AppTextStyles.buttonBold.copyWith(
                                  fontSize:
                                      MediaQuery.of(context).size.width < 1000
                                          ? 20
                                          : 24,
                                  color: AppColors.brandingPurple)),
                        ),
                      ],
                    ),
                  ],
                ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Center(
            child: ElevatedButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 64)),
                    elevation: MaterialStateProperty.all(20),
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.brandingPurple),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                    )),
                child: Text('Inscrever',
                    style: AppTextStyles.buttonBold.copyWith(
                        fontSize:
                            MediaQuery.of(context).size.width < 1000 ? 24 : 28,
                        color: Colors.white)),
                onPressed: () {}),
          )
        ],
      ),
    );
  }
}
