import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/shared/entities/infra/delivery_enum.dart';
import 'package:smile_front/app/shared/entities/responsible_professor.dart';
import 'package:smile_front/app/shared/entities/speaker.dart';

class ActivityAdmin {
  final String activityCode;
  final ActivityEnum type;
  final String title;
  final String description;
  final bool isExtensive;
  final DeliveryEnum deliveryEnum;
  final DateTime startDate;
  final int duration;
  String? place;
  String? link;
  final int totalSlots;
  final int takenSlots;
  final List<ResponsibleProfessor> responsibleProfessors;
  final List<Speaker> speakers;
  final DateTime stopAcceptingNewEnrollmentsBefore;
  final bool acceptingNewEnrollments;

  ActivityAdmin({
    required this.activityCode,
    required this.title,
    required this.type,
    required this.responsibleProfessors,
    required this.place,
    required this.link,
    required this.deliveryEnum,
    required this.description,
    required this.isExtensive,
    required this.startDate,
    required this.duration,
    required this.totalSlots,
    required this.takenSlots,
    required this.speakers,
    required this.stopAcceptingNewEnrollmentsBefore,
    required this.acceptingNewEnrollments,
  });
}
