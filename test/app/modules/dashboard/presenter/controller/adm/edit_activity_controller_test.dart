import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
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
      type: ActivityEnum.ACADEMIA_DE_PROFESSORES,
      title: 'Atividade 1',
      description: '12345',
      schedule: [
        ScheduleActivityModel(
          date: DateTime.fromMillisecondsSinceEpoch(1647216000000, isUtc: true),
          totalParticipants: 20,
        ),
        ScheduleActivityModel(
          date: DateTime.now(),
          totalParticipants: 20,
        )
      ],
      location: 'SALA 123',
      speaker:
          SpeakerActivityModel(bio: '', company: '', name: '', linkPhoto: ''));

  setUpAll(() async {
    await Modular.isModuleReady<AppModule>();
    controller = EditActivityController(
      repository: repository,
      activityModel: activity,
    );
  });

  test('isFilled', () {
    var test = controller.isFilled();
    expect(test, true);
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
    var str = '02/01/2021';
    controller.setDate(str, 0);
    expect(controller.activityToEdit.schedule[0].date!.day, 02);
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

  test('setSpeakerName', () {
    var str = 'teste';
    controller.setSpeakerName(str);
    expect(controller.activityToEdit.speaker.name, str);
  });

  test('setSpeakerBio', () {
    var str = 'teste';
    controller.setSpeakerBio(str);
    expect(controller.activityToEdit.speaker.bio, str);
  });

  test('setSpeakerCompany', () {
    var str = 'teste';
    controller.setSpeakerCompany(str);
    expect(controller.activityToEdit.speaker.company, str);
  });
  test('setSpeakerName', () {
    var str = 'teste';
    controller.setSpeakerName(str);
    expect(controller.activityToEdit.speaker.name, str);
  });

  test('removeSchedule', () {
    controller.removeSchedule(0);
    expect(controller.activityToEdit.schedule.length, 1);
  });

  test('addSchedule', () {
    controller.addSchedule();
    expect(controller.activityToEdit.schedule.length, 2);
  });
}
