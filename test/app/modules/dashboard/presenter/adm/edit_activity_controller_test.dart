import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/schedule_activity_model.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/speaker_activity_model.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/adm/edit_activity_controller.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';

import '../controller/user_dashboard_controller_test.mocks.dart';

@GenerateMocks([ActivitiesRepositoryInterface])
void main() {
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
          date: DateTime.now(),
          hour: DateTime.now(),
          totalParticipants: 20,
        ),
        ScheduleActivityModel(
          date: DateTime.now(),
          hour: DateTime.now(),
          totalParticipants: 20,
        )
      ],
      location: 'SALA 123',
      speaker:
          SpeakerActivityModel(bio: '', company: '', name: '', linkPhoto: ''));

  setUpAll(() {
    controller =
        EditActivityController(repository: repository, activity: activity);
  });

  test('isFilled', () {});

  test('editActivity', () {});

  test('deleteActivity', () {});

  test('setType', () {});

  test('setTitle', () {});

  test('setDescription', () {});

  test('setLocation', () {});

  test('setDate', () {
    var strDt = '2021-01-02';
    controller.setDate(strDt, 0);
    expect(controller.activityToEdit.schedule[0].date, DateTime.parse(strDt));
  });
}
