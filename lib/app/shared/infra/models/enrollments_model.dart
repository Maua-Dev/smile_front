import 'package:smile_front/app/shared/domain/enum/enrollment_state_enum.dart';
import 'package:smile_front/app/shared/infra/models/user_enroll_model.dart';

class EnrollmentsModel {
  late final EnrollmentStateEnum state;
  final DateTime dateSubscribed;
  final UserEnrollModel? user;

  EnrollmentsModel(
      {required this.state, required this.dateSubscribed, this.user});

  factory EnrollmentsModel.fromMap(Map<String, dynamic> map) {
    return EnrollmentsModel(
      user: map['user'] == null ? null : UserEnrollModel.fromMap(map['user']),
      state: EnrollmentStateEnumExtension.stringToEnumMap(map['state']),
      dateSubscribed:
          DateTime.fromMillisecondsSinceEpoch(map['date_subscribed']),
    );
  }

  static List<EnrollmentsModel> fromMaps(List array) {
    return array.map((e) => EnrollmentsModel.fromMap(e)).toList();
  }

  factory EnrollmentsModel.newInstance() {
    return EnrollmentsModel(
      user: UserEnrollModel.newInstance(),
      state: EnrollmentStateEnum.NONE,
      dateSubscribed: DateTime.now(),
    );
  }
}
