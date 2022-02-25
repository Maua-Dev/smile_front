import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';

class Activity {
  final String id;
  final String description;
  final String? link;
  final int? totalPlaces;
  final String? location;
  final String name;
  final DateTime date;
  final ActivityEnum type;
  //não é dynamic: UserModel, porém o back não implementou ainda
  final List<dynamic> enrolledUsers;
  final List<dynamic>? queue;
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
      required this.type});

  factory Activity.newInstance() {
    return Activity(
        createdAt: '',
        date: DateTime.now(),
        description: '',
        enrolledUsers: [],
        id: '',
        name: '',
        type: ActivityEnum.CAFE_EX_ALUNOS,
        updateAt: '',
        workload: 0,
        link: '',
        location: '',
        queue: [],
        totalPlaces: 0);
  }
}
