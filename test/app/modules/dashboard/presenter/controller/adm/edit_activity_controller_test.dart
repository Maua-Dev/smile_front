import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:mockito/annotations.dart';
import 'package:smile_front/app/app_module.dart';
import 'package:smile_front/app/modules/dashboard/adm_module.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/schedule_activity_model.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/speaker_activity_model.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/adm/edit_activity_controller.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';

import '../../../../login/presenter/controller/login_controller_test.mocks.dart';

@GenerateMocks([ActivitiesRepositoryInterface])
void main() {
  initModules([AppModule(), AdmModule()]);
  ActivitiesRepositoryInterface repository =
      MockActivitiesRepositoryInterface();
  late EditActivityController controller;
  final activity = ActivityModel(
      id: '1',
      activityCode: 'C01',
      type: ActivityEnum.ACADEMIA_DE_PROFESSORES,
      title: 'Atividade 1',
      description: '12345',
      schedule: [
        ScheduleActivityModel(
          date: DateTime.fromMillisecondsSinceEpoch(1647216000000, isUtc: true),
          totalParticipants: 20,
          location: '',
          acceptSubscription: false,
        ),
      ],
      speakers: [
        SpeakerActivityModel(
          bio: '',
          company: '',
          name: '',
        )
      ]);

  setUpAll(() async {
    await Modular.isModuleReady<AppModule>();
    controller = EditActivityController(
      repository: repository,
      activityModel: activity,
    );
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
    var str = ActivityEnum.CAFE_EX_ALUNOS;
    controller.setType(str);
    expect(controller.activityToEdit.type, str);
  });

  test('setActivityCode', () {
    var str = '123';
    controller.setActivityCode(str);
    expect(controller.activityToEdit.activityCode, str);
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
    controller.setLocation(str, 0);
    expect(controller.activityToEdit.schedule[0].location, str);
  });

  test('setLink', () {
    var str = 'teste';
    controller.setLink(str, 0);
    expect(controller.activityToEdit.schedule[0].link, str);
  });

  test('setDate', () {
    var str = DateFormat('dd-MM-yyyy').format(DateTime.now());
    controller.setDate(str, 0);
    expect(controller.activityToEdit.schedule[0].date!.day, DateTime.now().day);
  });

  test('setHour', () {
    var str = '22:00';
    controller.setHour(str, 0);
    expect(controller.activityToEdit.schedule[0].date!.hour, 22);
  });

  test('setDuration', () {
    var str = '22:00';
    controller.setDuration(str, 0);
    expect(controller.activityToEdit.schedule[0].duration!.hour, 22);
  });

  test('setParticipants', () {
    var str = 1;
    controller.setParticipants(str, 0);
    expect(controller.activityToEdit.schedule[0].totalParticipants, str);
  });

  test('setEnableSubscription', () {
    controller.setEnableSubscription(true, 0);
    expect(controller.activityToEdit.schedule[0].acceptSubscription, true);
  });

  test('setSpeakerName', () {
    var str = 'teste';
    controller.setSpeakerName(str, 0);
    expect(controller.activityToEdit.speakers[0].name, str);
  });

  test('setSpeakerBio', () {
    var str = 'teste';
    controller.setSpeakerBio(str, 0);
    expect(controller.activityToEdit.speakers[0].bio, str);
  });

  test('setSpeakerCompany', () {
    var str = 'teste';
    controller.setSpeakerCompany(str, 0);
    expect(controller.activityToEdit.speakers[0].company, str);
  });

  test('removeSchedule', () {
    controller.removeSchedule(0);
    expect(controller.activityToEdit.schedule.length, 0);
  });

  test('addSchedule', () {
    controller.addSchedule();
    expect(controller.activityToEdit.schedule.length, 1);
  });
}
