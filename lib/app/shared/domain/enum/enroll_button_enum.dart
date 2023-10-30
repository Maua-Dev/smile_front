// ignore_for_file: constant_identifier_names

enum EnrollButtonEnum {
  COMPLETED,
  INSCRITO,
  INSCREVA_SE,
  INDISPONIVEL,
  ENTRAR_NA_FILA,
  NA_FILA
}

extension EnrollButtonEnumExtension on EnrollButtonEnum {
  String get name {
    switch (this) {
      case EnrollButtonEnum.INSCRITO:
        return 'Inscrito';
      case EnrollButtonEnum.NA_FILA:
        return 'Na fila';
      case EnrollButtonEnum.COMPLETED:
        return 'Completo';
      case EnrollButtonEnum.INDISPONIVEL:
        return 'Indisponível';
      case EnrollButtonEnum.ENTRAR_NA_FILA:
        return 'Entrar na Fila';
      case EnrollButtonEnum.INSCREVA_SE:
        return 'Inscreva-se';
    }
  }
}
