import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/weekdays_enum.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:smile_front/app/shared/themes/app_text_styles.dart';

import 'activity_card_widget.dart';

class ActivitiesCarouselWidget extends StatelessWidget {
  final int? weekday;
  final Color? cardColor;
  final Color? textColor;
  final List<ActivityModel> list;

  const ActivitiesCarouselWidget({
    Key? key,
    required this.list,
    this.weekday,
    this.cardColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController _controller = ScrollController();
    void _scrollRight(length) {
      _controller.animateTo(_controller.position.pixels + 400,
          duration: const Duration(seconds: 1), curve: Curves.ease);
    }

    void _scrollLeft(length) {
      _controller.animateTo(_controller.position.pixels - 400,
          duration: const Duration(seconds: 1), curve: Curves.ease);
    }

    return Column(
      children: [
        if (weekday != null)
          Padding(
            padding: const EdgeInsets.only(left: 72.0),
            child: Row(
              children: [
                Text(
                  weekday != null ? WeekdaysEnum.values[weekday!].name : '',
                  style: AppTextStyles.titleH1
                      .copyWith(fontSize: 40, color: AppColors.brandingBlue),
                ),
              ],
            ),
          ),
        if (list.isEmpty)
          const Padding(
            padding: EdgeInsets.all(28.0),
            child: Text(
                'Ops..., parece que não há atividades cadastradas nesse dia.'),
          )
        else
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 30),
            child: Stack(
              children: [
                SizedBox(
                    height: 250,
                    child: ListView.builder(
                        controller: _controller,
                        scrollDirection: Axis.horizontal,
                        itemCount: list.length,
                        itemBuilder: (BuildContext ctx, index) {
                          String date = '';
                          String time = '';
                          for (var element in list[index].schedule) {
                            if (element.date?.weekday == weekday) {
                              date = DateFormat('dd/MM/yyyy')
                                  .format(element.date!);
                              time = DateFormat('hh:mm').format(element.hour!);
                            } else if (weekday == null) {
                              date = DateFormat('dd/MM/yyyy')
                                  .format(list[index].schedule[0].date!);
                              time = DateFormat('hh:mm')
                                  .format(list[index].schedule[0].hour!);
                            }
                          }
                          return Row(
                            children: [
                              if (index == 0)
                                const SizedBox(
                                  width: 120,
                                ),
                              SizedBox(
                                height: 240,
                                child: ActivityCardWidget(
                                  onTap: () {
                                    Modular.to.pushNamed(
                                      '/adm/edit-activity',
                                      arguments: list[index],
                                    );
                                  },
                                  cardColor: cardColor,
                                  textColor: textColor,
                                  name: list[index].title,
                                  description: list[index].description,
                                  date: date,
                                  time: time,
                                  totalParticipants:
                                      list[index].schedule[0].totalParticipants,
                                ),
                              ),
                              if (index == list.length - 1)
                                const SizedBox(
                                  width: 172,
                                ),
                            ],
                          );
                        })),
                if (list.isNotEmpty)
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
                              offset: const Offset(
                                  5, 5), // changes position of shadow
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
                            color: AppColors.brandingBlue,
                          ),
                        )),
                      ),
                    ),
                  ),
                if (list.isNotEmpty)
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
                              offset: const Offset(
                                  5, 5), // changes position of shadow
                            ),
                          ],
                        ),
                        width: 60,
                        height: 60,
                        child: Center(
                            child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: AppColors.brandingBlue,
                        )),
                      ),
                    ),
                  ),
              ],
            ),
          )
      ],
    );
  }
}
