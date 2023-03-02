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
}
