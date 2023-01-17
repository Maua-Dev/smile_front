import '../domain/repositories/speakers_repository_interface.dart';
import '../infra/models/home_speaker_model.dart';

abstract class GetSpeakersInterface {
  Future<List<HomeSpeakerModel>> call();
}

class GetSpeakers implements GetSpeakersInterface {
  final SpeakersRepositoryInterface repository;

  GetSpeakers({required this.repository});

  @override
  Future<List<HomeSpeakerModel>> call() {
    return repository.getSpeakers();
  }
}
