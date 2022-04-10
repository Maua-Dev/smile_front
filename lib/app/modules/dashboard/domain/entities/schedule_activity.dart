import '../../infra/models/user_id_model.dart';

class ScheduleActivity {
  final DateTime? date;
  int? totalParticipants;
  final DateTime? duration;
  final String? location;
  final String? link;
  final List<UserIdModel>? enrolledUsers;
  final List<UserIdModel>? queue;

  ScheduleActivity(
      {this.enrolledUsers,
      this.location,
      this.link,
      this.duration,
      this.date,
      this.totalParticipants,
      this.queue});
}
