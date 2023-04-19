import '../../../../../generated/l10n.dart';
import '../../../../shared/utils/s3_assets_url.dart';

enum SpeakersEnum {
  bruno,
  wellington,
  vanessa,
  andressa,
  flavia,
  daniela,
  jonathan,
  sonia
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
    }
  }
}
