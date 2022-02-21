import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smile_front/app/modules/home/domain/entities/lecture_images.dart';
import 'package:smile_front/app/modules/home/domain/repositories/lecture_images_repository.dart';
import 'package:smile_front/app/modules/home/presenter/controllers/home4_controller.dart';

import 'home4_controller_test.mocks.dart';

@GenerateMocks([LectureImagesRepositoryInterface])
void main() {
  LectureImagesRepositoryInterface repository =
      MockLectureImagesRepositoryInterface();
  late Home4Controller controller;

  var mock = <LectureImages>[LectureImages(image: '')];

  setUpAll(() {
    when(repository.getLectureImages()).thenAnswer((_) async => mock);
    controller = Home4Controller(repository: repository);
  });

  test('getLectureImages', () {
    controller.getLectureImages();
    expect(controller.listLectureImages.isNotEmpty, true);
  });
}
