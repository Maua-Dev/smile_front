// ignore_for_file: overridden_fields, annotate_overrides, duplicate_ignore

import 'package:smile_front/app/modules/dashboard/domain/infra/modality_activity_enum.dart';
import 'package:smile_front/app/shared/entities/activity.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';

import '../../modules/dashboard/infra/models/schedule_activity_model.dart';
import '../../modules/dashboard/infra/models/speaker_activity_model.dart';

class ActivityModel extends Activity {
  final String id;
  final String activityCode;
  final ActivityEnum? type;
  final String title;
  final String description;
  final DeliveryEnum? modality;
  final ScheduleActivityModel schedule;
  final List<SpeakerActivityModel> speakers;

  ActivityModel({
    required this.id,
    required this.activityCode,
    required this.type,
    required this.title,
    required this.description,
    required this.schedule,
    required this.speakers,
    required this.modality,
  }) : super(
          id: id,
          activityCode: activityCode,
          type: type,
          title: title,
          description: description,
          schedule: schedule,
          speakers: speakers,
        );

  factory ActivityModel.fromMap(Map<String, dynamic> map) {
    return ActivityModel(
      id: map['id'],
      modality: DeliveryEnumExtension.stringToEnumMap(map['modality']),
      activityCode: map['activityCode'],
      type: ActivityEnumExtension.stringToEnumMap(map['type']),
      title: map['title'],
      description: map['description'],
      schedule: ScheduleActivityModel.fromMaps(map['schedule']).first,
      speakers: SpeakerActivityModel.fromMaps(map['speakers']),
    );
  }

  static List<ActivityModel> fromMaps(List array) {
    return array.map((e) => ActivityModel.fromMap(e)).toList();
  }

  Map<String, dynamic> toJson() => {
        'type': ActivityEnumExtension.enumToStringMap(type!),
        'activityCode': activityCode,
        'title': title,
        'description': description,
        'schedule': schedule,
        'speakers': speakers,
      };

  factory ActivityModel.newInstance() {
    return ActivityModel(
        schedule: ScheduleActivityModel.newInstance(),
        description: '',
        modality: null,
        id: '',
        activityCode: '',
        title: '',
        type: null,
        speakers: [SpeakerActivityModel.newInstance()]);
  }

  ActivityModel copyWith({
    String? id,
    String? activityCode,
    ActivityEnum? type,
    String? title,
    String? description,
    DeliveryEnum? modality,
    ScheduleActivityModel? schedule,
    List<SpeakerActivityModel>? speakers,
  }) {
    return ActivityModel(
      id: id ?? this.id,
      activityCode: activityCode ?? this.activityCode,
      type: type ?? this.type,
      title: title ?? this.title,
      description: description ?? this.description,
      schedule: schedule ?? this.schedule,
      speakers: speakers ?? this.speakers,
      modality: modality ?? this.modality,
    );
  }
}
