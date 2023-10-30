// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/shared/domain/enum/enrollment_state_enum.dart';

import 'package:smile_front/app/shared/infra/models/enrollments_model.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';
import 'package:smile_front/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

class ActivitiesCardWidget extends StatelessWidget {
  final String title;
  final String activityCode;
  final String description;
  final String date;
  final String time;
  final String finalTime;
  final DateTime finalDateTime;
  final List<EnrollmentsModel> enrollments;
  final int totalParticipants;
  final bool isExtensive;
  final bool isManualDropLoading;
  final bool isLoading;
  final Function() onPressedEdit;
  final Function() onPressedDelete;
  final Function(List<EnrollmentsModel> enrollments) sendEmailToAll;
  final Function(String, String) onPressedDropActivity;
  final String? emailLogDevCommunity;
  const ActivitiesCardWidget(
      {Key? key,
      required this.isLoading,
      required this.onPressedDropActivity,
      required this.title,
      required this.activityCode,
      required this.description,
      required this.date,
      required this.isManualDropLoading,
      required this.time,
      required this.finalTime,
      required this.enrollments,
      required this.totalParticipants,
      required this.isExtensive,
      required this.onPressedEdit,
      required this.finalDateTime,
      required this.onPressedDelete,
      this.emailLogDevCommunity,
      required this.sendEmailToAll})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String isAlreadyCompleted(DateTime date) {
      return date.isAfter(DateTime.now()) ? "" : "A atividade foi encerrada";
    }

    var filteredEnrollmentsForCompleted = enrollments
        .where(
            (enrollment) => enrollment.state == EnrollmentStateEnum.COMPLETED)
        .toList();

    var filteredEnrollmentsForEnrolled = enrollments
        .where((enrollment) => enrollment.state == EnrollmentStateEnum.ENROLLED)
        .toList();

    var filteredEnrollmentsForQueue = enrollments
        .where((enrollment) => enrollment.state == EnrollmentStateEnum.IN_QUEUE)
        .toList();

    var filteredEnrollments = filteredEnrollmentsForCompleted +
        filteredEnrollmentsForEnrolled +
        filteredEnrollmentsForQueue;

    int enrolledUsersLength = filteredEnrollments.length > totalParticipants
        ? totalParticipants
        : filteredEnrollments.length;

    return Column(
      children: [
        Container(
          width: 1165,
          height: 204,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                spreadRadius: 0.5,
                blurRadius: 3,
                offset: const Offset(5, 5), // changes position of shadow
              ),
            ],
          ),
          child: Row(children: [
            SizedBox(
              width: 773,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 39,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: AppColors.brandingBlue,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 680,
                                child: Text('$activityCode - $title',
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        overflow: TextOverflow.ellipsis)),
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
                                )
                            ],
                          ),
                        ),
                      ),
                      Text(description,
                          maxLines: 3,
                          style: AppTextStyles.headline1.copyWith(
                              fontSize: 20, overflow: TextOverflow.ellipsis)),
                    ]),
              ),
            ),
            Container(
                width: 390,
                height: 204,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.brandingBlue,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_today,
                                size: 33,
                                color: AppColors.white,
                              ),
                              Text(date,
                                  style: AppTextStyles.headline1.copyWith(
                                      fontSize: 18, color: AppColors.white))
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.watch_later_outlined,
                                size: 33,
                                color: AppColors.white,
                              ),
                              Text('$time - $finalTime',
                                  style: AppTextStyles.headline1.copyWith(
                                      fontSize: 18, color: AppColors.white))
                            ],
                          ),
                        ]),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Observer(builder: (_) {
                            return MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          backgroundColor: AppColors.white,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          content: SizedBox(
                                            height: 706,
                                            width: 773,
                                            child: Column(children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 446,
                                                    height: 42,
                                                    decoration: BoxDecoration(
                                                        color: AppColors
                                                            .brandingBlue,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4)),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        SizedBox(
                                                          width: 390,
                                                          child: Text(
                                                            '$activityCode - $title',
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: AppTextStyles
                                                                .headline1
                                                                .copyWith(
                                                                    fontSize:
                                                                        20),
                                                          ),
                                                        ),
                                                        if (isExtensive)
                                                          Icon(
                                                            Icons
                                                                .star_border_outlined,
                                                            size: 33,
                                                            color: AppColors
                                                                .brandingOrange,
                                                          ),
                                                        const SizedBox(
                                                          width: 10,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 20,
                                                  ),
                                                  Container(
                                                    width: 137,
                                                    height: 42,
                                                    decoration: BoxDecoration(
                                                        color: AppColors
                                                            .brandingBlue,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4)),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Icon(
                                                          Icons.person,
                                                          size: 30,
                                                          color:
                                                              AppColors.white,
                                                        ),
                                                        Text(
                                                            '$enrolledUsersLength/$totalParticipants',
                                                            style: AppTextStyles
                                                                .headline1
                                                                .copyWith(
                                                                    fontSize:
                                                                        22)),
                                                        const SizedBox(
                                                          width: 25,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 50,
                                              ),
                                              Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      const SizedBox(
                                                        width: 16,
                                                      ),
                                                      Text(
                                                        S
                                                            .of(context)
                                                            .namesTitle,
                                                        style: AppTextStyles
                                                            .headline1
                                                            .copyWith(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 20),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 30.0),
                                                        child: Tooltip(
                                                          message: S
                                                              .of(context)
                                                              .sendEmailToAllEnrolls,
                                                          child: IconButton(
                                                            onPressed: () {
                                                              sendEmailToAll(
                                                                  filteredEnrollments);
                                                            },
                                                            icon: const Icon(Icons
                                                                .mail_rounded),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: 700,
                                                    child: Divider(
                                                      thickness: 2,
                                                      color: AppColors
                                                          .brandingBlue,
                                                    ),
                                                  ),
                                                  Observer(builder: (_) {
                                                    return SizedBox(
                                                      width: 700,
                                                      height: 434,
                                                      child: ListView.builder(
                                                        itemCount:
                                                            filteredEnrollments
                                                                .length,
                                                        itemBuilder: (context,
                                                                index) =>
                                                            Observer(
                                                                builder: (_) {
                                                          return Column(
                                                            children: [
                                                              isLoading
                                                                  ? const Center(
                                                                      child:
                                                                          CircularProgressIndicator())
                                                                  : Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Observer(builder:
                                                                            (_) {
                                                                          return Padding(
                                                                            padding:
                                                                                const EdgeInsets.only(left: 40),
                                                                            child: IconButton(
                                                                                hoverColor: AppColors.white,
                                                                                onPressed: () {
                                                                                  onPressedDropActivity(activityCode, filteredEnrollments[index].user!.userId);
                                                                                  Modular.to.pop();
                                                                                },
                                                                                icon: Icon(
                                                                                  Icons.do_not_disturb_on_total_silence_outlined,
                                                                                  color: AppColors.redButton,
                                                                                )),
                                                                          );
                                                                        }),
                                                                        Observer(builder:
                                                                            (_) {
                                                                          return SizedBox(
                                                                            width:
                                                                                450,
                                                                            child: Text(filteredEnrollments[index].user!.name,
                                                                                overflow: TextOverflow.ellipsis,
                                                                                maxLines: 1,
                                                                                style: AppTextStyles.headline1.copyWith(color: Colors.black, fontSize: 30)),
                                                                          );
                                                                        }),
                                                                        Row(
                                                                          children: [
                                                                            Tooltip(
                                                                              message: '${S.of(context).sendEmailToSomeone} ${filteredEnrollments[index].user!.name}',
                                                                              child: IconButton(
                                                                                onPressed: () {
                                                                                  launchUrl(
                                                                                    Uri.parse('mailto:${filteredEnrollments[index].user!.email}?${emailLogDevCommunity != null ? '&bcc=$emailLogDevCommunity' : ''}'),
                                                                                    mode: LaunchMode.externalApplication,
                                                                                  );
                                                                                },
                                                                                icon: const Icon(Icons.mail_rounded),
                                                                              ),
                                                                            ),
                                                                            const SizedBox(
                                                                              width: 10,
                                                                            ),
                                                                            Container(
                                                                              height: 40,
                                                                              width: 110,
                                                                              decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                  color: filteredEnrollments[index].state == EnrollmentStateEnum.IN_QUEUE
                                                                                      ? AppColors.brandingBlue
                                                                                      : filteredEnrollments[index].state == EnrollmentStateEnum.COMPLETED
                                                                                          ? AppColors.greenButton
                                                                                          : AppColors.brandingOrange),
                                                                              child: Center(
                                                                                child: Text(
                                                                                  filteredEnrollments[index].state == EnrollmentStateEnum.IN_QUEUE
                                                                                      ? 'Na Fila'
                                                                                      : filteredEnrollments[index].state == EnrollmentStateEnum.COMPLETED
                                                                                          ? 'Completo'
                                                                                          : 'Inscrito',
                                                                                  style: AppTextStyles.headline1,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        )
                                                                      ],
                                                                    ),
                                                              SizedBox(
                                                                width: 700,
                                                                child: Divider(
                                                                  thickness: 1,
                                                                  color: AppColors
                                                                      .brandingBlue,
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        }),
                                                      ),
                                                    );
                                                  }),
                                                  const SizedBox(
                                                    height: 30,
                                                  ),
                                                  SizedBox(
                                                    width: 556,
                                                    child: Column(
                                                      children: [
                                                        Text(isAlreadyCompleted(
                                                            finalDateTime)),
                                                        Divider(
                                                          thickness: 2,
                                                          color: AppColors
                                                              .brandingBlue,
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                              const SizedBox(height: 15),
                                              SizedBox(
                                                width: 174,
                                                height: 47,
                                                child: ElevatedButton(
                                                    onPressed: Modular.to.pop,
                                                    child: Text('Fechar',
                                                        style: AppTextStyles
                                                            .headline1
                                                            .copyWith(
                                                                fontSize: 26))),
                                              )
                                            ]),
                                          ),
                                        );
                                      });
                                },
                                child: Container(
                                  width: 147,
                                  height: 44,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.4),
                                        spreadRadius: 0.5,
                                        blurRadius: 3,
                                        offset: const Offset(
                                            5, 5), // changes position of shadow
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(15),
                                    color:
                                        const Color.fromARGB(255, 46, 66, 138),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.person,
                                        size: 33,
                                        color: AppColors.white,
                                      ),
                                      Observer(builder: (_) {
                                        return Text(
                                            '$enrolledUsersLength/$totalParticipants',
                                            style: AppTextStyles.headline1
                                                .copyWith(
                                                    fontSize: 18,
                                                    color: AppColors.white));
                                      }),
                                      Icon(
                                        Icons.keyboard_arrow_right,
                                        size: 42,
                                        color: AppColors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                          Observer(builder: (_) {
                            return IconButton(
                                onPressed: onPressedEdit,
                                icon: Icon(Icons.mode_edit_outline_sharp,
                                    size: 28, color: AppColors.brandingOrange));
                          }),
                          Observer(builder: (_) {
                            return IconButton(
                                onPressed: onPressedDelete,
                                icon: Icon(Icons.delete,
                                    size: 28, color: AppColors.brandingOrange));
                          })
                        ])
                  ],
                ))
          ]),
        ),
      ],
    );
  }
}
