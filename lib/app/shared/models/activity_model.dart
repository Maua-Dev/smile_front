import 'package:smile_front/app/shared/entities/activity.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/shared/entities/infra/delivery_enum.dart';
import 'package:smile_front/app/shared/models/responsible_professor_model.dart';

import '../../modules/dashboard/infra/models/speaker_activity_model.dart';

class ActivityModel extends Activity {
  ActivityModel({
    required super.isExtensive,
    super.deliveryEnum,
    super.startDate,
    super.duration,
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
    super.totalSlots,
  });

  factory ActivityModel.fromMap(Map<String, dynamic> map) {
    return ActivityModel(
        activityCode: map['code'],
        type: ActivityEnumExtension.stringToEnumMap(map['activity_type']),
        title: map['title'],
        description: map['description'],
        speakers: [],
        duration: map['duration'] ?? 0,
        isExtensive: map['is_extensive'] ?? false,
        link: map['link'] ?? '',
        place: map['place'] ?? '',
        startDate: DateTime.fromMillisecondsSinceEpoch(map['start_date']),
        deliveryEnum:
            DeliveryEnumExtension.stringToEnumMap(map['delivery_model']),
        acceptingNewEnrollments: map['accepting_new_enrollments'] ?? false,
        responsibleProfessors: map['responsible_professors'],
        takenSlots: map['taken_slots'],
        totalSlots: map['total_slots'],
        stopAcceptingNewEnrollmentsBefore:
            map['stop_accepting_new_enrollments_before'] != null
                ? DateTime.fromMillisecondsSinceEpoch(
                    map['stop_accepting_new_enrollments_before'])
                : DateTime.now());
  }

  static List<ActivityModel> fromMaps(List array) {
    return array.map((e) => ActivityModel.fromMap(e['activity'])).toList();
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
        'responsible_professors': [responsibleProfessors!.id],
        'speakers': speakers.map((e) => e.toJson()).toList(),
      };

  Map<String, dynamic> editToJson() => {
        'new_activity_type': ActivityEnumExtension.enumToStringMap(type!),
        'code': activityCode,
        'new_title  ': title,
        'new_description': description,
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
        'new_responsible_professors': [responsibleProfessors!.id],
        'new_speakers': speakers.map((e) => e.toJson()).toList(),
      };

  factory ActivityModel.newInstance() {
    return ActivityModel(
      description: '',
      activityCode: '',
      title: '',
      type: null,
      speakers: [SpeakerActivityModel.newInstance()],
      duration: null,
      isExtensive: false,
      startDate: null,
      deliveryEnum: null,
      acceptingNewEnrollments: false,
      responsibleProfessors: ResponsibleProfessorModel.newInstance(),
      takenSlots: 0,
      totalSlots: null,
    );
  }

  ActivityModel copyWith(
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
      ResponsibleProfessorModel? responsibleProfessor}) {
    return ActivityModel(
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
      // ignore: unnecessary_this
      responsibleProfessors: responsibleProfessor ?? this.responsibleProfessors,
      takenSlots: takenSlots ?? this.takenSlots,
      totalSlots: totalSlots ?? this.totalSlots,
      link: link ?? this.link,
      place: place ?? this.place,
      stopAcceptingNewEnrollmentsBefore: stopAcceptingNewEnrollmentsBefore ??
          this.stopAcceptingNewEnrollmentsBefore,
    );
  }
}
