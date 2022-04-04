import 'package:mobx/mobx.dart';

part 'bottom_navigation_bar_controller.g.dart';

class NavigationBarController = BottomNavigationBarControllerBase
    with _$NavigationBarController;

abstract class BottomNavigationBarControllerBase with Store {
  @observable
  int indexToShow = 1;

  @action
  Future<void> toggleIndex(index) async {
    indexToShow = index;
  }
}
