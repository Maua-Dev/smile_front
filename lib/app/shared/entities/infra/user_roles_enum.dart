// ignore_for_file: constant_identifier_names
import 'package:enum_to_string/enum_to_string.dart';

enum UserRolesEnum {
  student,
  external,
  employee,
  international_student,
  professor,
  admin
}

extension UserRolesEnumExtension on UserRolesEnum {
  String get name {
    switch (this) {
      case UserRolesEnum.student:
        return 'Student';
      case UserRolesEnum.external:
        return 'External';
      case UserRolesEnum.employee:
        return 'Employee';
      case UserRolesEnum.international_student:
        return 'International Student';
      case UserRolesEnum.professor:
        return 'Professor';
      case UserRolesEnum.admin:
        return 'Admin';
    }
  }

  static UserRolesEnum stringToEnumMap(String toMap) {
    UserRolesEnum modality = UserRolesEnum.values.firstWhere((modality) =>
        EnumToString.convertToString(modality).toUpperCase() ==
        toMap.toUpperCase());
    return modality;
  }

  static String enumToStringMap(UserRolesEnum modality) {
    return EnumToString.convertToString(modality);
  }
}
