import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smile_front/app/modules/home/domain/entities/rectors.dart';
import 'package:smile_front/app/modules/home/domain/repositories/rectors_repository_interface.dart';
import 'package:smile_front/app/modules/home/presenter/controllers/activity_home_controller.dart';

import 'activity_home_controller_test.mocks.dart';

@GenerateMocks([RectorsRepositoryInterface])
void main() {
  RectorsRepositoryInterface repository = MockRectorsRepositoryInterface();
  late ActivityHomeController controller;

  var mock = <Rectors>[Rectors(image: '', name: '', role: '', text: '')];

  setUpAll(() {
    when(repository.getRectors()).thenAnswer((_) async => mock);
    controller = ActivityHomeController(repository: repository);
  });

  test('getRectors', () {
    controller.getRectors();
    expect(controller.listRectors.isNotEmpty, true);
  });
}
