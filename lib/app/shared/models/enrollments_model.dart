import 'package:smile_front/app/shared/models/user_enroll_model.dart';

import '../entities/infra/enrollment_state_enum.dart';

class EnrollmentsModel {
  final UserEnrollModel? userEnroll;
  final EnrollmentStateEnum state;
  final DateTime dateSubscribed;

  EnrollmentsModel(
      {this.userEnroll, required this.state, required this.dateSubscribed});

  factory EnrollmentsModel.fromMap(Map<String, dynamic> map) {
    return EnrollmentsModel(
        userEnroll: UserEnrollModel.fromMap(map['user']),
        state: EnrollmentStateEnumExtension.stringToEnumMap(map['state']),
        dateSubscribed:
            DateTime.fromMillisecondsSinceEpoch(map['date_subscribed']));
  }
}
