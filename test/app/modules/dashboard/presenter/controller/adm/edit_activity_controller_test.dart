import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:mockito/annotations.dart';
import 'package:smile_front/app/app_module.dart';
import 'package:smile_front/app/modules/dashboard/adm_module.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/modality_activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart';
import 'package:smile_front/app/modules/dashboard/domain/usecases/edit_activity.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/schedule_activity_model.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/speaker_activity_model.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/adm/edit_activity_controller.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';

import 'edit_activity_controller_test.mocks.dart';

@GenerateMocks([
  ActivitiesRepositoryInterface,
  EditActivityInterface,
])
void main() {
  initModules([AppModule(), AdmModule()]);

  EditActivityInterface editActivity = MockEditActivityInterface();
  late EditActivityController controller;
  final activity = ActivityModel(
      id: '1',
      modality: DeliveryEnum.online,
      activityCode: 'C01',
      type: ActivityEnum.ACADEMIA_DE_PROFESSORES,
      title: 'Atividade 1',
      description: '12345',
      schedule: ScheduleActivityModel(
        date: DateTime.fromMillisecondsSinceEpoch(1647216000000, isUtc: true),
        totalParticipants: 20,
        location: '',
        acceptSubscription: false,
        isExtensive: false,
      ),
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
      editActivity: editActivity,
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
    controller.setLocation(str);
    expect(controller.activityToEdit.schedule.location, str);
  });

  test('setLink', () {
    var str = 'teste';
    controller.setLink(str);
    expect(controller.activityToEdit.schedule.link, str);
  });

  test('setDate', () {
    var str = DateFormat('dd-MM-yyyy').format(DateTime.now());
    controller.setDate(str);
    expect(controller.activityToEdit.schedule.date!.day, DateTime.now().day);
  });

  test('setHour', () {
    var str = '22:00';
    controller.setHour(str);
    expect(controller.activityToEdit.schedule.date!.hour, 22);
  });

  test('setDuration', () {
    var str = '22:00';
    controller.setDuration(str);
    expect(controller.activityToEdit.schedule.duration!.hour, 22);
  });

  test('setParticipants', () {
    var str = 1;
    controller.setParticipants(str);
    expect(controller.activityToEdit.schedule.totalParticipants, str);
  });

  test('setEnableSubscription', () {
    controller.setEnableSubscription(true);
    expect(controller.activityToEdit.schedule.acceptSubscription, true);
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

  // test('removeSchedule', () {
  //   controller.removeSchedule(0);
  //   expect(controller.activityToEdit.schedule.length, 0);
  // });

  // test('addSchedule', () {
  //   controller.addSchedule();
  //   expect(controller.activityToEdit.schedule.length, 1);
  // });
}
