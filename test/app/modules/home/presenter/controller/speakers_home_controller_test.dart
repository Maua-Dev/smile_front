import 'package:flutter_test/flutter_test.dart';
import 'package:smile_front/app/modules/home/presenter/controllers/speakers_home_controller.dart';

void main() {
  late SpeakersHomeController controller;

  setUpAll(() {
    controller = SpeakersHomeController();
  });

  test('setIsLoading', () {
    controller.setIsLoading(true);
    expect(controller.isLoading, true);
  });

  test('toggleIndex', () {
    controller.toggleIndexPanel1(0);
    expect(controller.indexToShowPanel1, 0);
  });
}
