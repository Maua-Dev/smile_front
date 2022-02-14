import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smile_front/app/modules/dashboard/domain/entities/activity.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart';
import 'package:smile_front/app/modules/dashboard/presenter/controllers/dashboard_controller.dart';

import 'dashboard_controller_test.mocks.dart';

@GenerateMocks([ActivitiesRepositoryInterface])
void main() {
  ActivitiesRepositoryInterface repository =
      MockActivitiesRepositoryInterface();
  late DashboardController controller;
  final mockActivities = [
    Activity(
        name: 'ABCDIgitalização no contexto da Indústria 4.0',
        description:
            'Competitividade, modernização, produtividade: a aplicação dos conceitos da indústria 4.0. Breve relato de como a Merc...',
        date: '25/05/2021',
        time: '15:00',
        maxParticipants: 20,
        totalParticipants: 5,
        activityType: ActivityEnum.CURSOS),
    Activity(
        name: 'ABCDigitalização no contexto da Indústria 4.0',
        description:
            'Competitividade, modernização, produtividade: a aplicação dos conceitos da indústria 4.0. Breve relato de como a Merc...',
        date: '25/05/2021',
        time: '15:00',
        maxParticipants: 20,
        totalParticipants: 5,
        activityType: ActivityEnum.CURSOS),
    Activity(
        name: 'Digitalização no contexto da Indústria 4.0',
        description:
            'Competitividade, modernização, produtividade: a aplicação dos conceitos da indústria 4.0. Breve relato de como a Merc...',
        date: '25/05/2021',
        time: '15:00',
        maxParticipants: 20,
        totalParticipants: 5,
        activityType: ActivityEnum.CURSOS),
    Activity(
        name: 'Digitalização no contexto da Indústria 4.0',
        description:
            'Competitividade, modernização, produtividade: a aplicação dos conceitos da indústria 4.0. Breve relato de como a Merc...',
        date: '25/05/2021',
        time: '15:00',
        maxParticipants: 20,
        totalParticipants: 5,
        activityType: ActivityEnum.CURSOS),
    Activity(
        name: 'Digitalização no contexto da Indústria 4.0',
        description:
            'Competitividade, modernização, produtividade: a aplicação dos conceitos da indústria 4.0. Breve relato de como a Merc...',
        date: '25/05/2021',
        time: '15:00',
        maxParticipants: 20,
        totalParticipants: 5,
        activityType: ActivityEnum.CURSOS),
    Activity(
        name: 'Digitalização no contexto da Indústria 4.0',
        description:
            'Competitividade, modernização, produtividade: a aplicação dos conceitos da indústria 4.0. Breve relato de como a Merc...',
        date: '25/05/2021',
        time: '15:00',
        maxParticipants: 20,
        totalParticipants: 5,
        activityType: ActivityEnum.CURSOS),
    Activity(
        name: 'Digitalização no contexto da Indústria 4.0',
        description:
            'Competitividade, modernização, produtividade: a aplicação dos conceitos da indústria 4.0. Breve relato de como a Merc...',
        date: '25/05/2021',
        time: '15:00',
        maxParticipants: 20,
        totalParticipants: 5,
        activityType: ActivityEnum.CURSOS),
    Activity(
        name: 'Digitalização no contexto da Indústria 4.0',
        description:
            'Competitividade, modernização, produtividade: a aplicação dos conceitos da indústria 4.0. Breve relato de como a Merc...',
        date: '18/05/2021',
        time: '15:00',
        maxParticipants: 20,
        totalParticipants: 3,
        activityType: ActivityEnum.CURSOS),
    Activity(
        name: 'Digitalização no contexto da Indústria 4.0',
        description:
            'Competitividade, modernização, produtividade: a aplicação dos conceitos da indústria 4.0. Breve relato de como a Merc...',
        date: '17/05/2021',
        time: '15:00',
        maxParticipants: 20,
        totalParticipants: 2,
        activityType: ActivityEnum.CURSOS),
    Activity(
        name: 'Digitalização no contexto da Indústria 4.0',
        description:
            'Competitividade, modernização, produtividade: a aplicação dos conceitos da indústria 4.0. Breve relato de como a Merc...',
        date: '16/05/2021',
        time: '15:00',
        maxParticipants: 20,
        totalParticipants: 1,
        activityType: ActivityEnum.CURSOS),
  ];

  setUpAll(() {
    when(repository.getActivities(ActivityEnum.CURSOS))
        .thenAnswer((_) async => mockActivities);
    controller = DashboardController(
        activityType: ActivityEnum.CURSOS, repository: repository);
  });

  test('getActivities', () async {
    await controller.getActivities();
    expect(controller.activitiesList, mockActivities);
  });

  test('orderByDate', () {
    controller.orderByDate();
    expect(controller.activitiesList[0].date, '16/05/2021');
  });

  test('orderByParticipants', () {
    controller.orderByParticipants();
    expect(controller.activitiesList[0].totalParticipants, 1);
  });

  test('searchActivityByName', () {
    controller.searchActivityByName('ABCD');
    expect(controller.activitiesList.length, 2);
  });
}
