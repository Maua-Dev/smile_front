import 'package:smile_front/app/shared/models/responsible_professor_model.dart';

import '../../modules/dashboard/domain/infra/activity_enum.dart';
import '../../modules/dashboard/infra/models/speaker_activity_model.dart';
import '../entities/activity.dart';
import '../entities/infra/delivery_enum.dart';
import '../entities/infra/user_roles_enum.dart';
import 'enrollments_model.dart';

class EnrollsActivityModel extends Activity {
  final List<EnrollmentsModel>? enrollments;
  EnrollsActivityModel({
    this.enrollments,
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
    required super.responsibleProfessor,
    super.stopAcceptingNewEnrollmentsBefore,
    required super.takenSlots,
    required super.totalSlots,
  });

  factory EnrollsActivityModel.fromMap(Map<String, dynamic> map) {
    return EnrollsActivityModel(
        activityCode: map['activity']['code'],
        type: ActivityEnumExtension.stringToEnumMap(
            map['activity']['activity_type']),
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
        responsibleProfessor: ResponsibleProfessorModel(
            id: '', name: '', role: UserRolesEnum.ADMIN),
        takenSlots: map['activity']['taken_slots'],
        totalSlots: map['activity']['total_slots'],
        stopAcceptingNewEnrollmentsBefore:
            map['activity']['stop_accepting_new_enrollments_before'] != null
                ? DateTime.fromMillisecondsSinceEpoch(
                    map['activity']['stop_accepting_new_enrollments_before'])
                : DateTime.now(),
        enrollments: EnrollmentsModel.fromMaps(map['enrollments']));
  }

  static List<EnrollsActivityModel> fromMaps(List array) {
    return array.map((e) => EnrollsActivityModel.fromMap(e)).toList();
  }
}
