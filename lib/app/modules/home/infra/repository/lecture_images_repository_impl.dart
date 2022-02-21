import 'package:smile_front/app/modules/home/domain/entities/lecture_images.dart';
import 'package:smile_front/app/modules/home/domain/repositories/lecture_images_repository.dart';
import 'package:smile_front/app/modules/home/infra/datasources/lecture_images_datasource.dart';

class LectureImagesRepositoryImpl implements LectureImagesRepositoryInterface {
  final LectureImagesDatasource datasource;

  LectureImagesRepositoryImpl({required this.datasource});

  @override
  Future<List<LectureImages>> getLectureImages() {
    final result = datasource.getLectureImages();
    return Future.value(result);
  }
}
