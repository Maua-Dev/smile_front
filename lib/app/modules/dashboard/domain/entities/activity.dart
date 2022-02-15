import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/modules/logged-adm-home/domain/entities/logged_user.dart';

class Activity {
  final String id;
  final String description;
  final String? link;
  final int? totalPlaces;
  final String? location;
  final String name;
  final DateTime date;
  final ActivityEnum activityType;
  final List<LoggedUser> enrolledUsers;
  final List<LoggedUser>? queue;
  final String createdAt;
  final String updateAt;
  final int workload;

  Activity(
      {required this.createdAt,
      required this.updateAt,
      required this.workload,
      required this.id,
      this.link,
      this.totalPlaces,
      this.location,
      required this.enrolledUsers,
      this.queue,
      required this.name,
      required this.description,
      required this.date,
      required this.activityType});
}
