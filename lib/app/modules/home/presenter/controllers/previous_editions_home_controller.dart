import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/home/domain/entities/lecture_images.dart';
import 'package:smile_front/app/modules/home/domain/repositories/lecture_images_repository_interface.dart';

part 'previous_editions_home_controller.g.dart';

class PreviousEditionsHomeController = _PreviousEditionsHomeControllerBase
    with _$PreviousEditionsHomeController;

abstract class _PreviousEditionsHomeControllerBase with Store {
  final LectureImagesRepositoryInterface repository;

  _PreviousEditionsHomeControllerBase({required this.repository}) {
    getLectureImages();
  }

  @observable
  List<LectureImages> listLectureImages = [];

  @action
  Future getLectureImages() async {
    listLectureImages = await repository.getLectureImages();
  }
}
