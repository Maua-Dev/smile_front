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
  String get name {
    switch (this) {
      case EnrollmentStateEnum.ENROLLED:
        return 'Inscrito';
      case EnrollmentStateEnum.IN_QUEUE:
        return 'Na fila';
      case EnrollmentStateEnum.COMPLETED:
        return 'Completo';
      case EnrollmentStateEnum.DROPPED:
        return 'Dropped';
      case EnrollmentStateEnum.REJECTED:
        return 'Rejeitado';
      case EnrollmentStateEnum.NONE:
        return '';
    }
  }

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
