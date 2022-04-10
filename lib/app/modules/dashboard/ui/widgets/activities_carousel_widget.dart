import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/weekdays_enum.dart';
import 'package:smile_front/app/shared/entities/card_activity.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

import '../../../../shared/utils/utils.dart';
import '../../../auth/infra/repositories/secure_storage.dart';
import 'activity_card_widget.dart';

class ActivitiesCarouselWidget extends StatelessWidget {
  final int? weekday;
  final bool isNextActivity;
  final Color? cardColor;
  final List<CardActivity> list;
  final List<ActivityModel> listToEdit;

  const ActivitiesCarouselWidget({
    Key? key,
    required this.list,
    required this.listToEdit,
    this.weekday,
    this.cardColor,
    this.isNextActivity = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var secureStorage = Modular.get<SecureStorage>();
    final ScrollController _controller = ScrollController();
    void _scrollRight(length) {
      _controller.animateTo(_controller.position.pixels + 400,
          duration: const Duration(seconds: 1), curve: Curves.ease);
    }

    void _scrollLeft(length) {
      _controller.animateTo(_controller.position.pixels - 400,
          duration: const Duration(seconds: 1), curve: Curves.ease);
    }

    if (list.isNotEmpty) {
      return Column(
        children: [
          if (weekday != null)
            Padding(
              padding: const EdgeInsets.only(left: 72.0),
              child: Row(
                children: [
                  Text(
                    weekday != null ? WeekdaysEnum.values[weekday!].name : '',
                    style: AppTextStyles.titleH1.copyWith(
                        fontSize: 32, color: AppColors.brandingPurple),
                  ),
                ],
              ),
            ),
          Stack(
            children: [
              SizedBox(
                  height: 250,
                  child: ListView.builder(
                      controller: _controller,
                      scrollDirection: Axis.horizontal,
                      itemCount: list.length,
                      itemBuilder: (BuildContext ctx, index) {
                        String date =
                            DateFormat('dd/MM/yyyy').format(list[index].date!);
                        String time =
                            DateFormat('HH:mm').format(list[index].date!);
                        String finalTime = Utils.getActivityFinalTime(
                            list[index].date!, list[index].duration!);
                        return Row(
                          children: [
                            if (index == 0)
                              const SizedBox(
                                width: 120,
                              ),
                            SizedBox(
                              height: 200,
                              child: ActivityCardWidget(
                                enrolledUsersLength:
                                    list[index].enrolledUsers!.length,
                                onTap: () async {
                                  var accessLevel =
                                      await secureStorage.getAccessLevel();
                                  if (accessLevel == 'ADMIN') {
                                    Modular.to.navigate(
                                      '/adm/edit-activity',
                                      arguments: listToEdit.firstWhere(
                                          (element) =>
                                              element.id == list[index].id),
                                    );
                                  } else {}
                                },
                                finalTime: finalTime,
                                activityCode: list[index].activityCode,
                                cardColor: cardColor,
                                textColor: isNextActivity
                                    ? Colors.white
                                    : Colors.black,
                                name: list[index].title,
                                description: list[index].description,
                                date: date,
                                time: time,
                                totalParticipants:
                                    list[index].totalParticipants,
                              ),
                            ),
                            if (index == list.length - 1)
                              const SizedBox(
                                width: 172,
                              ),
                          ],
                        );
                      })),
              Positioned(
                top: 90,
                left: 40,
                child: GestureDetector(
                  onTap: () => _scrollLeft(list.length),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          spreadRadius: 0.5,
                          blurRadius: 3,
                          offset:
                              const Offset(5, 5), // changes position of shadow
                        ),
                      ],
                    ),
                    width: 60,
                    height: 60,
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.brandingPurple,
                      ),
                    )),
                  ),
                ),
              ),
              Positioned(
                top: 90,
                left: MediaQuery.of(context).size.width - 120,
                child: GestureDetector(
                  onTap: () => _scrollRight(list.length),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          spreadRadius: 0.5,
                          blurRadius: 3,
                          offset:
                              const Offset(5, 5), // changes position of shadow
                        ),
                      ],
                    ),
                    width: 60,
                    height: 60,
                    child: Center(
                        child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.brandingPurple,
                    )),
                  ),
                ),
              ),
            ],
          )
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
