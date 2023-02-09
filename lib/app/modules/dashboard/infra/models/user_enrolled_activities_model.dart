import 'package:smile_front/app/shared/models/activity_model.dart';

import '../../../../shared/entities/infra/enrollment_state_enum.dart';

class UserEnrolledActivitiesModel {
  final ActivityModel activity;
  final EnrollmentStateEnum state;

  UserEnrolledActivitiesModel(
      {required this.activity, this.state = EnrollmentStateEnum.NONE});

  factory UserEnrolledActivitiesModel.fromMap(Map<String, dynamic> map) {
    return UserEnrolledActivitiesModel(
      activity: ActivityModel.fromMap(map['activity']),
      state: EnrollmentStateEnumExtension.stringToEnumMap(map['state']),
    );
  }

  static List<UserEnrolledActivitiesModel> fromMaps(List array) {
    return array.map((e) => UserEnrolledActivitiesModel.fromMap(e)).toList();
  }

  UserEnrolledActivitiesModel copyWith({
    ActivityModel? activity,
    EnrollmentStateEnum? state,
  }) {
    return UserEnrolledActivitiesModel(
      activity: activity ?? this.activity,
      state: state ?? this.state,
    );
  }
}
