import 'package:intl/intl.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/schedule_activity_model.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/speaker_activity_model.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';

var subscribedActivities = <ActivityModel>[
  ActivityModel(
    id: '0',
    activityCode: 'C01',
    type: ActivityEnum.CURSOS,
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
    schedule: <ScheduleActivityModel>[
      ScheduleActivityModel(
          date: DateTime.parse('2022-05-16 13:00'),
          totalParticipants: 20,
          duration: DateFormat('HH:mm').parse('01:00'),
          location: 'H244',
          link: 'https://www.google.com.br',
          acceptSubscription: false),
      ScheduleActivityModel(
        date: DateTime.parse('2022-05-17 13:00'),
        totalParticipants: 30,
        duration: DateFormat('HH:mm').parse('01:00'),
        location: 'H244',
        link: 'https://',
        acceptSubscription: false,
      ),
    ],
  ),
];
