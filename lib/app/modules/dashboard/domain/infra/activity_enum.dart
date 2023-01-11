// ignore_for_file: constant_identifier_names

import 'package:enum_to_string/enum_to_string.dart';
import 'package:smile_front/generated/l10n.dart';

import '../../../../shared/utils/s3_assets_url.dart';

enum ActivityEnum {
  CURSOS,
  PALESTRAS,
  PALESTRAS_ALTO_IMPACTO,
  VISITAS_TECNICAS,
  COMPETICOES_ACADEMICAS,
  HACKATHON,
  FEIRA_ESTAGIOS,
  CAFE_EX_ALUNOS,
  ACADEMIA_DE_PROFESSORES,
  ATIVIDADE_CULTURAL,
  GCSP,
  ATIVIDADE_ESPORTIVA
}

extension ActivityEnumExtension on ActivityEnum {
  String get name {
    return S.current.activitiesOfferedName(toString());
  }

  String get description {
    return S.current.activitiesOfferedDescription(toString());
  }

  String get linkPhoto {
    switch (this) {
      case ActivityEnum.CURSOS:
        return '${previousEditionsBaseUrl}cursos.png';
      case ActivityEnum.PALESTRAS:
        return '${previousEditionsBaseUrl}palestras.png';
      case ActivityEnum.PALESTRAS_ALTO_IMPACTO:
        return '${previousEditionsBaseUrl}palestra_alto_impacto.png';
      case ActivityEnum.VISITAS_TECNICAS:
        return '${previousEditionsBaseUrl}visitas_tecnicas.png';
      case ActivityEnum.COMPETICOES_ACADEMICAS:
        return '${previousEditionsBaseUrl}competicao_academica.png';
      case ActivityEnum.HACKATHON:
        return '${previousEditionsBaseUrl}hackathon.png';
      case ActivityEnum.FEIRA_ESTAGIOS:
        return '${previousEditionsBaseUrl}feira_estagios.png';
      case ActivityEnum.CAFE_EX_ALUNOS:
        return '${previousEditionsBaseUrl}cafe_ex_aluno.png';
      case ActivityEnum.ACADEMIA_DE_PROFESSORES:
        return '${previousEditionsBaseUrl}academia_professores.png';
      case ActivityEnum.ATIVIDADE_CULTURAL:
        return '${previousEditionsBaseUrl}atividade_cultural.png';
      case ActivityEnum.GCSP:
        return '${previousEditionsBaseUrl}gcsp.png';
      case ActivityEnum.ATIVIDADE_ESPORTIVA:
        return '${previousEditionsBaseUrl}atividade_esportiva.png';
    }
  }

  static ActivityEnum stringToEnumMap(String toMap) {
    ActivityEnum type = ActivityEnum.values.firstWhere((type) =>
        EnumToString.convertToString(type).toUpperCase() ==
        toMap.toUpperCase());
    return type;
  }

  static String enumToStringMap(ActivityEnum type) {
    return EnumToString.convertToString(type);
  }
}
