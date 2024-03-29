// ignore_for_file: constant_identifier_names

import 'package:enum_to_string/enum_to_string.dart';
import 'package:smile_front/generated/l10n.dart';

import '../../../../shared/utils/s3_assets_url.dart';

enum ActivityEnum {
  COURSES,
  INTERNATIONAL_WORKSHOP,
  LECTURES,
  TECHNICAL_VISITS,
  ACADEMIC_COMPETITIONS,
  HACKATHON,
  INTERNSHIP_FAIR,
  ALUMNI_CAFE,
  PROFESSORS_ACADEMY,
  CULTURAL_ACTIVITY,
  SPORTS_ACTIVITY,
  PANELS,
  MAUA_PLUS,
  ENGINEERING,
}

extension ActivityEnumExtension on ActivityEnum {
  String get name {
    return S.current.activitiesOfferedName(toString());
  }

  String get description {
    return '<p>${S.current.activitiesOfferedDescription(toString())}</p>';
  }

  String get linkPhoto {
    switch (this) {
      case ActivityEnum.COURSES:
        return '${previousEditionsBaseUrl}cursos.png';
      case ActivityEnum.LECTURES:
        return '${previousEditionsBaseUrl}palestras.png';
      case ActivityEnum.PANELS:
        return '${previousEditionsBaseUrl}palestras_alto_impacto.png';
      case ActivityEnum.TECHNICAL_VISITS:
        return '${previousEditionsBaseUrl}visitas_tecnicas.png';
      case ActivityEnum.ACADEMIC_COMPETITIONS:
        return '${previousEditionsBaseUrl}competicao_academica.png';
      case ActivityEnum.HACKATHON:
        return '${previousEditionsBaseUrl}hackathon.png';
      case ActivityEnum.INTERNSHIP_FAIR:
        return '${previousEditionsBaseUrl}feira_estagios.png';
      case ActivityEnum.ALUMNI_CAFE:
        return '${previousEditionsBaseUrl}cafe_ex_aluno.png';
      case ActivityEnum.PROFESSORS_ACADEMY:
        return '${previousEditionsBaseUrl}academia_professores.png';
      case ActivityEnum.CULTURAL_ACTIVITY:
        return '${previousEditionsBaseUrl}atividade_cultural.png';
      case ActivityEnum.MAUA_PLUS:
        return '${previousEditionsBaseUrl}gcsp.png';
      case ActivityEnum.SPORTS_ACTIVITY:
        return '${previousEditionsBaseUrl}atividade_esportiva.png';
      case ActivityEnum.INTERNATIONAL_WORKSHOP:
        return '${previousEditionsBaseUrl}workshop_internacional.png';
      case ActivityEnum.ENGINEERING:
        return '${previousEditionsBaseUrl}engenharias.png';
    }
  }

  static ActivityEnum stringToEnumMap(String toMap) {
    ActivityEnum type = ActivityEnum.values.firstWhere((type) =>
        EnumToString.convertToString(type).toUpperCase() ==
        toMap.toUpperCase());
    return type;
  }

  static String enumToStringMap(ActivityEnum type) {
    return EnumToString.convertToString(type).toUpperCase();
  }
}
