import 'package:mobx/mobx.dart';

part 'bottom_navigation_bar_controller.g.dart';

class BottomNavigationBarController = BottomNavigationBarControllerBase
    with _$BottomNavigationBarController;

abstract class BottomNavigationBarControllerBase with Store {
  @observable
  int indexToShow = 0;

  @action
  Future<void> toggleIndex(index) async {
    indexToShow = index;
  }
}
