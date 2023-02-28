// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:smile_front/app/shared/models/enrollments_model.dart';

import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';
import 'package:smile_front/generated/l10n.dart';

class SubscriberListDialog extends StatelessWidget {
  final String activityTitle;
  final bool isExtensive;
  final List<EnrollmentsModel> enrollments;
  final String participants;

  const SubscriberListDialog({
    Key? key,
    required this.enrollments,
    required this.activityTitle,
    required this.isExtensive,
    required this.participants,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      content: Column(children: [
        Row(
          children: [
            const SizedBox(
              width: 50,
            ),
            Container(
              width: 446,
              height: 42,
              decoration: BoxDecoration(
                  color: AppColors.brandingBlue,
                  borderRadius: BorderRadius.circular(4)),
              child: Align(
                alignment: Alignment.center,
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
              S.of(context).nameTitle,
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
            ListView.builder(
              itemCount: enrollments.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.do_not_disturb_on_total_silence_outlined,
                          color: AppColors.redButton,
                        )),
                    Text(enrollments[index].user!.name,
                        style: AppTextStyles.bold
                            .copyWith(color: Colors.black, fontSize: 30))
                  ],
                );
              },
            ),
            SizedBox(
              width: 556,
              child: Divider(
                thickness: 2,
                color: AppColors.brandingBlue,
              ),
            )
          ],
        )
      ]),
    );
  }
}
