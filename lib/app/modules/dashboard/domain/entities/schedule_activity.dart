class ScheduleActivity {
  final DateTime? date;
  int? totalParticipants;
  final DateTime? duration;
  final String? location;
  final String? link;
  final List<String>? enrolledUsers;

  ScheduleActivity({
    this.enrolledUsers,
    this.location,
    this.link,
    this.duration,
    this.date,
    this.totalParticipants,
  });
}
