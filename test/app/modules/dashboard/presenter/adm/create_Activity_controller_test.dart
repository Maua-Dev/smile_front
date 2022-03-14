// ignore: file_names
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/adm/create_activity_controller.dart';

import '../controller/user_dashboard_controller_test.mocks.dart';

@GenerateMocks([ActivitiesRepositoryInterface])
void main() {
  ActivitiesRepositoryInterface repository =
      MockActivitiesRepositoryInterface();
  late CreateActivityController controller;

  setUpAll(() {
    controller = CreateActivityController(repository: repository);
  });

  test('isFilled', () {
    var test = controller.isFilled();
    expect(test, false);
  });

  test('setType', () {
    var str = ActivityEnum.CAFE_EX_ALUNOS;
    controller.setType(str);
    expect(controller.activityToEdit.type, str);
  });

  test('setTitle', () {
    var str = 'teste';
    controller.setTitle(str);
    expect(controller.activityToEdit.title, str);
  });

  test('setDescription', () {
    var str = 'teste';
    controller.setDescription(str);
    expect(controller.activityToEdit.description, str);
  });

  test('setLocation', () {
    var str = 'teste';
    controller.setLocation(str);
    expect(controller.activityToEdit.location, str);
  });

  test('setDate', () {
    var str = '2021-01-02';
    controller.setDate(str, 0);
    expect(controller.activityToEdit.schedule[0].date, DateTime.parse(str));
  });
}
