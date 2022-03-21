// ignore_for_file: file_names

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:smile_front/app/app_module.dart';
import 'package:smile_front/app/modules/dashboard/adm_module.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/adm/create_activity_controller.dart';

import '../../../../login/presenter/controller/login_controller_test.mocks.dart';

@GenerateMocks([ActivitiesRepositoryInterface])
void main() {
  ActivitiesRepositoryInterface repository =
      MockActivitiesRepositoryInterface();

  late CreateActivityController controller;
  initModules([AppModule(), AdmModule()]);

  setUpAll(() async {
    await Modular.isModuleReady<AppModule>();
    controller = CreateActivityController(repository: repository);
  });

  test('isFilled', () {
    var test = controller.isFilled();
    expect(test, false);
  });

  test('setType', () {
    var str = ActivityEnum.CAFE_EX_ALUNOS;
    controller.setType(str);
    expect(controller.activityToCreate.type, str);
  });

  test('setTitle', () {
    var str = 'Titulo';
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

  test('setDuration', () {
    var str = '22:00';
    controller.setDuration(str, 0);
    expect(controller.activityToCreate.schedule[0].duration!.hour, 22);
  });

  test('setParticipants', () {
    var str = 1;
    controller.setParticipants(str, 0);
    expect(controller.activityToCreate.schedule[0].totalParticipants, str);
  });

  test('setSpeakerName', () {
    var str = 'teste';
    controller.setSpeakerName(str);
    expect(controller.activityToCreate.speaker.name, str);
  });

  test('setSpeakerBio', () {
    var str = 'teste';
    controller.setSpeakerBio(str);
    expect(controller.activityToCreate.speaker.bio, str);
  });

  test('setSpeakerCompany', () {
    var str = 'teste';
    controller.setSpeakerCompany(str);
    expect(controller.activityToCreate.speaker.company, str);
  });

  test('removeSchedule', () {
    controller.removeSchedule(0);
    expect(controller.activityToCreate.schedule.length, 0);
  });

  test('addSchedule', () {
    controller.addSchedule();
    expect(controller.activityToCreate.schedule.length, 1);
  });
}
