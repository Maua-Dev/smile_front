import 'package:smile_front/app/modules/home/domain/entities/lecture_images.dart';
import 'package:smile_front/app/modules/home/infra/datasources/lecture_images_datasource_interface.dart';
import 'package:smile_front/app/modules/home/utils/mocks/lecture_images_mock.dart';

class LectureImagesDatasourceImpl extends LectureImagesDatasourceInterface {
  @override
  Future<List<LectureImages>> getLectureImages() {
    return Future.value(mockLectureImages);
    // aplicação do DIO
  }
}
