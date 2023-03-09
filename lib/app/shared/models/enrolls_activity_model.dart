import 'package:smile_front/app/shared/models/responsible_professor_model.dart';
import '../../modules/dashboard/domain/infra/activity_enum.dart';
import '../../modules/dashboard/infra/models/speaker_activity_model.dart';
import '../entities/activity.dart';
import '../entities/infra/delivery_enum.dart';
import 'enrollments_model.dart';

class EnrollsActivityModel extends Activity {
  final EnrollmentsModel? enrollments;
  EnrollsActivityModel({
    this.enrollments,
    required super.isExtensive,
    super.confirmationCode,
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

  factory EnrollsActivityModel.fromMap(Map<String, dynamic> map) {
    return EnrollsActivityModel(
        activityCode: map['activity']['code'],
        type: ActivityEnumExtension.stringToEnumMap(
            map['activity']['activity_type']),
        confirmationCode: map['activity']['confirmation_code'],
        title: map['activity']['title'],
        description: map['activity']['description'],
        speakers: SpeakerActivityModel.fromMaps(map['activity']['speakers']),
        duration: map['activity']['duration'] ?? 0,
        isExtensive: map['activity']['is_extensive'] ?? false,
        link: map['activity']['link'] ?? '',
        place: map['activity']['place'] ?? '',
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
        enrollments: map.containsKey('enrollment')
            ? EnrollmentsModel.fromMap(map['enrollment'])
            : null);
  }

  static List<EnrollsActivityModel> fromMaps(List array) {
    return array.map((e) => EnrollsActivityModel.fromMap(e)).toList();
  }

  factory EnrollsActivityModel.newInstance() {
    return EnrollsActivityModel(
      description: '',
      activityCode: '',
      title: '',
      confirmationCode: null,
      type: null,
      speakers: [SpeakerActivityModel.newInstance()],
      duration: 0,
      isExtensive: false,
      startDate: DateTime.now(),
      deliveryEnum: null,
      acceptingNewEnrollments: false,
      responsibleProfessors: [],
      takenSlots: 0,
      totalSlots: 0,
    );
  }

  EnrollsActivityModel copyWith(
      {String? id,
      String? activityCode,
      ActivityEnum? type,
      String? title,
      String? description,
      bool? isExtensive,
      DeliveryEnum? deliveryEnum,
      DateTime? startDate,
      String? confirmationCode,
      int? duration,
      String? place,
      String? link,
      List<SpeakerActivityModel>? speakers,
      bool? acceptingNewEnrollments,
      int? takenSlots,
      int? totalSlots,
      DateTime? stopAcceptingNewEnrollmentsBefore,
      List<ResponsibleProfessorModel>? responsibleProfessors,
      EnrollmentsModel? enrollments}) {
    return EnrollsActivityModel(
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
      confirmationCode: confirmationCode ?? this.confirmationCode,
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
}
