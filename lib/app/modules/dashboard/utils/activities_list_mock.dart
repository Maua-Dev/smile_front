import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/speaker_activity_model.dart';
import 'package:smile_front/app/shared/models/activity_model.dart';

var listActivitiesMock = [
  ActivityModel(
      id: '',
      type: ActivityEnum.CURSOS,
      title: 'Atividade 01',
      description: '',
      date: DateTime.now(),
      hour: DateTime.now(),
      totalParticipants: 10,
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
      description: '',
      date: DateTime.now(),
      hour: DateTime.now(),
      totalParticipants: 10,
      speaker: SpeakerActivityModel(
        name: 'José Carlos',
        bio: 'Qualquer bio',
        company: 'Sim',
        linkPhoto: '',
      )),
  ActivityModel(
      id: '',
      type: ActivityEnum.CURSOS,
      title: 'Atividade 03',
      description: '',
      date: DateTime.now(),
      hour: DateTime.now(),
      totalParticipants: 10,
      speaker: SpeakerActivityModel(
        name: 'José Carlos',
        bio: 'Qualquer bio',
        company: 'Sim',
        linkPhoto: '',
      )),
  ActivityModel(
      id: '',
      type: ActivityEnum.CURSOS,
      title: 'Atividade 04',
      description: '',
      date: DateTime.now(),
      hour: DateTime.now(),
      totalParticipants: 10,
      speaker: SpeakerActivityModel(
        name: 'José Carlos',
        bio: 'Qualquer bio',
        company: 'Sim',
        linkPhoto: '',
      )),
];
