import '../../domain/entities/schedule_activity.dart';
// ignore_for_file: overridden_fields, annotate_overrides, duplicate_ignore

class ScheduleActivityModel extends ScheduleActivity {
  final DateTime? date;
  int? totalParticipants;
  final DateTime? duration;

  ScheduleActivityModel({this.duration, this.date, this.totalParticipants})
      : super(
          date: date,
          totalParticipants: totalParticipants,
          duration: duration,
        );

  factory ScheduleActivityModel.fromMap(Map<String, dynamic> map) {
    return ScheduleActivityModel(
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      totalParticipants: map['totalParticipants'],
      duration: DateTime.fromMillisecondsSinceEpoch(map['duration']),
    );
  }
  static List<ScheduleActivityModel> fromMaps(List array) {
    return array.map((e) => ScheduleActivityModel.fromMap(e)).toList();
  }

  Map<String, dynamic> toJson() => {
        'date': date!.millisecondsSinceEpoch,
        'totalParticipants': totalParticipants,
        'duration': duration!.millisecondsSinceEpoch
      };

  ScheduleActivityModel copyWith({
    DateTime? date,
    DateTime? duration,
    int? totalParticipants,
  }) {
    return ScheduleActivityModel(
      date: date ?? this.date,
      totalParticipants: totalParticipants ?? this.totalParticipants,
      duration: duration ?? this.duration,
    );
  }

  factory ScheduleActivityModel.newInstance() {
    return ScheduleActivityModel(
        date: null, totalParticipants: null, duration: null);
  }
}
