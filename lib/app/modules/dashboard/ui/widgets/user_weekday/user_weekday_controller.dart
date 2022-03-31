import 'package:mobx/mobx.dart';

part 'user_weekday_controller.g.dart';

class UserWeekdayController = UserWeekdayControllerBase
    with _$UserWeekdayController;

abstract class UserWeekdayControllerBase with Store {
  @observable
  int indexToShow = 0;

  @action
  Future<void> toggleIndex(index) async {
    indexToShow = index;
  }
}
