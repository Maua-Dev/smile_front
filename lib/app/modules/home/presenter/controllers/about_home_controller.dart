import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/home/domain/repositories/home2_repository_interface.dart';

import '../../infra/models/home_speaker_model.dart';

part 'about_home_controller.g.dart';

class AboutHomeController = AboutHomeControllerBase with _$AboutHomeController;

abstract class AboutHomeControllerBase with Store {
  final SpeakersRepositoryInterface repository;

  AboutHomeControllerBase(this.repository) {
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
