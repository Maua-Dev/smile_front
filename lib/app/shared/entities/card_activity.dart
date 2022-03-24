import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';

class CardActivity {
  final String id;
  final String activityCode;
  final ActivityEnum? type;
  final String title;
  final String description;
  final DateTime? date;
  final int? totalParticipants;
  final DateTime? duration;
  final String? location;
  final String? link;

  CardActivity({
    required this.id,
    required this.activityCode,
    required this.type,
    required this.title,
    required this.description,
    required this.date,
    required this.duration,
    required this.totalParticipants,
    required this.location,
    required this.link,
  }) : super();

  factory CardActivity.newInstance() {
    return CardActivity(
      activityCode: '',
      description: '',
      id: '',
      title: '',
      type: ActivityEnum.CAFE_EX_ALUNOS,
      date: DateTime.now(),
      duration: DateTime.now(),
      link: '',
      location: '',
      totalParticipants: 0,
    );
  }
}
