// ignore_for_file: constant_identifier_names

import 'package:enum_to_string/enum_to_string.dart';

enum AccessLevelEnum { ADMIN, USER }

extension AccessLevelEnumExtension on AccessLevelEnum {
  static AccessLevelEnum stringToEnumMap(String toMap) {
    AccessLevelEnum type = AccessLevelEnum.values.firstWhere((type) =>
        EnumToString.convertToString(type).toUpperCase() ==
        toMap.toUpperCase());
    return type;
  }

  static String enumToStringMap(AccessLevelEnum type) {
    return EnumToString.convertToString(type).toUpperCase();
  }
}
