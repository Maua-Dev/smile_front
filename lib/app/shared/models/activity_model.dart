// ignore_for_file: overridden_fields, annotate_overrides, duplicate_ignore

import 'package:smile_front/app/shared/entities/activity.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';

import '../../modules/dashboard/infra/models/speaker_activity_model.dart';

// ignore: duplicate_ignore
class ActivityModel extends Activity {
  final String id;
  final ActivityEnum type;
  final String title;
  final String description;
  final DateTime date;
  final DateTime hour;
  final String? location;
  final int totalParticipants;
  final SpeakerActivityModel speaker;

  ActivityModel({
    required this.id,
    required this.type,
    required this.title,
    required this.description,
    required this.date,
    required this.hour,
    this.location,
    required this.totalParticipants,
    required this.speaker,
  }) : super(
          id: id,
          location: location,
          totalParticipants: totalParticipants,
          type: type,
          date: date,
          title: title,
          description: description,
          hour: hour,
          speaker: speaker,
        );

  factory ActivityModel.fromMap(Map<String, dynamic> map) {
    return ActivityModel(
      id: map['id'],
      type: stringToEnumMap(map['type']),
      title: map['name'],
      description: map['description'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      hour: DateTime.fromMillisecondsSinceEpoch(map['hour']),
      location: map['location'],
      totalParticipants: map['totalParticipants'] ?? 0,
      speaker: map['speaker'] ??
          SpeakerActivityModel(bio: '', company: '', linkPhoto: '', name: ''),
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
        'type': type.name,
        'title': title,
        'description': description,
        'date': date.millisecondsSinceEpoch,
        'hour': hour.millisecondsSinceEpoch,
        'location': location,
        'totalParticipants': totalParticipants,
        'speaker': speaker,
      };
}
