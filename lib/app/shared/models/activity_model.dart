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
  final int workload;

  ActivityModel({
    required this.id,
    this.link,
    this.totalPlaces,
    this.location,
    required this.name,
    required this.description,
    required this.date,
    required this.type,
    required this.workload,
  }) : super(
          workload: workload,
          id: id,
          link: link,
          location: location,
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
      id: map['id'],
      workload: map['workload'],
      location: map['location'],
      totalPlaces: map['totalPlaces'],
      link: map['link'],
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
        'id': id,
        'workload': workload,
        'location': location,
        'totalPlaces': totalPlaces,
        'link': link,
        'type': type.name,
      };
}
