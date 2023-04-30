import 'package:mobx/mobx.dart';

part 'speakers_home_controller.g.dart';

class SpeakersHomeController = SpeakersHomeControllerBase
    with _$SpeakersHomeController;

abstract class SpeakersHomeControllerBase with Store {
  SpeakersHomeControllerBase();

  @observable
  bool isLoading = false;

  @action
  Future<void> setIsLoading(bool value) async {
    isLoading = value;
  }

  @observable
  int indexToShowPanel1 = 0;

  @action
  Future<void> toggleIndexPanel1(index) async {
    indexToShowPanel1 = index;
  }

  @observable
  int indexToShowPanel2 = 4;

  @action
  Future<void> toggleIndexPanel2(index) async {
    indexToShowPanel2 = index;
  }

  @observable
  int indexToShowPanel3 = 8;

  @action
  Future<void> toggleIndexPanel3(index) async {
    indexToShowPanel3 = index;
  }
}
