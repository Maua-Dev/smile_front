import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/schedule_activity_model.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/speaker_activity_model.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';

var listActivitiesMock = [
  ActivityModel(
      id: '',
      type: ActivityEnum.PALESTRAS,
      title: 'Atividade 01',
      description:
          'Competitividade, modernização, produtividade: a aplicação dos conceitos da indústria 4.0. Breve relato de como a Merc...',
      schedule: [
        ScheduleActivityModel(
            date: DateTime(2022, 3, 14),
            hour: DateTime(2022, 3, 14),
            totalParticipants: 20),
        ScheduleActivityModel(
            date: DateTime(2022, 3, 15),
            hour: DateTime(2022, 3, 15),
            totalParticipants: 20),
      ],
      speaker: SpeakerActivityModel(
        name: 'José Carlos',
        bio: 'Qualquer bio',
        company: 'Sim',
        linkPhoto: '',
      )),
  ActivityModel(
      id: '',
      type: ActivityEnum.CURSOS,
      title: 'Atividade 02',
      description:
          'Competitividade, modernização, produtividade: a aplicação dos conceitos da indústria 4.0. Breve relato de como a Merc...',
      schedule: [
        ScheduleActivityModel(
            date: DateTime(2022, 3, 16),
            hour: DateTime(2022, 3, 16),
            totalParticipants: 20),
        ScheduleActivityModel(
            date: DateTime(2022, 3, 14),
            hour: DateTime(2022, 3, 14),
            totalParticipants: 20),
      ],
      speaker: SpeakerActivityModel(
        name: 'José Carlos',
        bio: 'Qualquer bio',
        company: 'Sim',
        linkPhoto: '',
      )),
  ActivityModel(
      id: '',
      type: ActivityEnum.HACKATONS,
      title: 'Atividade 03',
      description:
          'Competitividade, modernização, produtividade: a aplicação dos conceitos da indústria 4.0. Breve relato de como a Merc...',
      schedule: [
        ScheduleActivityModel(
            date: DateTime(2022, 3, 17),
            hour: DateTime(2022, 3, 17),
            totalParticipants: 20),
        ScheduleActivityModel(
            date: DateTime(2022, 3, 17),
            hour: DateTime(2022, 3, 17),
            totalParticipants: 20),
      ],
      speaker: SpeakerActivityModel(
        name: 'José Carlos',
        bio: 'Qualquer bio',
        company: 'Sim',
        linkPhoto: '',
      )),
  ActivityModel(
      id: '',
      type: ActivityEnum.HACKATONS,
      title: 'Atividade 04',
      description:
          'Competitividade, modernização, produtividade: a aplicação dos conceitos da indústria 4.0. Breve relato de como a Merc...',
      schedule: [
        ScheduleActivityModel(
            date: DateTime(2022, 3, 17),
            hour: DateTime(2022, 3, 17),
            totalParticipants: 20),
        ScheduleActivityModel(
            date: DateTime(2022, 3, 17),
            hour: DateTime(2022, 3, 17),
            totalParticipants: 20),
      ],
      speaker: SpeakerActivityModel(
        name: 'José Carlos',
        bio: 'Qualquer bio',
        company: 'Sim',
        linkPhoto: '',
      )),
  ActivityModel(
      id: '',
      type: ActivityEnum.HACKATONS,
      title: 'Atividade 05',
      description:
          'Competitividade, modernização, produtividade: a aplicação dos conceitos da indústria 4.0. Breve relato de como a Merc...',
      schedule: [
        ScheduleActivityModel(
            date: DateTime(2022, 3, 18),
            hour: DateTime(2022, 3, 18),
            totalParticipants: 20),
        ScheduleActivityModel(
            date: DateTime(2022, 3, 18),
            hour: DateTime(2022, 3, 18),
            totalParticipants: 20),
      ],
      speaker: SpeakerActivityModel(
        name: 'José Carlos',
        bio: 'Qualquer bio',
        company: 'Sim',
        linkPhoto: '',
      )),
  ActivityModel(
      id: '',
      type: ActivityEnum.HACKATONS,
      title: 'Atividade 06',
      description:
          'Competitividade, modernização, produtividade: a aplicação dos conceitos da indústria 4.0. Breve relato de como a Merc...',
      schedule: [
        ScheduleActivityModel(
            date: DateTime(2022, 3, 17),
            hour: DateTime(2022, 3, 17),
            totalParticipants: 20),
        ScheduleActivityModel(
            date: DateTime(2022, 3, 17),
            hour: DateTime(2022, 3, 17),
            totalParticipants: 20),
      ],
      speaker: SpeakerActivityModel(
        name: 'José Carlos',
        bio: 'Qualquer bio',
        company: 'Sim',
        linkPhoto: '',
      )),
  ActivityModel(
      id: '',
      type: ActivityEnum.HACKATONS,
      title: 'Atividade 07',
      description:
          'Competitividade, modernização, produtividade: a aplicação dos conceitos da indústria 4.0. Breve relato de como a Merc...',
      schedule: [
        ScheduleActivityModel(
            date: DateTime(2022, 3, 17),
            hour: DateTime(2022, 3, 17),
            totalParticipants: 20),
        ScheduleActivityModel(
            date: DateTime(2022, 3, 18),
            hour: DateTime(2022, 3, 18),
            totalParticipants: 20),
      ],
      speaker: SpeakerActivityModel(
        name: 'José Carlos',
        bio: 'Qualquer bio',
        company: 'Sim',
        linkPhoto: '',
      )),
  ActivityModel(
      id: '',
      type: ActivityEnum.HACKATONS,
      title: 'Atividade 08',
      description:
          'Competitividade, modernização, produtividade: a aplicação dos conceitos da indústria 4.0. Breve relato de como a Merc...',
      schedule: [
        ScheduleActivityModel(
            date: DateTime(2022, 3, 14),
            hour: DateTime(2022, 3, 14),
            totalParticipants: 20),
        ScheduleActivityModel(
            date: DateTime(2022, 3, 16),
            hour: DateTime(2022, 3, 16),
            totalParticipants: 20),
      ],
      speaker: SpeakerActivityModel(
        name: 'José Carlos',
        bio: 'Qualquer bio',
        company: 'Sim',
        linkPhoto: '',
      )),
  ActivityModel(
      id: '',
      type: ActivityEnum.CURSOS,
      title: 'Atividade 09',
      description:
          'Competitividade, modernização, produtividade: a aplicação dos conceitos da indústria 4.0. Breve relato de como a Merc...',
      schedule: [
        ScheduleActivityModel(
            date: DateTime(2022, 3, 14),
            hour: DateTime(2022, 3, 14),
            totalParticipants: 20),
        ScheduleActivityModel(
            date: DateTime(2022, 3, 17),
            hour: DateTime(2022, 3, 17),
            totalParticipants: 20),
      ],
      speaker: SpeakerActivityModel(
        name: 'José Carlos',
        bio: 'Qualquer bio',
        company: 'Sim',
        linkPhoto: '',
      )),
  ActivityModel(
      id: '',
      type: ActivityEnum.CAFE_EX_ALUNOS,
      title: 'Atividade 10',
      description:
          'Competitividade, modernização, produtividade: a aplicação dos conceitos da indústria 4.0. Breve relato de como a Merc...',
      schedule: [
        ScheduleActivityModel(
            date: DateTime(2022, 3, 17),
            hour: DateTime(2022, 3, 17),
            totalParticipants: 20),
        ScheduleActivityModel(
            date: DateTime(2022, 3, 15),
            hour: DateTime(2022, 3, 15),
            totalParticipants: 20),
      ],
      speaker: SpeakerActivityModel(
        name: 'José Carlos',
        bio: 'Qualquer bio',
        company: 'Sim',
        linkPhoto: '',
      )),
  ActivityModel(
      id: '',
      type: ActivityEnum.CURSOS,
      title: 'Atividade 11',
      description:
          'Competitividade, modernização, produtividade: a aplicação dos conceitos da indústria 4.0. Breve relato de como a Merc...',
      schedule: [
        ScheduleActivityModel(
            date: DateTime(2022, 3, 18),
            hour: DateTime(2022, 3, 18),
            totalParticipants: 20),
        ScheduleActivityModel(
            date: DateTime(2022, 3, 17),
            hour: DateTime(2022, 3, 17),
            totalParticipants: 20),
        ScheduleActivityModel(
            date: DateTime(2022, 3, 18),
            hour: DateTime(2022, 3, 18),
            totalParticipants: 20),
      ],
      speaker: SpeakerActivityModel(
        name: 'José Carlos',
        bio: 'Qualquer bio',
        company: 'Sim',
        linkPhoto: '',
      )),
  ActivityModel(
      id: '',
      type: ActivityEnum.CAFE_EX_ALUNOS,
      title: 'Atividade 12',
      description:
          'Competitividade, modernização, produtividade: a aplicação dos conceitos da indústria 4.0. Breve relato de como a Merc...',
      schedule: [
        ScheduleActivityModel(
            date: DateTime(2022, 3, 15),
            hour: DateTime(2022, 3, 15),
            totalParticipants: 20),
      ],
      speaker: SpeakerActivityModel(
        name: 'José Carlos',
        bio: 'Qualquer bio',
        company: 'Sim',
        linkPhoto: '',
      )),
  ActivityModel(
      id: '',
      type: ActivityEnum.CURSOS,
      title: 'Atividade 13',
      description:
          'Competitividade, modernização, produtividade: a aplicação dos conceitos da indústria 4.0. Breve relato de como a Merc...',
      schedule: [
        ScheduleActivityModel(
            date: DateTime(2022, 3, 15),
            hour: DateTime(2022, 3, 15),
            totalParticipants: 20),
      ],
      speaker: SpeakerActivityModel(
        name: 'José Carlos',
        bio: 'Qualquer bio',
        company: 'Sim',
        linkPhoto: '',
      )),
  ActivityModel(
      id: '',
      type: ActivityEnum.CURSOS,
      title: 'Atividade 14',
      description:
          'Competitividade, modernização, produtividade: a aplicação dos conceitos da indústria 4.0. Breve relato de como a Merc...',
      schedule: [
        ScheduleActivityModel(
            date: DateTime(2022, 3, 15),
            hour: DateTime(2022, 3, 15),
            totalParticipants: 20),
        ScheduleActivityModel(
            date: DateTime(2022, 3, 15),
            hour: DateTime(2022, 3, 15),
            totalParticipants: 20),
      ],
      speaker: SpeakerActivityModel(
        name: 'José Carlos',
        bio: 'Qualquer bio',
        company: 'Sim',
        linkPhoto: '',
      )),
  ActivityModel(
      id: '',
      type: ActivityEnum.ACADEMIA_DE_PROFESSORES,
      title: 'Atividade 15',
      description:
          'Competitividade, modernização, produtividade: a aplicação dos conceitos da indústria 4.0. Breve relato de como a Merc...',
      schedule: [
        ScheduleActivityModel(
            date: DateTime(2022, 3, 15),
            hour: DateTime(2022, 3, 15),
            totalParticipants: 20),
        ScheduleActivityModel(
            date: DateTime(2022, 3, 15),
            hour: DateTime(2022, 3, 15),
            totalParticipants: 20),
      ],
      speaker: SpeakerActivityModel(
        name: 'José Carlos',
        bio: 'Qualquer bio',
        company: 'Sim',
        linkPhoto: '',
      )),
  ActivityModel(
      id: '',
      type: ActivityEnum.PALESTRAS,
      title: 'Atividade 16',
      description:
          'Competitividade, modernização, produtividade: a aplicação dos conceitos da indústria 4.0. Breve relato de como a Merc...',
      schedule: [
        ScheduleActivityModel(
            date: DateTime(2022, 3, 15),
            hour: DateTime(2022, 3, 15),
            totalParticipants: 20),
        ScheduleActivityModel(
            date: DateTime(2022, 3, 15),
            hour: DateTime(2022, 3, 15),
            totalParticipants: 20),
      ],
      speaker: SpeakerActivityModel(
        name: 'José Carlos',
        bio: 'Qualquer bio',
        company: 'Sim',
        linkPhoto: '',
      )),
  ActivityModel(
      id: '',
      type: ActivityEnum.CURSOS,
      title: 'Atividade 17',
      description:
          'Competitividade, modernização, produtividade: a aplicação dos conceitos da indústria 4.0. Breve relato de como a Merc...',
      schedule: [
        ScheduleActivityModel(
            date: DateTime(2022, 3, 15),
            hour: DateTime(2022, 3, 15),
            totalParticipants: 20),
        ScheduleActivityModel(
            date: DateTime(2022, 3, 15),
            hour: DateTime(2022, 3, 15),
            totalParticipants: 20),
      ],
      speaker: SpeakerActivityModel(
        name: 'José Carlos',
        bio: 'Qualquer bio',
        company: 'Sim',
        linkPhoto: '',
      )),
  ActivityModel(
      id: '',
      type: ActivityEnum.PALESTRAS,
      title: 'Atividade 18',
      description:
          'Competitividade, modernização, produtividade: a aplicação dos conceitos da indústria 4.0. Breve relato de como a Merc...',
      schedule: [
        ScheduleActivityModel(
            date: DateTime(2022, 3, 15),
            hour: DateTime(2022, 3, 15),
            totalParticipants: 20),
        ScheduleActivityModel(
            date: DateTime(2022, 3, 15),
            hour: DateTime(2022, 3, 15),
            totalParticipants: 20),
      ],
      speaker: SpeakerActivityModel(
        name: 'José Carlos',
        bio: 'Qualquer bio',
        company: 'Sim',
        linkPhoto: '',
      )),
  ActivityModel(
      id: '',
      type: ActivityEnum.PALESTRAS,
      title: 'Atividade 19',
      description:
          'Competitividade, modernização, produtividade: a aplicação dos conceitos da indústria 4.0. Breve relato de como a Merc...',
      schedule: [
        ScheduleActivityModel(
            date: DateTime(2022, 3, 15),
            hour: DateTime(2022, 3, 15),
            totalParticipants: 20),
        ScheduleActivityModel(
            date: DateTime(2022, 3, 15),
            hour: DateTime(2022, 3, 15),
            totalParticipants: 20),
      ],
      speaker: SpeakerActivityModel(
        name: 'José Carlos',
        bio: 'Qualquer bio',
        company: 'Sim',
        linkPhoto: '',
      )),
  ActivityModel(
    id: '',
    type: ActivityEnum.PALESTRAS,
    title: 'Atividade 20',
    description:
        'Competitividade, modernização, produtividade: a aplicação dos conceitos da indústria 4.0. Breve relato de como a Merc...',
    schedule: [
      ScheduleActivityModel(
          date: DateTime(2022, 3, 15),
          hour: DateTime(2022, 3, 15),
          totalParticipants: 20),
      ScheduleActivityModel(
          date: DateTime(2022, 3, 15),
          hour: DateTime(2022, 3, 15),
          totalParticipants: 20),
    ],
    speaker: SpeakerActivityModel(
      name: 'José Carlos',
      bio: 'Qualquer bio',
      company: 'Sim',
      linkPhoto: '',
    ),
  ),
];
