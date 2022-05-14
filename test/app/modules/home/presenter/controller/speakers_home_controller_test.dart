import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smile_front/app/modules/home/domain/repositories/speakers_repository_interface.dart';
import 'package:smile_front/app/modules/home/infra/models/home_speaker_model.dart';
import 'package:smile_front/app/modules/home/presenter/controllers/speakers_home_controller.dart';

import 'speakers_home_controller_test.mocks.dart';

@GenerateMocks([SpeakersRepositoryInterface])
void main() {
  SpeakersRepositoryInterface repository = MockSpeakersRepositoryInterface();
  late SpeakersHomeController controller;

  var mock = <HomeSpeakerModel>[
    HomeSpeakerModel(name: '', bio: '', linkPhoto: '')
  ];

  setUpAll(() {
    when(repository.getSpeakers()).thenAnswer((_) async => mock);
    controller = SpeakersHomeController(repository: repository);
  });

  test('setIsLoading', () {
    controller.setIsLoading(true);
    expect(controller.isLoading, true);
  });

  test('getSpeakers', () {
    controller.getSpeakers();
    expect(controller.listSpeakers.isNotEmpty, true);
  });

  test('toggleIndex', () {
    controller.toggleIndex(0);
    expect(controller.indexToShow, 0);
  });
}
