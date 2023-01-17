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
  int indexToShow = 0;

  @action
  Future<void> toggleIndex(index) async {
    indexToShow = index;
  }
}
