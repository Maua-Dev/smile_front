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
  final int workload;

  Activity(
      {required this.workload,
      required this.id,
      this.link,
      this.totalPlaces,
      this.location,
      required this.name,
      required this.description,
      required this.date,
      required this.type});

  factory Activity.newInstance() {
    return Activity(
        date: DateTime.now(),
        description: '',
        id: '',
        name: '',
        type: ActivityEnum.CAFE_EX_ALUNOS,
        workload: 0,
        link: '',
        location: '',
        totalPlaces: 0);
  }
}
