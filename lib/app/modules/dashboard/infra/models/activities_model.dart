import 'dart:convert';

import 'package:smile_front/app/modules/dashboard/domain/entities/activities.dart';
import 'package:smile_front/app/modules/dashboard/domain/service/presentation/activities_enum.dart';

class ActivitiesModel extends Activities {
  final String title;
  final String description;
  final ActivitiesEnum activitiesEnum;
  final String date;
  final String time;
  final int? participants;
  final int? maxParticipants;

  ActivitiesModel(
      {required this.title,
      required this.description,
      required this.activitiesEnum,
      required this.date,
      required this.time,
      this.participants,
      this.maxParticipants})
      : super(
            title: super.title,
            description: super.description,
            activitiesEnum: super.activitiesEnum,
            date: super.date,
            time: super.time);

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'activitiesEnum': activitiesEnum.index,
      'date': date,
      'time': time,
      'participants': participants,
      'maxParticipants': maxParticipants,
    };
  }

  factory ActivitiesModel.fromMap(Map<String, dynamic> map) {
    return ActivitiesModel(
      title: map['title'],
      description: map['description'],
      activitiesEnum: ActivitiesEnum.values.elementAt(map['activitiesEnum']),
      date: map['date'],
      time: map['time'],
      participants: map['participants'],
      maxParticipants: map['maxParticipants'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ActivitiesModel.fromJson(String source) =>
      ActivitiesModel.fromMap(json.decode(source));
}
