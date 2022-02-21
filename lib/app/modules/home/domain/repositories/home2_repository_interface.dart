import 'package:smile_front/app/modules/home/domain/entities/speaker.dart';

abstract class Home2RepositoryInterface {
  Future<List<Speaker>> getSpeakers();
}
