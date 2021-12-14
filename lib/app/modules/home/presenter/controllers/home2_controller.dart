import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/home/domain/entities/speaker_model.dart';
import 'package:smile_front/app/modules/home/domain/repositories/home2_repository_interface.dart';

part 'home2_controller.g.dart';

class Home2Controller = Home2ControllerBase with _$Home2Controller;

abstract class Home2ControllerBase with Store {
  final IHome2Repository repository;

  Home2ControllerBase(this.repository) {
    getSpeakers();
  }

  @observable
  List<SpeakerModel> speakers = [];

  @observable
  int indexToShow = 0;

  @action
  Future<void> getSpeakers() async {
    speakers = await repository.getSpeakers();
  }

  @action
  Future<void> toggleIndex(index) async {
    indexToShow = index;
  }
}
