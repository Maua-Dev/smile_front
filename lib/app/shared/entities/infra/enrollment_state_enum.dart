// ignore_for_file: constant_identifier_names

import 'package:enum_to_string/enum_to_string.dart';

enum EnrollmentStateEnum {
  ENROLLED,
  IN_QUEUE,
  COMPLETED,
  DROPPED,
  REJECTED,
  NONE
}

extension EnrollmentStateEnumExtension on EnrollmentStateEnum {
  static EnrollmentStateEnum stringToEnumMap(String toMap) {
    EnrollmentStateEnum modality = EnrollmentStateEnum.values.firstWhere(
        (modality) =>
            EnumToString.convertToString(modality).toUpperCase() ==
            toMap.toUpperCase());
    return modality;
  }

  static String enumToStringMap(EnrollmentStateEnum modality) {
    return EnumToString.convertToString(modality).toUpperCase();
  }
}
