// ignore_for_file: overridden_fields, annotate_overrides, duplicate_ignore

import 'package:smile_front/app/shared/entities/activity.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';

import '../../modules/dashboard/infra/models/schedule_activity_model.dart';
import '../../modules/dashboard/infra/models/speaker_activity_model.dart';

class ActivityModel extends Activity {
  final String id;
  final ActivityEnum? type;
  final String title;
  final String description;
  final List<ScheduleActivityModel> schedule;
  final String? location;
  final SpeakerActivityModel speaker;

  ActivityModel({
    required this.id,
    required this.type,
    required this.title,
    required this.description,
    required this.schedule,
    this.location,
    required this.speaker,
  }) : super(
          id: id,
          type: type,
          title: title,
          description: description,
          schedule: schedule,
          location: location,
          speaker: speaker,
        );

  factory ActivityModel.fromMap(Map<String, dynamic> map) {
    return ActivityModel(
      id: map['id'],
      type: stringToEnumMap(map['type']),
      title: map['name'],
      description: map['description'],
      schedule: ScheduleActivityModel.fromMaps(map['schedule']),
      location: map['location'],
      speaker: SpeakerActivityModel.fromMap(map['speaker']),
    );
  }

  static List<ActivityModel> fromMaps(List array) {
    return array.map((e) => ActivityModel.fromMap(e)).toList();
  }

  static ActivityEnum stringToEnumMap(String toMap) {
    toMap = toMap.toLowerCase();
    ActivityEnum type = ActivityEnum.values
        .firstWhere((element) => toMap == element.name.toLowerCase());
    return type;
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type!.name,
        'title': title,
        'description': description,
        'schedule': schedule,
        'location': location,
        'speaker': speaker,
      };

  factory ActivityModel.newInstance() {
    return ActivityModel(
        schedule: [ScheduleActivityModel.newInstance()],
        description: '',
        id: '',
        title: '',
        type: null,
        location: '',
        speaker: SpeakerActivityModel(
            bio: '', company: '', name: '', linkPhoto: ''));
  }

  ActivityModel copyWith({
    String? id,
    ActivityEnum? type,
    String? title,
    String? description,
    List<ScheduleActivityModel>? schedule,
    DateTime? date,
    DateTime? hour,
    int? totalParticipants,
    String? location,
    SpeakerActivityModel? speaker,
  }) {
    return ActivityModel(
      id: id ?? this.id,
      type: type ?? this.type,
      title: title ?? this.title,
      description: description ?? this.description,
      schedule: schedule ?? this.schedule,
      location: location ?? this.location,
      speaker: speaker ?? this.speaker,
    );
  }
}
