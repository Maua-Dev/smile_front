// ignore_for_file: constant_identifier_names

import '../../../../shared/utils/s3_assets_url.dart';

enum MauaEntitiesEnum {
  dev,
  mauajr_finace,
  bateria_atletica,
  enactus_inova,
  eco_aero_space,
  nae_ca,
  social_diversidade,
}

extension MauaEntitiesEnumExtension on MauaEntitiesEnum {
  String get logoUrl {
    switch (this) {
      case MauaEntitiesEnum.bateria_atletica:
        return '${s3AssetsBaseUrl}entidades/bateria_atletica.png';
      case MauaEntitiesEnum.dev:
        return '${s3AssetsBaseUrl}entidades/dev.png';
      case MauaEntitiesEnum.eco_aero_space:
        return '${s3AssetsBaseUrl}entidades/eco_aero_space.png';
      case MauaEntitiesEnum.enactus_inova:
        return '${s3AssetsBaseUrl}entidades/enactus_inova.png';
      case MauaEntitiesEnum.mauajr_finace:
        return '${s3AssetsBaseUrl}entidades/mauajr_finace.png';
      case MauaEntitiesEnum.nae_ca:
        return '${s3AssetsBaseUrl}entidades/nae_ca.png';
      case MauaEntitiesEnum.social_diversidade:
        return '${s3AssetsBaseUrl}entidades/social_diversidade.png';
    }
  }
}
