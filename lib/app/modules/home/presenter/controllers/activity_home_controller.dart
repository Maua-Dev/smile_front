import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/home/usecases/get_speakers.dart';

import '../../infra/models/home_speaker_model.dart';

part 'activity_home_controller.g.dart';

class ActivityHomeController = ActivityHomeControllerBase
    with _$ActivityHomeController;

abstract class ActivityHomeControllerBase with Store {
  final GetSpeakersInterface getSpeakers;

  ActivityHomeControllerBase(this.getSpeakers) {
    getUserSpeakers();
  }

  @observable
  List<HomeSpeakerModel> speakers = [];

  @action
  Future<void> getUserSpeakers() async {
    speakers = await getSpeakers();
  }
}
