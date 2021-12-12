import 'package:smile_front/app/modules/home/ui/pages/home2/models/speaker_model.dart';

abstract class IHome2Repository {
  Future<List<SpeakerModel>> getSpeakers();
}
