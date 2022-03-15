import '../../domain/entities/schedule_activity.dart';
// ignore_for_file: overridden_fields, annotate_overrides, duplicate_ignore

class ScheduleActivityModel extends ScheduleActivity {
  final DateTime? date;
  final int? totalParticipants;

  ScheduleActivityModel({this.date, this.totalParticipants})
      : super(date: date, totalParticipants: totalParticipants);

  factory ScheduleActivityModel.fromMap(Map<String, dynamic> map) {
    return ScheduleActivityModel(
      date: DateTime.fromMillisecondsSinceEpoch(map['date'], isUtc: true),
      totalParticipants: map['totalParticipants'],
    );
  }
  static List<ScheduleActivityModel> fromMaps(List array) {
    return array.map((e) => ScheduleActivityModel.fromMap(e)).toList();
  }

  Map<String, dynamic> toJson() => {
        'date': date!.millisecondsSinceEpoch,
        'totalParticipants': totalParticipants,
      };

  ScheduleActivityModel copyWith({
    DateTime? date,
    int? totalParticipants,
  }) {
    return ScheduleActivityModel(
      date: date ?? this.date,
      totalParticipants: totalParticipants ?? this.totalParticipants,
    );
  }

  factory ScheduleActivityModel.newInstance() {
    return ScheduleActivityModel(date: null, totalParticipants: null);
  }
}
