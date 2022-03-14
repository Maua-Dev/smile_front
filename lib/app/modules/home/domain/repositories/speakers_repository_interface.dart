import '../../infra/models/home_speaker_model.dart';

abstract class SpeakersRepositoryInterface {
  Future<List<HomeSpeakerModel>> getSpeakers();
}
