import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smile_front/app/modules/adm/domain/entities/activity_admin.dart';
import 'package:smile_front/app/modules/adm/domain/usecases/get_admin_activities_usecase.dart';
import 'package:smile_front/app/modules/adm/presenter/states/adm_dashboard_state.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/speaker_activity_model.dart';
import 'package:smile_front/app/modules/adm/presenter/controllers/adm_dashboard_controller.dart';
import 'package:smile_front/app/shared/domain/enum/delivery_enum.dart';
import 'package:smile_front/app/shared/helpers/errors/errors.dart';
import 'adm_dashboard_controller_test.mocks.dart';

@GenerateMocks([
  GetAdminActivitiesUsecaseInterface,
])
void main() {
  GetAdminActivitiesUsecaseInterface getAdminActivitiesUsecase =
      MockGetAdminActivitiesUsecaseInterface();

  late AdmDashboardController controller;

  final mockActivities = <ActivityAdmin>[
    ActivityAdmin(
      activityCode: 'C01',
      type: ActivityEnum.COURSES,
      title:
          'Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01',
      description:
          'Teste de atividade mock Teste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mock',
      speakers: [
        SpeakerActivityModel(
          name: 'Gabriel Godoy',
          bio: 'Caros participantes, este é um teste, aproveitem a atividade',
          company: 'Oracle',
        ),
        SpeakerActivityModel(
          name: 'Gabriel Godoy',
          bio: 'Caros participantes, este é um teste, aproveitem a atividade',
          company: 'Oracle',
        ),
        SpeakerActivityModel(
          name: 'Gabriel Godoy',
          bio: 'Caros participantes, este é um teste, aproveitem a atividade',
          company: 'Oracle',
        ),
      ],
      startDate: DateTime.parse('2022-05-16 13:00'),
      totalSlots: 20,
      duration: 120,
      place: 'H244',
      link: 'https://www.google.com.br',
      acceptingNewEnrollments: false,
      isExtensive: false,
      takenSlots: 0,
      responsibleProfessors: [],
      deliveryEnum: DeliveryEnum.ONLINE,
      stopAcceptingNewEnrollmentsBefore: DateTime.parse('2022-05-16 13:00'),
    ),
    ActivityAdmin(
      activityCode: 'C01',
      type: ActivityEnum.COURSES,
      title:
          'Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01',
      description:
          'Teste de atividade mock Teste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mock',
      speakers: [
        SpeakerActivityModel(
          name: 'Gabriel Godoy',
          bio: 'Caros participantes, este é um teste, aproveitem a atividade',
          company: 'Oracle',
        ),
        SpeakerActivityModel(
          name: 'Gabriel Godoy',
          bio: 'Caros participantes, este é um teste, aproveitem a atividade',
          company: 'Oracle',
        ),
        SpeakerActivityModel(
          name: 'Gabriel Godoy',
          bio: 'Caros participantes, este é um teste, aproveitem a atividade',
          company: 'Oracle',
        ),
      ],
      startDate: DateTime.parse('2022-05-16 13:00'),
      totalSlots: 20,
      duration: 120,
      place: 'H244',
      link: 'https://www.google.com.br',
      acceptingNewEnrollments: false,
      isExtensive: false,
      takenSlots: 0,
      responsibleProfessors: [],
      deliveryEnum: DeliveryEnum.ONLINE,
      stopAcceptingNewEnrollmentsBefore: DateTime.parse('2022-05-16 13:00'),
    ),
    ActivityAdmin(
      activityCode: 'C01',
      type: ActivityEnum.COURSES,
      title:
          'Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01',
      description:
          'Teste de atividade mock Teste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mock',
      speakers: [
        SpeakerActivityModel(
          name: 'Gabriel Godoy',
          bio: 'Caros participantes, este é um teste, aproveitem a atividade',
          company: 'Oracle',
        ),
        SpeakerActivityModel(
          name: 'Gabriel Godoy',
          bio: 'Caros participantes, este é um teste, aproveitem a atividade',
          company: 'Oracle',
        ),
        SpeakerActivityModel(
          name: 'Gabriel Godoy',
          bio: 'Caros participantes, este é um teste, aproveitem a atividade',
          company: 'Oracle',
        ),
      ],
      startDate: DateTime.parse('2022-05-16 13:00'),
      totalSlots: 20,
      duration: 120,
      place: 'H244',
      link: 'https://www.google.com.br',
      acceptingNewEnrollments: false,
      isExtensive: false,
      takenSlots: 0,
      responsibleProfessors: [],
      deliveryEnum: DeliveryEnum.ONLINE,
      stopAcceptingNewEnrollmentsBefore: DateTime.parse('2022-05-16 13:00'),
    ),
    ActivityAdmin(
      activityCode: 'C01',
      type: ActivityEnum.COURSES,
      title:
          'Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01Atividade 01',
      description:
          'Teste de atividade mock Teste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mockTeste de atividade mock',
      speakers: [
        SpeakerActivityModel(
          name: 'Gabriel Godoy',
          bio: 'Caros participantes, este é um teste, aproveitem a atividade',
          company: 'Oracle',
        ),
        SpeakerActivityModel(
          name: 'Gabriel Godoy',
          bio: 'Caros participantes, este é um teste, aproveitem a atividade',
          company: 'Oracle',
        ),
        SpeakerActivityModel(
          name: 'Gabriel Godoy',
          bio: 'Caros participantes, este é um teste, aproveitem a atividade',
          company: 'Oracle',
        ),
      ],
      startDate: DateTime.parse('2022-05-16 13:00'),
      totalSlots: 20,
      duration: 120,
      place: 'H244',
      link: 'https://www.google.com.br',
      acceptingNewEnrollments: false,
      isExtensive: false,
      takenSlots: 0,
      responsibleProfessors: [],
      deliveryEnum: DeliveryEnum.ONLINE,
      stopAcceptingNewEnrollmentsBefore: DateTime.parse('2022-05-16 13:00'),
    ),
  ];

  group('[TEST] - setter', () {
    when(getAdminActivitiesUsecase())
        .thenAnswer((realInvocation) async => right(mockActivities));
    controller = AdmDashboardController(getAdminActivitiesUsecase);
    test('setState', () async {
      controller.setState(SuccessAdmDashboardState(listActivities: []));
      expect(controller.state, isA<SuccessAdmDashboardState>());
    });
  });

  group('[TEST] - getAdminActivities', () {
    test('Success', () async {
      when(getAdminActivitiesUsecase())
          .thenAnswer((realInvocation) async => right(mockActivities));
      controller = AdmDashboardController(getAdminActivitiesUsecase);
      await controller.getAdminActivities();
      expect(controller.state, isA<SuccessAdmDashboardState>());
      expect(controller.activitiesAdminList.isNotEmpty, true);
    });

    test('Error', () async {
      when(getAdminActivitiesUsecase()).thenAnswer(
          (realInvocation) async => left(Failure(message: 'error')));
      controller = AdmDashboardController(getAdminActivitiesUsecase);
      await controller.getAdminActivities();
      expect(controller.state, isA<ErrorAdmDashboardState>());
      expect(controller.activitiesAdminList.isEmpty, true);
    });
  });
}
