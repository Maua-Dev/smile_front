import '../../../../../generated/l10n.dart';
import 'package:smile_front/app/shared/helpers/services/s3/assets_s3.dart';

enum SpeakersEnum {
  wellington,
  vanessa,
  bruno,
  andressa,
  daniela,
  sonia,
  jonathan,
  flavia,
  renato,
  ana,
  helga,
  gustavo,
  joseph
}

extension SpeakersEnumExtension on SpeakersEnum {
  String get name {
    return S.current.speakersSchemaName(toString());
  }

  String get description {
    return S.current.speakersSchemaDescription(toString());
  }

  String get linkPhoto {
    switch (this) {
      case SpeakersEnum.bruno:
        return '${speakersLogoUrl}bruno_keizo.jpg';
      case SpeakersEnum.wellington:
        return '${speakersLogoUrl}wellington_vitorino.jpg';
      case SpeakersEnum.vanessa:
        return '${speakersLogoUrl}vanessa_pirateli.PNG';
      case SpeakersEnum.andressa:
        return '${speakersLogoUrl}andressa_martins.jpg';
      case SpeakersEnum.flavia:
        return '${speakersLogoUrl}flavia_janine.jpg';
      case SpeakersEnum.daniela:
        return '${speakersLogoUrl}daniela_klaiman.jpg';
      case SpeakersEnum.jonathan:
        return '${speakersLogoUrl}jonathan_ando.jpg';
      case SpeakersEnum.sonia:
        return '${speakersLogoUrl}sonia_guimaraes.jpg';
      case SpeakersEnum.renato:
        return '${speakersLogoUrl}renato_grau.jpg';
      case SpeakersEnum.ana:
        return '${speakersLogoUrl}ana_cristina.jpg';
      case SpeakersEnum.helga:
        return '${speakersLogoUrl}helga_braren.jpg';
      case SpeakersEnum.gustavo:
        return '${speakersLogoUrl}gustavo_paganini.jpg';
      case SpeakersEnum.joseph:
        return '${speakersLogoUrl}joseph_youssif.jpg';
    }
  }
}
