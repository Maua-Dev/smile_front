// ignore_for_file: constant_identifier_names

import 'package:enum_to_string/enum_to_string.dart';

enum EnrollmentStateEnum { NONE, ENROLLED, IN_QUEUE, DROPPED }

extension EnrollmentStateEnumExtension on EnrollmentStateEnum {
  static EnrollmentStateEnum stringToEnumMap(String toMap) {
    EnrollmentStateEnum type = EnrollmentStateEnum.values.firstWhere((type) =>
        EnumToString.convertToString(type).toUpperCase() ==
        toMap.toUpperCase());
    return type;
  }

  static String enumToStringMap(EnrollmentStateEnum type) {
    return EnumToString.convertToString(type);
  }
}
