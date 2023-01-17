import 'package:smile_front/app/modules/home/domain/repositories/speakers_repository_interface.dart';

import '../../utils/mocks/speakers_mock.dart';
import '../models/home_speaker_model.dart';

class SpeakersRepositoryImpl implements SpeakersRepositoryInterface {
  @override
  Future<List<HomeSpeakerModel>> getSpeakers() async {
    return await Future.value(speakersMock);
  }
}
