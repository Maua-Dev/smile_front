import 'package:smile_front/app/modules/home/domain/entities/lecture_images.dart';

abstract class LectureImagesRepositoryInterface {
  Future<List<LectureImages>> getLectureImages();
}
