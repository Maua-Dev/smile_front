// ignore_for_file: file_names

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:mockito/annotations.dart';
import 'package:smile_front/app/app_module.dart';
import 'package:smile_front/app/modules/dashboard/adm_module.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/create_activity.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/adm/create_activity_controller.dart';

import 'create_Activity_controller_test.mocks.dart';

@GenerateMocks([CreateActivityInterface])
void main() {
  CreateActivityInterface createActivity = MockCreateActivityInterface();

  late CreateActivityController controller;
  initModules([AppModule(), AdmModule()]);

  setUpAll(() async {
    await Modular.isModuleReady<AppModule>();
    controller = CreateActivityController(createActivity: createActivity);
  });

  test('setIsLoading', () {
    controller.setIsLoading(true);
    expect(controller.isLoading, true);
  });

  test('isFilled', () {
    var test = controller.isFilled();
    expect(test, false);
  });

  test('setType', () {
    var str = ActivityEnum.ALUMNI_CAFE;
    controller.setType(str);
    expect(controller.activityToCreate.type, str);
  });

  test('setActivityCode', () {
    var str = '123';
    controller.setActivityCode(str);
    expect(controller.activityToCreate.activityCode, str);
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
    controller.setLocation(str, 0);
    expect(controller.activityToCreate.place, str);
  });

  test('setLink', () {
    var str = 'teste';
    controller.setLink(str, 0);
    expect(controller.activityToCreate.link, str);
  });

  test('setDate', () {
    var str = DateFormat('dd-MM-yyyy').format(DateTime.now());
    controller.setDate(str, 0);
    expect(
        controller.activityToCreate.startDate!,
        DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day));
  });

  test('setHour', () {
    var str = '22:00';
    controller.setHour(str, 0);
    expect(controller.activityToCreate.startDate!.hour, 22);
  });

  test('setDuration', () {
    var str = '22:00';
    controller.setDuration(str, 0);
    expect(controller.activityToCreate.duration, 22);
  });

  test('setParticipants', () {
    var str = 1;
    controller.setParticipants(str, 0);
    expect(controller.activityToCreate.totalSlots, str);
  });

  test('setEnableSubscription', () {
    controller.setEnableSubscription(true, 0);
    expect(controller.activityToCreate.acceptingNewEnrollments, true);
  });

  test('setSpeakerName', () {
    var str = 'teste';
    controller.setSpeakerName(str, 0);
    expect(controller.activityToCreate.speakers[0].name, str);
  });

  test('setSpeakerBio', () {
    var str = 'teste';
    controller.setSpeakerBio(str, 0);
    expect(controller.activityToCreate.speakers[0].bio, str);
  });

  test('setSpeakerCompany', () {
    var str = 'teste';
    controller.setSpeakerCompany(str, 0);
    expect(controller.activityToCreate.speakers[0].company, str);
  });

  // test('removeSchedule', () {
  //   controller.removeSchedule(0);
  //   expect(controller.activityToCreate.schedule.length, 0);
  // });

  // test('addSchedule', () {
  //   controller.addSchedule();
  //   expect(controller.activityToCreate.schedule.length, 1);
  // });

  test('removeSpeaker', () {
    controller.removeSpeaker(0);
    expect(controller.activityToCreate.speakers.length, 0);
  });

  test('addSpeaker', () {
    controller.addSpeaker();
    expect(controller.activityToCreate.speakers.length, 1);
  });
}
