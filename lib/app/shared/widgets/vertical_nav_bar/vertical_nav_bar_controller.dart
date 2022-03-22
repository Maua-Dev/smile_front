import 'package:mobx/mobx.dart';

part 'vertical_nav_bar_controller.g.dart';

class VerticalNavBarController = VerticalNavBarControllerBase
    with _$VerticalNavBarController;

abstract class VerticalNavBarControllerBase with Store {
  @observable
  int indexToShow = 0;

  @action
  Future<void> toggleIndex(index) async {
    indexToShow = index;
  }
}
