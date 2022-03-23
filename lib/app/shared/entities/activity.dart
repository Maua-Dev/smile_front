import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/dashboard/infra/models/schedule_activity_model.dart';

import '../../modules/dashboard/infra/models/speaker_activity_model.dart';

class Activity {
  final String id;
  final String activityCode;
  final ActivityEnum? type;
  final String title;
  final String description;
  final List<ScheduleActivityModel> schedule;
  final List<SpeakerActivityModel> speaker;

  Activity({
    required this.id,
    required this.activityCode,
    required this.type,
    required this.title,
    required this.description,
    required this.schedule,
    required this.speaker,
  });

  factory Activity.newInstance() {
    return Activity(
        activityCode: '',
        schedule: [],
        description: '',
        id: '',
        title: '',
        type: ActivityEnum.CAFE_EX_ALUNOS,
        speaker: []);
  }
}
