import '../../../../../generated/l10n.dart';
import '../../../../shared/utils/s3_assets_url.dart';

enum SpeakersEnum { nina, viviane, leila, boris, marco, willian }

extension SpeakersEnumExtension on SpeakersEnum {
  String get name {
    return S.current.speakersSchemaName(toString());
  }

  String get description {
    return S.current.speakersSchemaDescription(toString());
  }

  String get linkPhoto {
    switch (this) {
      case SpeakersEnum.nina:
        return '${speakersLogoUrl}nina_silva.png';
      case SpeakersEnum.viviane:
        return '${speakersLogoUrl}viviane_nunes.png';
      case SpeakersEnum.leila:
        return '${speakersLogoUrl}leila_ferreira.png';
      case SpeakersEnum.boris:
        return '${speakersLogoUrl}boris_fabris.png';
      case SpeakersEnum.marco:
        return '${speakersLogoUrl}marco_antonio.png';
      case SpeakersEnum.willian:
        return '${speakersLogoUrl}william_schoenell.jpg';
    }
  }
}
