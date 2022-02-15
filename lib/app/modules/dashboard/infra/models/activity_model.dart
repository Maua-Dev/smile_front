// ignore_for_file: overridden_fields, annotate_overrides, duplicate_ignore

import 'package:smile_front/app/modules/dashboard/domain/entities/activity.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/logged-adm-home/domain/entities/logged_user.dart';

// ignore: duplicate_ignore
class ActivityModel extends Activity {
  final String id;
  final String description;
  final String? link;
  final int? totalPlaces;
  final String? location;
  final String name;
  final DateTime date;
  final ActivityEnum activityType;
  final List<LoggedUser> enrolledUsers;
  final List<LoggedUser>? queue;
  final String createdAt;
  final String updateAt;
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
    required this.activityType,
    required this.createdAt,
    required this.updateAt,
    required this.workload,
  }) : super(
          createdAt: createdAt,
          updateAt: updateAt,
          workload: workload,
          id: id,
          enrolledUsers: enrolledUsers,
          link: link,
          location: location,
          queue: queue,
          totalPlaces: totalPlaces,
          activityType: activityType,
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
      updateAt: map['updatedAt'],
      workload: map['workload'],
      location: map['location'],
      totalPlaces: map['totalPlaces'],
      queue: map['queue'],
      link: map['link'],
      enrolledUsers: map['enrolledUsers'],
      activityType: map['activityType'],
    );
  }

  static List<ActivityModel> fromMaps(List array) {
    return array.map((e) => ActivityModel.fromMap(e)).toList();
  }
}
