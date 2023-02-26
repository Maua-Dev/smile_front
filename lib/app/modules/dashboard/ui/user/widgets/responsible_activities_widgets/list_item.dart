// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:smile_front/app/shared/entities/infra/enrollment_state_enum.dart';

class ListItem {
  EnrollmentStateEnum state;
  String name;
  bool isSwitched;

  ListItem({
    required this.state,
    required this.name,
    required this.isSwitched,
  });
}
