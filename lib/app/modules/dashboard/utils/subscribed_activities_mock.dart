import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/schedule_activity_model.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/speaker_activity_model.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';

var subscribedActivities = <ActivityModel>[
  ActivityModel(
    id: '0',
    type: ActivityEnum.CURSOS,
    title: 'Atividade 01',
    description: 'Teste de atividade mock',
    location: 'H244',
    speaker: SpeakerActivityModel(
      name: 'Gabriel Godoy',
      bio: 'Qualquer',
      company: 'Oracle',
      linkPhoto: 'http://',
    ),
    schedule: <ScheduleActivityModel>[
      ScheduleActivityModel(
        date: DateTime.utc(2022, 03, 16, 13),
        totalParticipants: 20,
      ),
    ],
  ),
  ActivityModel(
    id: '1',
    type: ActivityEnum.CURSOS,
    title: 'Atividade 02',
    description: 'Teste de atividade mock',
    location: 'H244',
    speaker: SpeakerActivityModel(
      name: 'Gabriel Godoy',
      bio: 'Qualquer',
      company: 'Oracle',
      linkPhoto: 'http://',
    ),
    schedule: <ScheduleActivityModel>[
      ScheduleActivityModel(
        date: DateTime.utc(2022, 03, 17, 13),
        totalParticipants: 20,
      ),
    ],
  ),
  ActivityModel(
    id: '2',
    type: ActivityEnum.CURSOS,
    title: 'Atividade 03',
    description: 'Teste de atividade mock',
    location: 'H244',
    speaker: SpeakerActivityModel(
      name: 'Gabriel Godoy',
      bio: 'Qualquer',
      company: 'Oracle',
      linkPhoto: 'http://',
    ),
    schedule: <ScheduleActivityModel>[
      ScheduleActivityModel(
        date: DateTime.utc(2022, 03, 18, 13),
        totalParticipants: 20,
      ),
    ],
  ),
];
