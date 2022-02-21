import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smile_front/app/modules/home/domain/entities/rectors.dart';
import 'package:smile_front/app/modules/home/domain/repositories/rectors_repository_interface.dart';
import 'package:smile_front/app/modules/home/presenter/controllers/home3_controller.dart';

import 'home3_controller_test.mocks.dart';

@GenerateMocks([RectorsRepositoryInterface])
void main() {
  RectorsRepositoryInterface repository = MockRectorsRepositoryInterface();
  late Home3Controller controller;

  var mock = <Rectors>[Rectors(image: '', name: '', role: '', text: '')];

  setUpAll(() {
    when(repository.getRectors()).thenAnswer((_) async => mock);
    controller = Home3Controller(repository: repository);
  });

  test('getRectors', () {
    controller.getRectors();
    expect(controller.listRectors.isNotEmpty, true);
  });
}
