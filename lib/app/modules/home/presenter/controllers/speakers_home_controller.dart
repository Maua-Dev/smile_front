import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/home/usecases/get_speakers.dart';
import '../../infra/models/home_speaker_model.dart';

part 'speakers_home_controller.g.dart';

class SpeakersHomeController = SpeakersHomeControllerBase
    with _$SpeakersHomeController;

abstract class SpeakersHomeControllerBase with Store {
  final GetSpeakersInterface getAllSpeakers;

  SpeakersHomeControllerBase({required this.getAllSpeakers}) {
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
    listSpeakers = await getAllSpeakers();
    setIsLoading(false);
  }

  @action
  Future<void> toggleIndex(index) async {
    indexToShow = index;
  }
}
