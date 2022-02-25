import 'package:smile_front/app/modules/home/domain/entities/speaker.dart';

abstract class SpeakersRepositoryInterface {
  Future<List<Speaker>> getSpeakers();
}
