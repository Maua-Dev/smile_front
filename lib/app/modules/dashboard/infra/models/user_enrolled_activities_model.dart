import 'package:smile_front/app/shared/models/activity_model.dart';

import '../../../../shared/entities/infra/enrollment_state_enum.dart';

class UserEnrolledActivitiesModel {
  final ActivityModel activity;
  final EnrollmentStateEnum state;

  UserEnrolledActivitiesModel({required this.activity, required this.state});

  factory UserEnrolledActivitiesModel.fromMap(Map<String, dynamic> map) {
    return UserEnrolledActivitiesModel(
      activity: ActivityModel.fromMap(map['activity']),
      state: EnrollmentStateEnumExtension.stringToEnumMap(map['state']),
    );
  }

  static List<UserEnrolledActivitiesModel> fromMaps(List array) {
    return array.map((e) => UserEnrolledActivitiesModel.fromMap(e)).toList();
  }
}
