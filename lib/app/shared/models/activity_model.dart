import 'package:smile_front/app/shared/entities/activity.dart';
import 'package:smile_front/app/modules/dashboard/domain/infra/activity_enum.dart';
import 'package:smile_front/app/shared/entities/infra/delivery_enum.dart';
import 'package:smile_front/app/shared/entities/infra/user_roles_enum.dart';
import 'package:smile_front/app/shared/models/responsible_professor_model.dart';

import '../../modules/dashboard/infra/models/speaker_activity_model.dart';

class ActivityModel extends Activity {
  ActivityModel({
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

  factory ActivityModel.fromMap(Map<String, dynamic> map) {
    return ActivityModel(
        activityCode: map['code'],
        type: ActivityEnumExtension.stringToEnumMap(map['activity_type']),
        title: map['title'],
        description: map['description'],
        speakers: SpeakerActivityModel.fromMaps(map['speakers']),
        duration: map['duration'] ?? 0,
        isExtensive: map['is_extensive'] ?? false,
        link: map['link'] ?? '',
        place: map['place'] ?? '',
        startDate: DateTime.fromMillisecondsSinceEpoch(map['start_date']),
        deliveryEnum:
            DeliveryEnumExtension.stringToEnumMap(map['delivery_model']),
        acceptingNewEnrollments: map['accepting_new_enrollments'] ?? false,
        responsibleProfessors: [
          ResponsibleProfessorModel(id: '', name: '', role: UserRolesEnum.admin)
        ],
        takenSlots: map['taken_slots'],
        totalSlots: map['total_slots'],
        stopAcceptingNewEnrollmentsBefore:
            map['stop_accepting_new_enrollments_before'] != null
                ? DateTime.fromMillisecondsSinceEpoch(
                    map['stop_accepting_new_enrollments_before'])
                : DateTime.now());
  }

  static List<ActivityModel> fromMaps(List array) {
    return array.map((e) => ActivityModel.fromMap(e)).toList();
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

  factory ActivityModel.newInstance() {
    return ActivityModel(
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
      responsibleProfessors: [],
      takenSlots: 0,
      totalSlots: 0,
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
      List<ResponsibleProfessorModel>? responsibleProfessors}) {
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
      responsibleProfessors:
          responsibleProfessors ?? this.responsibleProfessors,
      takenSlots: takenSlots ?? this.takenSlots,
      totalSlots: totalSlots ?? this.totalSlots,
      link: link ?? this.link,
      place: place ?? this.place,
      stopAcceptingNewEnrollmentsBefore: stopAcceptingNewEnrollmentsBefore ??
          this.stopAcceptingNewEnrollmentsBefore,
    );
  }
}
