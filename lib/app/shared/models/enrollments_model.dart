import 'package:smile_front/app/shared/models/user_enroll_model.dart';

import '../entities/infra/enrollment_state_enum.dart';

class EnrollmentsModel {
  final EnrollmentStateEnum state;
  final DateTime dateSubscribed;
  final bool? acceptingNewEnrollments;
  final UserEnrollModel? userEnroll;

  EnrollmentsModel(
      {required this.state,
      required this.dateSubscribed,
      this.acceptingNewEnrollments,
      this.userEnroll});

  factory EnrollmentsModel.fromMap(Map<String, dynamic> map) {
    return EnrollmentsModel(
        acceptingNewEnrollments: map['accepting_new_enrollments'] ?? false,
        state: EnrollmentStateEnumExtension.stringToEnumMap(map['state']),
        dateSubscribed:
            DateTime.fromMillisecondsSinceEpoch(map['date_subscribed']),
        userEnroll: map['user']);
  }

  static List<EnrollmentsModel> fromMaps(List array) {
    return array.map((e) => EnrollmentsModel.fromMap(e)).toList();
  }

  factory EnrollmentsModel.newInstance() {
    return EnrollmentsModel(
      acceptingNewEnrollments: false,
      state: EnrollmentStateEnum.NONE,
      dateSubscribed: DateTime.now(),
    );
  }
}
