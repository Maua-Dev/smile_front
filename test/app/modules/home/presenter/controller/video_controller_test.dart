import 'package:flutter_test/flutter_test.dart';
import 'package:smile_front/app/modules/home/presenter/controllers/video_controller.dart';

void main() {
  late VideoController controller;

  setUpAll(() {
    controller = VideoController();
  });

  test('setIsPlaying', () {
    controller.setIsPlaying();
    expect(controller.isPlaying, true);
  });

  test('setVal', () {
    var val = 0.5;
    controller.setVal(val);
    expect(controller.val, val);
  });
}
