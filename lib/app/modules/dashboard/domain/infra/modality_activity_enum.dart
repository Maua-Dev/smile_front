import 'package:enum_to_string/enum_to_string.dart';

enum ModalityActivityEnum {
  presencial,
  online,
  hibrida,
}

extension ModalityActivityEnumExtension on ModalityActivityEnum {
  String get name {
    switch (this) {
      case ModalityActivityEnum.presencial:
        return 'Presencial';
      case ModalityActivityEnum.online:
        return 'Online';
      case ModalityActivityEnum.hibrida:
        return 'Hibrida';
    }
  }

  static ModalityActivityEnum stringToEnumMap(String toMap) {
    ModalityActivityEnum modality = ModalityActivityEnum.values.firstWhere(
        (modality) =>
            EnumToString.convertToString(modality).toUpperCase() ==
            toMap.toUpperCase());
    return modality;
  }

  static String enumToStringMap(ModalityActivityEnum modality) {
    return EnumToString.convertToString(modality);
  }
}

