import '../../domain/entities/schedule_activity.dart';
// ignore_for_file: overridden_fields, annotate_overrides, duplicate_ignore

class ScheduleActivityModel extends ScheduleActivity {
  final DateTime? date;
  final DateTime? hour;
  final int totalParticipants;

  ScheduleActivityModel(
      {required this.date, required this.hour, required this.totalParticipants})
      : super(date: date, hour: hour, totalParticipants: totalParticipants);

  factory ScheduleActivityModel.fromMap(Map<String, dynamic> map) {
    return ScheduleActivityModel(
      date: map['date'],
      hour: map['hour'],
      totalParticipants: map['totalParticipants'],
    );
  }

  Map<String, dynamic> toJson() => {
        'date': date!.millisecondsSinceEpoch,
        'hour': hour!.millisecondsSinceEpoch,
        'totalParticipants': totalParticipants,
      };

  ScheduleActivityModel copyWith({
    DateTime? date,
    DateTime? hour,
    int? totalParticipants,
  }) {
    return ScheduleActivityModel(
      date: date ?? this.date,
      hour: hour ?? this.hour,
      totalParticipants: totalParticipants ?? this.totalParticipants,
    );
  }

  factory ScheduleActivityModel.newInstance() {
    return ScheduleActivityModel(date: null, hour: null, totalParticipants: 0);
  }
}
