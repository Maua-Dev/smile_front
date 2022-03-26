import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/home/domain/repositories/speakers_repository_interface.dart';

import '../../infra/models/home_speaker_model.dart';

part 'activity_home_controller.g.dart';

class ActivityHomeController = ActivityHomeControllerBase
    with _$ActivityHomeController;

abstract class ActivityHomeControllerBase with Store {
  final SpeakersRepositoryInterface repository;

  ActivityHomeControllerBase(this.repository) {
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
