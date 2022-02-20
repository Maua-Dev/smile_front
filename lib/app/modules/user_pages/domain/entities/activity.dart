import 'package:smile_front/app/modules/user_pages/domain/infra/activity_enum.dart';

class Activity {
  final String id;
  final String name;
  final String description;
  final String date;
  final String time;
  final int maxParticipants;
  final int totalParticipants;
  final ActivityEnum activityType;

  Activity(
      {required this.id,
      required this.name,
      required this.description,
      required this.date,
      required this.time,
      required this.maxParticipants,
      required this.totalParticipants,
      required this.activityType});
}
