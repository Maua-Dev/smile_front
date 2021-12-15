import 'package:mobx/mobx.dart';
import 'package:smile_front/app/modules/home/domain/entities/lecture_images.dart';
import 'package:smile_front/app/modules/home/domain/repositories/lecture_images_repository.dart';

part 'home4_controller.g.dart';

class Home4Controller = _Home4ControllerBase with _$Home4Controller;

abstract class _Home4ControllerBase with Store {
  final LectureImagesRepository repository;

  _Home4ControllerBase({required this.repository}) {
    getLectureImages();
  }

  @observable
  List<LectureImages> listLectureImages = [];

  @action
  Future getLectureImages() async {
    listLectureImages = await repository.getLectureImages();
  }
}
