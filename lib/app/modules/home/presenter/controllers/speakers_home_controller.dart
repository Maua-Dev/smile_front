import 'package:mobx/mobx.dart';

import '../../domain/repositories/speakers_repository_interface.dart';
import '../../infra/models/home_speaker_model.dart';

part 'speakers_home_controller.g.dart';

class SpeakersHomeController = SpeakersHomeControllerBase
    with _$SpeakersHomeController;

abstract class SpeakersHomeControllerBase with Store {
  final SpeakersRepositoryInterface repository;

  SpeakersHomeControllerBase({required this.repository}) {
    getSpeakers();
  }

  @observable
  bool isLoading = false;

  @action
  Future<void> setIsLoading(bool value) async {
    isLoading = value;
  }

  @observable
  List<HomeSpeakerModel> listSpeakers = [];

  @observable
  int indexToShow = 0;

  @action
  Future getSpeakers() async {
    setIsLoading(true);
    listSpeakers = await repository.getSpeakers();
    setIsLoading(false);
  }

  @action
  Future<void> toggleIndex(index) async {
    indexToShow = index;
  }
}
