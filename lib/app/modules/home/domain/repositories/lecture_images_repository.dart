import 'package:smile_front/app/modules/home/domain/entities/lecture_images.dart';

abstract class LectureImagesRepository {
  Future<List<LectureImages>> getLectureImages();
}
