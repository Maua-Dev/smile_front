// ignore_for_file: overridden_fields, annotate_overrides, duplicate_ignore

import 'package:smile_front/app/shared/entities/activity.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';

// ignore: duplicate_ignore
class ActivityModel extends Activity {
  final String id;
  final String description;
  final String? link;
  final int? totalPlaces;
  final String? location;
  final String name;
  final DateTime date;
  final ActivityEnum type;
  final List<dynamic> enrolledUsers;
  final List<dynamic>? queue;
  final String createdAt;
  final String updatedAt;
  final int workload;

  ActivityModel({
    required this.id,
    this.link,
    this.totalPlaces,
    this.location,
    required this.enrolledUsers,
    this.queue,
    required this.name,
    required this.description,
    required this.date,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
    required this.workload,
  }) : super(
          createdAt: createdAt,
          updateAt: updatedAt,
          workload: workload,
          id: id,
          enrolledUsers: enrolledUsers,
          link: link,
          location: location,
          queue: queue,
          totalPlaces: totalPlaces,
          type: type,
          date: date,
          name: name,
          description: description,
        );

  factory ActivityModel.fromMap(Map<String, dynamic> map) {
    return ActivityModel(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      createdAt: map['createdAt'],
      id: map['id'],
      updatedAt: map['updatedAt'],
      workload: map['workload'],
      location: map['location'],
      totalPlaces: map['totalPlaces'],
      queue: map['queue'],
      link: map['link'],
      enrolledUsers: map['enrolledUsers'],
      type: stringToEnumMap(map['type']),
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
        'name': name,
        'description': description,
        'date': date.millisecondsSinceEpoch,
        'createdAt': createdAt,
        'id': id,
        'updatedAt': updatedAt,
        'workload': workload,
        'location': location,
        'totalPlaces': totalPlaces,
        'queue': queue,
        'link': link,
        'enrolledUsers': enrolledUsers,
        'type': type.name,
      };
}
