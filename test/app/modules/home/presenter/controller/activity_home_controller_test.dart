import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smile_front/app/modules/home/infra/models/home_speaker_model.dart';
import 'package:smile_front/app/modules/home/presenter/controllers/activity_home_controller.dart';
import 'package:smile_front/app/modules/home/usecases/get_speakers.dart';

import 'activity_home_controller_test.mocks.dart';

@GenerateMocks([GetSpeakersInterface])
void main() {
  GetSpeakersInterface getSpeakers = MockGetSpeakersInterface();
  late ActivityHomeController controller;

  var mock = <HomeSpeakerModel>[
    HomeSpeakerModel(name: '', bio: '', linkPhoto: '')
  ];

  setUpAll(() {
    when(getSpeakers()).thenAnswer((_) async => mock);
    controller = ActivityHomeController(getSpeakers);
  });

  test('getSpeakers', () {
    controller.getSpeakers();
    expect(controller.speakers.isNotEmpty, true);
  });
}
