import '../../../../../generated/l10n.dart';
import '../../../../shared/utils/s3_assets_url.dart';

enum MauaEntitiesEnum {
  dev,
  atletica,
  ca,
  diversidade,
  enactus,
  //esports,
  inova,
  mauajr,
  mauasocial,
  //mbc,
  nae,
  //nine,
  finance,
  //baja,
  ecomaua,
  // mauaracing2,
  // mauaracing
}

extension MauaEntitiesEnumExtension on MauaEntitiesEnum {
  String get name {
    return S.current.mauaEntitiesSchemaSocialMidia(toString());
  }

  String get instagramUrl {
    return S.current.mauaEntitiesSchemaInstagramUrl(toString());
  }

  String get logoUrl {
    switch (this) {
      case MauaEntitiesEnum.atletica:
        return '${s3AssetsBaseUrl}logo_entidades_atletica.png';
      case MauaEntitiesEnum.ca:
        return '${s3AssetsBaseUrl}logo_entidades_ca.png';
      case MauaEntitiesEnum.diversidade:
        return '${s3AssetsBaseUrl}logo_entidades_diversidade.png';
      case MauaEntitiesEnum.enactus:
        return '${s3AssetsBaseUrl}logo_entidades_enactus.png';
      // case MauaEntitiesEnum.esports:
      //   return '${s3AssetsBaseUrl}logo_entidades_esports.png';
      case MauaEntitiesEnum.inova:
        return '${s3AssetsBaseUrl}logo_entidades_inova.png';
      case MauaEntitiesEnum.mauajr:
        return '${s3AssetsBaseUrl}logo_entidades_mauajr.png';
      case MauaEntitiesEnum.mauasocial:
        return '${s3AssetsBaseUrl}logo_entidades_social.png';
      // case MauaEntitiesEnum.mbc:
      //   return '${s3AssetsBaseUrl}logo_entidades_business.png';
      case MauaEntitiesEnum.nae:
        return '${s3AssetsBaseUrl}logo_entidades_nae.png';
      case MauaEntitiesEnum.dev:
        return '${s3AssetsBaseUrl}logo_entidades_dev.png';
      // case MauaEntitiesEnum.nine:
      //   return '${s3AssetsBaseUrl}logo_entidades_nine.png';
      case MauaEntitiesEnum.finance:
        //   return '${s3AssetsBaseUrl}logo_entidades_finance.png';
        // case MauaEntitiesEnum.baja:
        return '${s3AssetsBaseUrl}logo_entidades_baja.png';
      case MauaEntitiesEnum.ecomaua:
        //   return '${s3AssetsBaseUrl}logo_entidades_eco.png';
        // case MauaEntitiesEnum.mauaracing2:
        return '${s3AssetsBaseUrl}logo_entidades_mauah2.png';
      // case MauaEntitiesEnum.mauaracing:
      //   return '${s3AssetsBaseUrl}logo_entidades_racing.png';
    }
  }
}
