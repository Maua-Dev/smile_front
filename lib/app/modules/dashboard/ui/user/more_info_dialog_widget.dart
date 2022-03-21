import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

import '../../../../shared/models/activity_model.dart';
import '../../../../shared/themes/app_colors.dart';
import '../../../../shared/widgets/text_header_scratched.dart';
import '../widgets/add_photo_widget.dart';

void moreInfoDialogWidget(BuildContext context, ActivityModel activity) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 500),
    pageBuilder: (_, __, ___) {
      return Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.65,
          width: MediaQuery.of(context).size.width * 0.65,
          decoration: BoxDecoration(
              color: AppColors.brandingPurple,
              border: Border.all(color: AppColors.lightPurple, width: 5),
              borderRadius: BorderRadius.circular(25)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Material(
                  color: AppColors.brandingPurple,
                  child: TextHeaderScratched(
                    title: activity.title,
                    color: Colors.white,
                    leftPadding: 24,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                child: Material(
                  color: AppColors.brandingPurple,
                  child: Text(
                    activity.description,
                    style: AppTextStyles.body
                        .copyWith(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: activity.schedule.length,
                  itemBuilder: (context, index) {
                    var date = DateFormat('dd/MM/yyyy')
                        .format(activity.schedule[index].date!);
                    var time = DateFormat('HH:mm')
                        .format(activity.schedule[index].date!);
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Material(
                            color: AppColors.brandingPurple,
                            child: Text('${index + 1}° Horário  -  ',
                                style: AppTextStyles.button.copyWith(
                                  fontSize: 20,
                                  color: Colors.white,
                                )),
                          ),
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 4),
                                child: Icon(
                                  Icons.calendar_today,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                              Material(
                                color: AppColors.brandingPurple,
                                child: Text(date,
                                    style: AppTextStyles.button.copyWith(
                                      fontSize: 20,
                                      color: Colors.white,
                                    )),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 4),
                                child: Icon(
                                  Icons.access_time_outlined,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                              Material(
                                color: AppColors.brandingPurple,
                                child: Text(time,
                                    style: AppTextStyles.button.copyWith(
                                        fontSize: 20, color: Colors.white)),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 4),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: '0/',
                                    style: AppTextStyles.button.copyWith(
                                        fontSize: 20, color: Colors.white)),
                                TextSpan(
                                    text: activity
                                        .schedule[index].totalParticipants
                                        .toString(),
                                    style: AppTextStyles.button.copyWith(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ])),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 48, vertical: 8),
                child: Material(
                  color: AppColors.brandingPurple,
                  child: Text(
                    'Palestrante:',
                    style: AppTextStyles.titleH1
                        .copyWith(fontSize: 45, color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48),
                child: Row(
                  children: [
                    Material(
                      color: AppColors.brandingPurple,
                      child: const AddPhotoWidget(size: 0.12),
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Material(
                          color: AppColors.brandingPurple,
                          child: Text(
                            '${activity.speaker.name} - ${activity.speaker.company}',
                            style: AppTextStyles.body
                                .copyWith(color: Colors.white, fontSize: 30),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Material(
                          color: AppColors.brandingPurple,
                          child: Text(
                            activity.speaker.bio,
                            textAlign: TextAlign.justify,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.body
                                .copyWith(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              )
            ],
          ),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
      } else {
        tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
      }

      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
  );
}
