// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:smile_front/app/modules/dashboard/ui/user/widgets/responsible_activities_widgets/list_name_and_state_with_is_switched.dart';
import 'package:smile_front/app/shared/entities/infra/enrollment_state_enum.dart';
import 'package:smile_front/app/shared/models/professor_activity_model.dart';

import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../../generated/l10n.dart';
import '../../../../../../shared/models/enrollments_model.dart';
import '../../../../../../shared/themes/breakpoint.dart';

class SubscriberListWidget extends StatelessWidget {
  final bool isSwitched;
  final ProfessorActivityModel enrollmentsList;
  final int listViewItemCount;
  final bool isLoading;
  final bool isButtonLoading;
  final List<ListNameAndStateWithIsSwitched> professorList;
  final Function(bool, int) onChangedIsSwitched;
  final Function()? toggleSwitch;
  final String? emailLogDevCommunity;
  final Function(List<EnrollmentsModel>) sendEmailToAll;
  const SubscriberListWidget({
    Key? key,
    required this.onChangedIsSwitched,
    required this.professorList,
    required this.isButtonLoading,
    required this.isLoading,
    required this.enrollmentsList,
    required this.listViewItemCount,
    required this.isSwitched,
    required this.toggleSwitch,
    this.emailLogDevCommunity,
    required this.sendEmailToAll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width < breakpointLMobile
          ? 320
          : MediaQuery.of(context).size.width > breakpointTablet
              ? 570
              : 400,
      height: MediaQuery.of(context).size.width < breakpointLMobile
          ? 305
          : MediaQuery.of(context).size.width > breakpointTablet
              ? 435
              : 305,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 4, color: AppColors.brandingOrange)),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width > breakpointLMobile
                    ? 224
                    : 180,
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width <
                              breakpointLMobile
                          ? 10
                          : MediaQuery.of(context).size.width > breakpointTablet
                              ? 78
                              : 5,
                    ),
                    Text(S.of(context).absenceTitle,
                        style: AppTextStyles.bold.copyWith(
                            fontSize: MediaQuery.of(context).size.width <
                                    breakpointLMobile
                                ? 15
                                : 20,
                            color: Colors.black)),
                    SizedBox(
                      width: MediaQuery.of(context).size.width <
                              breakpointLMobile
                          ? 12
                          : MediaQuery.of(context).size.width > breakpointTablet
                              ? 20
                              : 10,
                    ),
                    Text(S.of(context).presenceTitle,
                        style: AppTextStyles.bold.copyWith(
                            fontSize: MediaQuery.of(context).size.width <
                                    breakpointLMobile
                                ? 15
                                : 20,
                            color: Colors.black)),
                  ],
                ),
              ),
              Text(S.of(context).namesTitle,
                  style: AppTextStyles.bold.copyWith(
                      fontSize:
                          MediaQuery.of(context).size.width < breakpointLMobile
                              ? 15
                              : 20,
                      color: Colors.black)),
              Padding(
                padding: const EdgeInsets.only(right: 88.0),
                child: Tooltip(
                  message: S.of(context).sendEmailToAllEnrolls,
                  child: IconButton(
                    onPressed: () {
                      sendEmailToAll(enrollmentsList.enrollments!);
                    },
                    icon: const Icon(Icons.mail_rounded),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 476,
            child: Divider(
              thickness: 4,
              color: AppColors.brandingOrange,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width > breakpointTablet
                ? 570
                : 400,
            height: MediaQuery.of(context).size.width > breakpointTablet
                ? 360
                : 242,
            child: ListView.builder(
              itemCount: listViewItemCount,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Container(
                      width:
                          MediaQuery.of(context).size.width > breakpointTablet
                              ? 440
                              : 400,
                      decoration: BoxDecoration(
                        color: professorList[index].state !=
                                EnrollmentStateEnum.IN_QUEUE
                            ? AppColors.white
                            : AppColors.gray.withOpacity(0.5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Observer(
                            builder: (_) {
                              return Observer(builder: (_) {
                                return SizedBox(
                                    width: MediaQuery.of(context).size.width <
                                            breakpointLMobile
                                        ? 80
                                        : MediaQuery.of(context).size.width >
                                                breakpointTablet
                                            ? 50
                                            : 100,
                                    child: enrollmentsList
                                                .enrollments![index].state !=
                                            EnrollmentStateEnum.IN_QUEUE
                                        ? Observer(builder: (_) {
                                            return Switch(
                                              value: professorList[index]
                                                  .isSwitched,
                                              onChanged: (value) {
                                                onChangedIsSwitched(
                                                    value, index);
                                              },
                                              activeColor: Colors.green,
                                              inactiveThumbColor: Colors.red,
                                              inactiveTrackColor:
                                                  Colors.red.withOpacity(0.5),
                                              activeTrackColor:
                                                  Colors.green.withOpacity(0.5),
                                            );
                                          })
                                        : Padding(
                                            padding: EdgeInsets.only(
                                                left: MediaQuery.of(context)
                                                            .size
                                                            .width >
                                                        breakpointTablet
                                                    ? 2
                                                    : 26),
                                            child: Text("Na fila",
                                                style: AppTextStyles.bold
                                                    .copyWith(
                                                        color: AppColors
                                                            .brandingOrange,
                                                        fontSize: 16)),
                                          ));
                              });
                            },
                          ),
                          Observer(builder: (_) {
                            return SizedBox(
                              width: MediaQuery.of(context).size.width <
                                      breakpointLMobile
                                  ? 200
                                  : MediaQuery.of(context).size.width >
                                          breakpointTablet
                                      ? 240
                                      : 270,
                              child: Text(
                                textAlign: TextAlign.center,
                                enrollmentsList.enrollments![index].user!.name,
                                style: AppTextStyles.bold.copyWith(
                                    fontSize:
                                        MediaQuery.of(context).size.width <
                                                breakpointLMobile
                                            ? 20
                                            : 30,
                                    color: Colors.black),
                              ),
                            );
                          }),
                          Tooltip(
                            message:
                                '${S.of(context).sendEmailToSomeone} ${enrollmentsList.enrollments![index].user!.name}',
                            child: IconButton(
                              onPressed: () {
                                launchUrl(
                                  Uri.parse(
                                      'mailto:${enrollmentsList.enrollments![index].user!.email}?${emailLogDevCommunity != null ? '&bcc=$emailLogDevCommunity' : ''}'),
                                  mode: LaunchMode.externalApplication,
                                );
                              },
                              icon: const Icon(Icons.mail_rounded),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 438,
                      child: Divider(
                        thickness: 2,
                        color: AppColors.brandingOrange,
                      ),
                    )
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
