import 'package:mobx/mobx.dart';

part 'video_controller.g.dart';

class VideoController = VideoControllerBase with _$VideoController;

abstract class VideoControllerBase with Store {
  @observable
  bool isPlaying = false;

  @observable
  double val = 1.0;

  @action
  void setIsPlaying() {
    isPlaying = !isPlaying;
  }

  @action
  void setVal(double value) {
    val = value;
  }
}
