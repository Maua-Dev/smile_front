// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:smile_front/app/shared/models/enrollments_model.dart';

class ListItem {
  EnrollmentsModel enrollment;
  bool isSwitched;

  ListItem({
    required this.isSwitched,
    required this.enrollment,
  });
}
