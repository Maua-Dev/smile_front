import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smile_front/app/modules/home/domain/repositories/home2_repository_interface.dart';
import 'package:smile_front/app/modules/home/infra/models/home_speaker_model.dart';
import 'package:smile_front/app/modules/home/presenter/controllers/home2_controller.dart';

import 'home2_controller_test.mocks.dart';

@GenerateMocks([SpeakersRepositoryInterface])
void main() {
  SpeakersRepositoryInterface repository = MockSpeakersRepositoryInterface();
  late Home2Controller controller;

  var mock = <HomeSpeakerModel>[
    HomeSpeakerModel(name: '', bio: '', date: '', linkPhoto: '')
  ];

  setUpAll(() {
    when(repository.getSpeakers()).thenAnswer((_) async => mock);
    controller = Home2Controller(repository);
  });

  test('getSpeakers', () {
    controller.getSpeakers();
    expect(controller.speakers.isNotEmpty, true);
  });

  test('toggleIndex', () {
    controller.toggleIndex(10);
    expect(controller.indexToShow, 10);
  });
}
