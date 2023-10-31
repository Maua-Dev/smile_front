// ignore_for_file: constant_identifier_names

import 'package:enum_to_string/enum_to_string.dart';

enum DeliveryEnum {
  IN_PERSON,
  ONLINE,
  HYBRID,
}

extension DeliveryEnumExtension on DeliveryEnum {
  String get name {
    switch (this) {
      case DeliveryEnum.IN_PERSON:
        return 'Presencial';
      case DeliveryEnum.ONLINE:
        return 'Online';
      case DeliveryEnum.HYBRID:
        return 'Híbrida';
    }
  }

  static DeliveryEnum stringToEnumMap(String toMap) {
    DeliveryEnum modality = DeliveryEnum.values.firstWhere((modality) =>
        EnumToString.convertToString(modality).toUpperCase() ==
        toMap.toUpperCase());
    return modality;
  }

  static String enumToStringMap(DeliveryEnum modality) {
    return EnumToString.convertToString(modality).toUpperCase();
  }
}
