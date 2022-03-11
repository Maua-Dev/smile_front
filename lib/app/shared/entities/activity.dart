import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';

import '../../modules/dashboard/infra/models/speaker_activity_model.dart';

class Activity {
  final String id;
  final ActivityEnum type;
  final String title;
  final String description;
  final DateTime date;
  final DateTime hour;
  final String? location;
  final int totalParticipants;
  final SpeakerActivityModel speaker;

  Activity({
    required this.id,
    required this.type,
    required this.title,
    required this.description,
    required this.date,
    required this.hour,
    this.location,
    required this.totalParticipants,
    required this.speaker,
  });

  factory Activity.newInstance() {
    return Activity(
        date: DateTime.now(),
        description: '',
        id: '',
        title: '',
        type: ActivityEnum.CAFE_EX_ALUNOS,
        location: '',
        totalParticipants: 0,
        hour: DateTime.now(),
        speaker: SpeakerActivityModel(
            bio: '', company: '', name: '', linkPhoto: ''));
  }
}
