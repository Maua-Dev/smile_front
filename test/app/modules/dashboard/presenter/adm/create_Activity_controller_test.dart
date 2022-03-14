// ignore_for_file: file_names

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
    expect(test, true);
  });

  test('setType', () {
    var str = ActivityEnum.CAFE_EX_ALUNOS;
    controller.setType(str);
    expect(controller.activityToCreate.type, str);
  });

  test('setTitle', () {
    var str = 'teste';
    controller.setTitle(str);
    expect(controller.activityToCreate.title, str);
  });

  test('setDescription', () {
    var str = 'teste';
    controller.setDescription(str);
    expect(controller.activityToCreate.description, str);
  });

  test('setLocation', () {
    var str = 'teste';
    controller.setLocation(str);
    expect(controller.activityToCreate.location, str);
  });

  test('setDate', () {
    var str = '02/01/2021';
    controller.setDate(str, 0);
    expect(controller.activityToCreate.schedule[0].date!.day, 02);
  });

  test('setHour', () {
    var str = '22:00';
    controller.setHour(str, 0);
    expect(controller.activityToCreate.schedule[0].date!.hour, 22);
  });

  test('setParticipants', () {
    var str = 1;
    controller.setParticipants(str, 0);
    expect(controller.activityToCreate.schedule[0].totalParticipants, str);
  });

  test('addSchedule', () {
    controller.addSchedule();
    expect(controller.activityToCreate.schedule.length, 2);
  });

  test('removeSchedule', () {
    controller.removeSchedule(0);
    expect(controller.activityToCreate.schedule.length, 0);
  });
}
