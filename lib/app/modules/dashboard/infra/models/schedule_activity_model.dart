import 'package:smile_front/app/modules/dashboard/infra/models/user_id_model.dart';

import '../../domain/entities/schedule_activity.dart';
// ignore_for_file: overridden_fields, annotate_overrides, duplicate_ignore

class ScheduleActivityModel extends ScheduleActivity {
  final DateTime? date;
  int? totalParticipants;
  final DateTime? duration;
  String? location;
  String? link;
  final List<UserIdModel>? enrolledUsers;
  final List<UserIdModel>? queue;

  ScheduleActivityModel(
      {this.queue,
      this.location,
      this.link,
      this.duration,
      this.date,
      this.totalParticipants,
      this.enrolledUsers})
      : super(
          date: date,
          totalParticipants: totalParticipants,
          duration: duration,
          enrolledUsers: enrolledUsers,
          link: link,
          location: location,
        );

  factory ScheduleActivityModel.fromMap(Map<String, dynamic> map) {
    return ScheduleActivityModel(
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      totalParticipants: map['totalParticipants'],
      duration: DateTime.fromMillisecondsSinceEpoch(map['duration']),
      location: map['location'],
      link: map['link'],
      enrolledUsers: UserIdModel.fromMaps(map['enrolledUsers']),
      queue: UserIdModel.fromMaps(map['queue']),
    );
  }
  static List<ScheduleActivityModel> fromMaps(List array) {
    return array.map((e) => ScheduleActivityModel.fromMap(e)).toList();
  }

  Map<String, dynamic> toJson() => {
        'date': date!.millisecondsSinceEpoch,
        'totalParticipants': totalParticipants,
        'duration': duration!.millisecondsSinceEpoch,
        'location': location ?? '',
        'link': link ?? ''
      };

  ScheduleActivityModel copyWith({
    DateTime? date,
    DateTime? duration,
    int? totalParticipants,
    String? location,
    String? link,
  }) {
    return ScheduleActivityModel(
        date: date ?? this.date,
        totalParticipants: totalParticipants ?? this.totalParticipants,
        duration: duration ?? this.duration,
        location: location ?? this.location,
        link: link ?? this.link);
  }

  factory ScheduleActivityModel.newInstance() {
    return ScheduleActivityModel(
        date: null,
        totalParticipants: null,
        duration: null,
        location: null,
        link: null);
  }
}
