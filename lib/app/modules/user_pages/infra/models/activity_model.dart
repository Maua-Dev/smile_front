// ignore_for_file: overridden_fields, annotate_overrides, duplicate_ignore

import 'dart:convert';

import 'package:smile_front/app/modules/user_pages/domain/entities/activity.dart';
import 'package:smile_front/app/modules/user_pages/domain/infra/activity_enum.dart';

// ignore: duplicate_ignore
class ActivityModel extends Activity {
  final String id;
  final String name;
  // ignore: annotate_overrides
  final String description;
  final String date;
  final String time;
  final int maxParticipants;
  final int totalParticipants;
  final ActivityEnum activityType;

  ActivityModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.date,
      required this.time,
      required this.maxParticipants,
      required this.totalParticipants,
      required this.activityType})
      : super(
            id: id,
            activityType: activityType,
            date: date,
            maxParticipants: maxParticipants,
            name: name,
            description: description,
            time: time,
            totalParticipants: totalParticipants);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'date': date,
      'time': time,
      'maxParticipants': maxParticipants,
      'totalParticipants': totalParticipants,
      'activityType': activityType,
    };
  }

  factory ActivityModel.fromMap(Map<String, dynamic> map) {
    return ActivityModel(
      id: map['id'],
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      date: map['date'] ?? '',
      time: map['time'] ?? '',
      maxParticipants: map['maxParticipants']?.toInt() ?? 0,
      totalParticipants: map['totalParticipants']?.toInt() ?? 0,
      activityType: map['activityType'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ActivityModel.fromJson(String source) =>
      ActivityModel.fromMap(json.decode(source));
}
