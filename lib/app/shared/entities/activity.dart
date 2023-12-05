import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import '../../modules/dashboard/infra/models/speaker_activity_model.dart';
import '../models/responsible_professor_model.dart';
import 'infra/delivery_enum.dart';

class Activity {
  final String activityCode;
  final ActivityEnum? type;
  final String title;
  final String? description;
  final bool isExtensive;
  final DeliveryEnum? deliveryEnum;
  final DateTime? startDate;
  final int duration;
  String? place;
  String? link;
  final int totalSlots;
  final int takenSlots;
  final bool acceptingNewEnrollments;
  final DateTime? stopAcceptingNewEnrollmentsBefore;
  final List<ResponsibleProfessorModel>? responsibleProfessors;
  final List<SpeakerActivityModel>? speakers;

  Activity({
    required this.totalSlots,
    required this.takenSlots,
    required this.acceptingNewEnrollments,
    this.stopAcceptingNewEnrollmentsBefore,
    this.responsibleProfessors,
    this.place,
    this.link,
    required this.isExtensive,
    required this.deliveryEnum,
    required this.startDate,
    required this.duration,
    required this.activityCode,
    required this.type,
    required this.title,
    this.description,
    this.speakers,
  });

  factory Activity.newInstance() {
    return Activity(
      activityCode: '',
      deliveryEnum: null,
      description: '',
      title: '',
      type: ActivityEnum.ALUMNI_CAFE,
      duration: 0,
      isExtensive: false,
      startDate: null,
      speakers: [],
      acceptingNewEnrollments: false,
      responsibleProfessors: [],
      takenSlots: 0,
      totalSlots: 0,
      link: null,
      place: null,
      stopAcceptingNewEnrollmentsBefore: null,
    );
  }
}
