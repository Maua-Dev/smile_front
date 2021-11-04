import 'package:smile_front/app/modules/dashboard/domain/service/presentation/activities_enum.dart';

class Activities {
  final String title;
  final String description;
  final ActivitiesEnum activitiesEnum;
  final String date;
  final String time;
  final int? participants;
  final int? maxParticipants;

  Activities({
    required this.title,
    required this.description,
    required this.activitiesEnum,
    required this.date,
    required this.time,
    this.participants,
    this.maxParticipants,
  });
}
