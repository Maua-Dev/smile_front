import 'package:smile_front/app/modules/home/domain/entities/speaker.dart';

abstract class IHome2Repository {
  Future<List<Speaker>> getSpeakers();
}
