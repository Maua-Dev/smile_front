import 'package:smile_front/app/shared/entities/activity.dart';
import 'package:smile_front/app/shared/models/responsible_professor_model.dart';
import '../../modules/dashboard/domain/infra/activity_enum.dart';
import '../../modules/dashboard/infra/models/speaker_activity_model.dart';
import '../entities/infra/delivery_enum.dart';
import 'enrollments_model.dart';

class AdminActivityModel extends Activity {
  final List<EnrollmentsModel> enrollments;
  AdminActivityModel({
    required this.enrollments,
    required super.isExtensive,
    super.deliveryEnum,
    super.startDate,
    required super.duration,
    required super.activityCode,
    required super.type,
    required super.title,
    required super.description,
    required super.speakers,
    super.link,
    super.place,
    required super.acceptingNewEnrollments,
    required super.responsibleProfessors,
    super.stopAcceptingNewEnrollmentsBefore,
    required super.takenSlots,
    required super.totalSlots,
  });

  factory AdminActivityModel.fromMap(Map<String, dynamic> map) {
    return AdminActivityModel(
        activityCode: map['activity']['code'],
        type: ActivityEnumExtension.stringToEnumMap(
            map['activity']['activity_type']),
        title: map['activity']['title'],
        description: map['activity']['description'],
        speakers: SpeakerActivityModel.fromMaps(map['activity']['speakers']),
        duration: map['activity']['duration'] ?? 0,
        isExtensive: map['activity']['is_extensive'] ?? false,
        link: map['activity']['link'],
        place: map['activity']['place'],
        startDate:
            DateTime.fromMillisecondsSinceEpoch(map['activity']['start_date']),
        deliveryEnum: DeliveryEnumExtension.stringToEnumMap(
            map['activity']['delivery_model']),
        acceptingNewEnrollments:
            map['activity']['accepting_new_enrollments'] ?? false,
        responsibleProfessors: ResponsibleProfessorModel.fromMaps(
            map['activity']['responsible_professors']),
        takenSlots: map['activity']['taken_slots'],
        totalSlots: map['activity']['total_slots'],
        stopAcceptingNewEnrollmentsBefore:
            map['activity']['stop_accepting_new_enrollments_before'] != null
                ? DateTime.fromMillisecondsSinceEpoch(
                    map['activity']['stop_accepting_new_enrollments_before'])
                : DateTime.now(),
        enrollments: EnrollmentsModel.fromMaps(map['enrollments']));
  }

  static List<AdminActivityModel> fromMaps(List array) {
    return array.map((e) => AdminActivityModel.fromMap(e)).toList();
  }

  factory AdminActivityModel.newInstance() {
    return AdminActivityModel(
        description: '',
        activityCode: '',
        title: '',
        type: null,
        speakers: [SpeakerActivityModel.newInstance()],
        duration: 0,
        isExtensive: false,
        startDate: DateTime.now(),
        deliveryEnum: null,
        acceptingNewEnrollments: false,
        responsibleProfessors: [ResponsibleProfessorModel.newInstance()],
        takenSlots: 0,
        totalSlots: 0,
        enrollments: []);
  }

  AdminActivityModel copyWith(
      {String? id,
      String? activityCode,
      ActivityEnum? type,
      String? title,
      String? description,
      bool? isExtensive,
      DeliveryEnum? deliveryEnum,
      DateTime? startDate,
      int? duration,
      String? place,
      String? link,
      List<SpeakerActivityModel>? speakers,
      bool? acceptingNewEnrollments,
      int? takenSlots,
      int? totalSlots,
      DateTime? stopAcceptingNewEnrollmentsBefore,
      List<ResponsibleProfessorModel>? responsibleProfessors,
      List<EnrollmentsModel>? enrollments}) {
    return AdminActivityModel(
      activityCode: activityCode ?? this.activityCode,
      type: type ?? this.type,
      title: title ?? this.title,
      description: description ?? this.description,
      duration: duration ?? this.duration,
      speakers: speakers ?? this.speakers,
      isExtensive: isExtensive ?? this.isExtensive,
      startDate: startDate ?? this.startDate,
      deliveryEnum: deliveryEnum ?? this.deliveryEnum,
      acceptingNewEnrollments:
          acceptingNewEnrollments ?? this.acceptingNewEnrollments,
      responsibleProfessors:
          responsibleProfessors ?? this.responsibleProfessors,
      takenSlots: takenSlots ?? this.takenSlots,
      totalSlots: totalSlots ?? this.totalSlots,
      link: link ?? this.link,
      place: place ?? this.place,
      stopAcceptingNewEnrollmentsBefore: stopAcceptingNewEnrollmentsBefore ??
          this.stopAcceptingNewEnrollmentsBefore,
      enrollments: enrollments ?? this.enrollments,
    );
  }

  Map<String, dynamic> toJson() => {
        'activity_type': ActivityEnumExtension.enumToStringMap(type!),
        'code': activityCode,
        'title': title,
        'description': description,
        'is_extensive': isExtensive,
        'delivery_model': DeliveryEnumExtension.enumToStringMap(deliveryEnum!),
        'start_date': startDate!.millisecondsSinceEpoch,
        'duration': duration,
        'place': place,
        'link': link,
        'total_slots': totalSlots,
        'taken_slots': takenSlots,
        'accepting_new_enrollments': acceptingNewEnrollments,
        'stop_accepting_new_enrollments_before':
            stopAcceptingNewEnrollmentsBefore!.millisecondsSinceEpoch,
        'responsible_professors': [responsibleProfessors[0].id],
        'speakers': speakers.map((e) => e.toJson()).toList(),
      };

  Map<String, dynamic> editToJson() => {
        'code': activityCode,
        'new_title': title,
        'new_description': description,
        'new_activity_type': ActivityEnumExtension.enumToStringMap(type!),
        'new_is_extensive': isExtensive,
        'new_delivery_model':
            DeliveryEnumExtension.enumToStringMap(deliveryEnum!),
        'new_start_date': startDate!.millisecondsSinceEpoch,
        'new_duration': duration,
        'new_place': place,
        'new_link': link,
        'new_total_slots': totalSlots,
        'new_taken_slots': takenSlots,
        'new_accepting_new_enrollments': acceptingNewEnrollments,
        'new_stop_accepting_new_enrollments_before':
            stopAcceptingNewEnrollmentsBefore!.millisecondsSinceEpoch,
        'new_responsible_professors': [responsibleProfessors[0].id],
        'new_speakers': speakers.map((e) => e.toJson()).toList(),
      };
}
