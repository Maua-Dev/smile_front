import 'package:smile_front/app/modules/home/domain/entities/speaker_model.dart';

abstract class IHome2Repository {
  Future<List<SpeakerModel>> getSpeakers();
}
