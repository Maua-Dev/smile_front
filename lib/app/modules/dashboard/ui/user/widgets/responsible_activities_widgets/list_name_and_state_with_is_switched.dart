import 'package:smile_front/app/shared/entities/infra/enrollment_state_enum.dart';

class ListNameAndStateWithIsSwitched {
  String name;
  String userId;
  EnrollmentStateEnum state;
  bool isSwitched;

  ListNameAndStateWithIsSwitched({
    required this.name,
    required this.userId,
    required this.state,
    required this.isSwitched,
  });

  ListNameAndStateWithIsSwitched copyWith({
    String? name,
    String? userId,
    EnrollmentStateEnum? state,
    bool? isSwitched,
  }) {
    return ListNameAndStateWithIsSwitched(
        name: name ?? this.name,
        userId: userId ?? this.userId,
        isSwitched: isSwitched ?? this.isSwitched,
        state: state ?? this.state);
  }

  void toogleSwitch(bool value) {
    isSwitched = value;
  }
}
