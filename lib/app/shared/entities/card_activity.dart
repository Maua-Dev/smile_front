import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/shared/models/responsible_professor_model.dart';
import '../../modules/dashboard/infra/models/speaker_activity_model.dart';
import 'infra/delivery_enum.dart';

class CardActivity {
  final String id;
  final String activityCode;
  final ActivityEnum? type;
  final String title;
  final String description;
  final DateTime? date;
  final int? totalParticipants;
  final List<SpeakerActivityModel>? speakers;
  final int? duration;
  final String? location;
  final String? link;
  final bool acceptSubscription;
  final int? enrolledUsers;
  final bool isExtensive;
  final DeliveryEnum? delivery;
  final ResponsibleProfessorModel responsibleProfessor;

  CardActivity({
    required this.responsibleProfessor,
    required this.acceptSubscription,
    required this.enrolledUsers,
    required this.id,
    required this.activityCode,
    required this.type,
    required this.title,
    required this.description,
    required this.date,
    required this.duration,
    required this.totalParticipants,
    required this.location,
    required this.delivery,
    this.speakers,
    required this.link,
    required this.isExtensive,
  }) : super();

  factory CardActivity.newInstance() {
    return CardActivity(
      acceptSubscription: false,
      enrolledUsers: null,
      activityCode: '',
      description: '',
      id: '',
      title: '',
      type: null,
      date: DateTime.now(),
      duration: 0,
      link: '',
      location: '',
      speakers: [],
      totalParticipants: 0,
      isExtensive: false,
      delivery: null,
      responsibleProfessor: ResponsibleProfessorModel.newInstance(),
    );
  }
}
