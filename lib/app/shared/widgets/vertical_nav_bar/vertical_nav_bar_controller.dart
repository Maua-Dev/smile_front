import 'package:mobx/mobx.dart';
part 'vertical_nav_bar_controller.g.dart';

class VerticalNavBarController = VerticalNavBarControllerBase
    with _$VerticalNavBarController;

abstract class VerticalNavBarControllerBase with Store {
  // final ISecureStorage storage;

  // VerticalNavBarControllerBase({
  //   required this.storage,
  // });

  @observable
  int indexToShow = 1;

  // @computed
  // Future<int?> get accessLevel async => await storage.getAccessLevel();

  @action
  Future<void> toggleIndex(index) async {
    indexToShow = index;
  }
}
