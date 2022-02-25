import 'package:smile_front/app/modules/home/domain/entities/lecture_images.dart';

abstract class LectureImagesDatasourceInterface {
  Future<List<LectureImages>> getLectureImages();
}
