import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:smile_front/app/modules/dashboard/ui/widgets/user_weekday/user_weekday_controller.dart';
import 'package:smile_front/app/modules/dashboard/ui/widgets/user_weekday/user_weekday_icon_widget.dart';

class UserWeekdayFilterWidget extends StatelessWidget {
  final void Function(int)? onPressed;
  const UserWeekdayFilterWidget({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = UserWeekdayController();
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 8,
            vertical: MediaQuery.of(context).size.width < 1000 ? 8 : 16),
        child: Observer(builder: (_) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UserWeekdayIconWidget(
                myIndex: 0,
                indexToShow: controller.indexToShow,
                onPressed: () {
                  controller.toggleIndex(0);
                  onPressed!(0);
                },
                weekday: 0,
              ),
              UserWeekdayIconWidget(
                myIndex: 1,
                indexToShow: controller.indexToShow,
                onPressed: () {
                  controller.toggleIndex(1);
                  onPressed!(1);
                },
                weekday: 1,
              ),
              UserWeekdayIconWidget(
                myIndex: 2,
                indexToShow: controller.indexToShow,
                onPressed: () {
                  controller.toggleIndex(2);
                  onPressed!(2);
                },
                weekday: 2,
              ),
              UserWeekdayIconWidget(
                myIndex: 3,
                indexToShow: controller.indexToShow,
                onPressed: () {
                  controller.toggleIndex(3);
                  onPressed!(3);
                },
                weekday: 3,
              ),
              UserWeekdayIconWidget(
                myIndex: 4,
                indexToShow: controller.indexToShow,
                onPressed: () {
                  controller.toggleIndex(4);
                  onPressed!(4);
                },
                weekday: 4,
              ),
              UserWeekdayIconWidget(
                myIndex: 5,
                indexToShow: controller.indexToShow,
                onPressed: () {
                  controller.toggleIndex(5);
                  onPressed!(5);
                },
                weekday: 5,
              ),
            ],
          );
        }));
  }
}
