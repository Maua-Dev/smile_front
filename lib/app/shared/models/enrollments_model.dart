import '../entities/infra/enrollment_state_enum.dart';

class EnrollmentsModel {
  final EnrollmentStateEnum state;
  final DateTime dateSubscribed;

  EnrollmentsModel({required this.state, required this.dateSubscribed});

  factory EnrollmentsModel.fromMap(Map<String, dynamic> map) {
    return EnrollmentsModel(
        state: EnrollmentStateEnumExtension.stringToEnumMap(map['state']),
        dateSubscribed:
            DateTime.fromMillisecondsSinceEpoch(map['date_subscribed']));
  }

  static List<EnrollmentsModel> fromMaps(List array) {
    return array.map((e) => EnrollmentsModel.fromMap(e)).toList();
  }
}
