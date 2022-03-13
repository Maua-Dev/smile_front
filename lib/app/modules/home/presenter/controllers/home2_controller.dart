import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/home/domain/repositories/home2_repository_interface.dart';

import '../../infra/models/home_speaker_model.dart';

part 'home2_controller.g.dart';

class Home2Controller = Home2ControllerBase with _$Home2Controller;

abstract class Home2ControllerBase with Store {
  final SpeakersRepositoryInterface repository;

  Home2ControllerBase(this.repository) {
    getSpeakers();
  }

  @observable
  List<HomeSpeakerModel> speakers = [];

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
