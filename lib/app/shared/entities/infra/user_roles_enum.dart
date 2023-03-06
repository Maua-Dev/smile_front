// ignore_for_file: constant_identifier_names

import 'package:enum_to_string/enum_to_string.dart';

import '../../../../generated/l10n.dart';

enum UserRolesEnum {
  STUDENT,
  EXTERNAL,
  EMPLOYEE,
  INTERNAL_STUDENT,
  PROFESSOR,
  ADMIN
}

extension UserRolesEnumExtension on UserRolesEnum {
  static UserRolesEnum stringToEnumMap(String toMap) {
    UserRolesEnum modality = UserRolesEnum.values.firstWhere((modality) =>
        EnumToString.convertToString(modality).toUpperCase() ==
        toMap.toUpperCase());
    return modality;
  }

  static String enumToStringMap(UserRolesEnum modality) {
    return EnumToString.convertToString(modality);
  }

  String get personalizedNamed {
    return S.current.userRolesNameSchema(toString());
  }
}
