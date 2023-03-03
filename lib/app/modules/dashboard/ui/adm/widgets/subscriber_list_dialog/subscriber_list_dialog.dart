// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smile_front/app/shared/models/enrollments_model.dart';

import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';
import 'package:smile_front/generated/l10n.dart';

class SubscriberListDialog extends StatelessWidget {
  final String activityTitle;
  final bool isExtensive;
  final List<EnrollmentsModel> enrollments;
  final String participants;
  final String activityCode;
  final Function(String, String) onPressed;

  const SubscriberListDialog({
    Key? key,
    required this.onPressed,
    required this.activityCode,
    required this.enrollments,
    required this.activityTitle,
    required this.isExtensive,
    required this.participants,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: SizedBox(
        height: 692,
        width: 773,
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 446,
                height: 42,
                decoration: BoxDecoration(
                    color: AppColors.brandingBlue,
                    borderRadius: BorderRadius.circular(4)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 390,
                      child: Text(activityTitle,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.bold.copyWith(fontSize: 20)),
                    ),
                    if (isExtensive)
                      Icon(
                        Icons.star_border_outlined,
                        size: 33,
                        color: AppColors.brandingOrange,
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
                    color: AppColors.brandingBlue,
                    borderRadius: BorderRadius.circular(4)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.person,
                      size: 30,
                      color: AppColors.white,
                    ),
                    Text(participants,
                        style: AppTextStyles.bold.copyWith(fontSize: 22)),
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
              Text(
                S.of(context).namesTitle,
                style: AppTextStyles.bold
                    .copyWith(color: Colors.black, fontSize: 20),
              ),
              SizedBox(
                width: 556,
                child: Divider(
                  thickness: 2,
                  color: AppColors.brandingBlue,
                ),
              ),
              Observer(builder: (_) {
                return SizedBox(
                  width: 556,
                  height: 479,
                  child: ListView.builder(
                    itemCount: enrollments.length,
                    itemBuilder: (context, index) => Observer(builder: (_) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Observer(builder: (_) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 60),
                                  child: IconButton(
                                      hoverColor: AppColors.white,
                                      onPressed: (onPressed(activityCode,
                                          enrollments[index].user!.userId)),
                                      icon: Icon(
                                        Icons
                                            .do_not_disturb_on_total_silence_outlined,
                                        color: AppColors.redButton,
                                      )),
                                );
                              }),
                              Observer(builder: (_) {
                                return SizedBox(
                                  width: 350,
                                  child: Text(enrollments[index].user!.name,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: AppTextStyles.bold.copyWith(
                                          color: Colors.black, fontSize: 30)),
                                );
                              })
                            ],
                          ),
                          SizedBox(
                            width: 475,
                            child: Divider(
                              thickness: 1,
                              color: AppColors.brandingBlue,
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                );
              }),
              SizedBox(
                width: 556,
                child: Divider(
                  thickness: 2,
                  color: AppColors.brandingBlue,
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
                    style: AppTextStyles.bold.copyWith(fontSize: 30))),
          )
        ]),
      ),
    );
  }
}
