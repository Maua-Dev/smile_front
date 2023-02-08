import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import '../../modules/dashboard/infra/models/speaker_activity_model.dart';
import '../models/responsible_professor_model.dart';
import 'infra/delivery_enum.dart';

class Activity {
  final String activityCode;
  final ActivityEnum? type;
  final String title;
  final String description;
  final bool isExtensive;
  final DeliveryEnum? deliveryEnum;
  final DateTime? startDate;
  final int? duration;
  String? place;
  String? link;
  final int? totalSlots;
  final int takenSlots;
  final bool acceptingNewEnrollments;
  final DateTime? stopAcceptingNewEnrollmentsBefore;
  final ResponsibleProfessorModel responsibleProfessor;
  final List<SpeakerActivityModel> speakers;

  Activity({
    required this.totalSlots,
    required this.takenSlots,
    required this.acceptingNewEnrollments,
    this.stopAcceptingNewEnrollmentsBefore,
    required this.responsibleProfessor,
    this.place,
    this.link,
    required this.isExtensive,
    required this.deliveryEnum,
    required this.startDate,
    required this.duration,
    required this.activityCode,
    required this.type,
    required this.title,
    required this.description,
    required this.speakers,
  });
}
