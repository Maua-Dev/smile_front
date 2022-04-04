import '../models/home_speaker_model.dart';

abstract class SpeakersDatasourceInterface {
  Future<List<HomeSpeakerModel>> getRectors();
}
