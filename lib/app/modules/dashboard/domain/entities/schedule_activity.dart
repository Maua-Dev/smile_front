class ScheduleActivity {
  final DateTime? date;
  int? totalParticipants;
  final DateTime? duration;
  final String? location;
  final String? link;
  final List<dynamic>? enrolledUsers;
  final List<dynamic>? queue;

  ScheduleActivity(
      {this.enrolledUsers,
      this.location,
      this.link,
      this.duration,
      this.date,
      this.totalParticipants,
      this.queue});
}
