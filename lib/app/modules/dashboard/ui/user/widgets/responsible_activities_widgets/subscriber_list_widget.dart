// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:smile_front/app/shared/entities/infra/enrollment_state_enum.dart';
import 'package:smile_front/app/shared/models/professor_activity_model.dart';

import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

import '../../../../../../../generated/l10n.dart';
import '../../../../../../shared/themes/breakpoint.dart';

class SubscriberListWidget extends StatelessWidget {
  final bool isSwitched;
  final List<ProfessorActivityModel>? enrollmentsList;
  final int listViewItemCount;
  final Function()? toggleSwitch;
  const SubscriberListWidget({
    Key? key,
    required this.enrollmentsList,
    required this.listViewItemCount,
    required this.isSwitched,
    required this.toggleSwitch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width < breakpointTablet ? 400 : 570,
      height: MediaQuery.of(context).size.width < breakpointTablet ? 300 : 430,
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
                width: 224,
                child: Row(
                  children: [
                    SizedBox(
                      width:
                          MediaQuery.of(context).size.width < breakpointTablet
                              ? 5
                              : 78,
                    ),
                    Text(S.of(context).absenceTitle,
                        style: AppTextStyles.bold
                            .copyWith(fontSize: 20, color: Colors.black)),
                    SizedBox(
                      width:
                          MediaQuery.of(context).size.width < breakpointTablet
                              ? 10
                              : 20,
                    ),
                    Text(S.of(context).presenceTitle,
                        style: AppTextStyles.bold
                            .copyWith(fontSize: 20, color: Colors.black)),
                  ],
                ),
              ),
              Row(
                children: [
                  Text(S.of(context).namesTitle,
                      style: AppTextStyles.bold
                          .copyWith(fontSize: 20, color: Colors.black)),
                  SizedBox(
                    width: MediaQuery.of(context).size.width < breakpointTablet
                        ? 104
                        : 180,
                  )
                ],
              )
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
            width: MediaQuery.of(context).size.width < breakpointTablet
                ? 400
                : 570,
            height: MediaQuery.of(context).size.width < breakpointTablet
                ? 242
                : 360,
            child: ListView.builder(
              itemCount: listViewItemCount,
              itemBuilder: (BuildContext context, int index) {
                // List<ListItem> list = enrollmentsList!
                //    .map(
                //      (e) => ListItem(
                //         name: e.userEnroll!.name,
                //         state: e.state,
                //         isSwitched: e.state == EnrollmentStateEnum.COMPLETED
                //              ? true
                //            : false),
                //   )
                //   .toList();
                return Column(
                  children: [
                    Container(
                      width:
                          MediaQuery.of(context).size.width < breakpointTablet
                              ? 400
                              : 440,
                      decoration: BoxDecoration(
                        color: enrollmentsList![0].enrollments![index].state !=
                                EnrollmentStateEnum.IN_QUEUE
                            ? AppColors.white
                            : AppColors.gray.withOpacity(0.5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Observer(
                            builder: (_) {
                              return SizedBox(
                                  width: MediaQuery.of(context).size.width <
                                          breakpointTablet
                                      ? 100
                                      : 50,
                                  child: enrollmentsList![0]
                                              .enrollments![index]
                                              .state !=
                                          EnrollmentStateEnum.IN_QUEUE
                                      ? Switch(
                                          value: enrollmentsList![0].isExtensive,
                                          onChanged: (value) {
                                            if (enrollmentsList![0]
                                                    .enrollments![index]
                                                    .state !=
                                                EnrollmentStateEnum.IN_QUEUE) {
                                              toggleSwitch!();
                                            } else {
                                              null;
                                            }
                                          },
                                          activeColor: Colors.green,
                                          inactiveThumbColor: Colors.red,
                                          inactiveTrackColor:
                                              Colors.red.withOpacity(0.5),
                                          activeTrackColor:
                                              Colors.green.withOpacity(0.5),
                                        )
                                      : Padding(
                                          padding: EdgeInsets.only(
                                              left: MediaQuery.of(context)
                                                          .size
                                                          .width <
                                                      breakpointTablet
                                                  ? 26
                                                  : 2),
                                          child: Text("Na fila",
                                              style: AppTextStyles.bold
                                                  .copyWith(
                                                      color: AppColors
                                                          .brandingOrange,
                                                      fontSize: 16)),
                                        ));
                            },
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width <
                                    breakpointTablet
                                ? 270
                                : 240,
                            child: Text(
                              textAlign: TextAlign.center,
                              enrollmentsList![0]
                                  .enrollments![index]
                                  .userEnroll!
                                  .name,
                              style: AppTextStyles.bold
                                  .copyWith(fontSize: 30, color: Colors.black),
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
