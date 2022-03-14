import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/home/domain/entities/lecture_images.dart';
import 'package:smile_front/app/modules/home/domain/repositories/lecture_images_repository_interface.dart';

part 'calendar_home_controller.g.dart';

class CalendarHomeController = _CalendarHomeControllerBase
    with _$CalendarHomeController;

abstract class _CalendarHomeControllerBase with Store {
  final LectureImagesRepositoryInterface repository;

  _CalendarHomeControllerBase({required this.repository}) {
    getLectureImages();
  }

  @observable
  List<LectureImages> listLectureImages = [];

  @action
  Future getLectureImages() async {
    listLectureImages = await repository.getLectureImages();
  }
}
