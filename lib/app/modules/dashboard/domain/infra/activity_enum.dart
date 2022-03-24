// ignore_for_file: constant_identifier_names

import 'package:enum_to_string/enum_to_string.dart';

enum ActivityEnum {
  CURSOS,
  PALESTRAS,
  PALESTRAS_ALTO_IMPACTO,
  VISITAS_TECNICAS,
  COMPETICOES_ACADEMICAS,
  HACKATHONS,
  FEIRA_ESTAGIOS,
  CAFE_EX_ALUNOS,
  ACADEMIA_DE_PROFESSORES,
  ATIVIDADE_CULTURAL,
  GCSP,
  ATIVIDADE_ESPORTIVA
}

extension ActivityEnumExtension on ActivityEnum {
  String get name {
    switch (this) {
      case ActivityEnum.CURSOS:
        return 'Cursos';
      case ActivityEnum.PALESTRAS:
        return 'Palestras';
      case ActivityEnum.PALESTRAS_ALTO_IMPACTO:
        return 'Palestras de Alto Impacto';
      case ActivityEnum.VISITAS_TECNICAS:
        return 'Visitas Técnicas';
      case ActivityEnum.COMPETICOES_ACADEMICAS:
        return 'Competições Acadêmicas';
      case ActivityEnum.HACKATHONS:
        return 'Hackathons';
      case ActivityEnum.FEIRA_ESTAGIOS:
        return 'Feira de Estágios';
      case ActivityEnum.CAFE_EX_ALUNOS:
        return 'Café com Ex-aluno(a)';
      case ActivityEnum.ACADEMIA_DE_PROFESSORES:
        return 'Academia de Professores';
      case ActivityEnum.ATIVIDADE_CULTURAL:
        return 'Atividade Cultural';
      case ActivityEnum.GCSP:
        return 'GCSP';
      case ActivityEnum.ATIVIDADE_ESPORTIVA:
        return 'Atividade Esportiva';
    }
  }

  static ActivityEnum stringToEnumMap(String toMap) {
    ActivityEnum type = ActivityEnum.values
        .firstWhere((type) => EnumToString.convertToString(type) == toMap);
    return type;
  }

  static String enumToStringMap(ActivityEnum type) {
    return EnumToString.convertToString(type);
  }
}
