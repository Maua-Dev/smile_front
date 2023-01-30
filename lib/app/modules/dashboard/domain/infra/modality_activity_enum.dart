import 'package:enum_to_string/enum_to_string.dart';

enum DeliveryEnum {
  inperson,
  online,
  hybrid,
}

extension DeliveryEnumExtension on DeliveryEnum {
  String get name {
    switch (this) {
      case DeliveryEnum.inperson:
        return 'Presencial';
      case DeliveryEnum.online:
        return 'Online';
      case DeliveryEnum.hybrid:
        return 'Hibrida';
    }
  }

  static DeliveryEnum stringToEnumMap(String toMap) {
    DeliveryEnum modality = DeliveryEnum.values.firstWhere((modality) =>
        EnumToString.convertToString(modality).toUpperCase() ==
        toMap.toUpperCase());
    return modality;
  }

  static String enumToStringMap(DeliveryEnum modality) {
    return EnumToString.convertToString(modality);
  }
}
