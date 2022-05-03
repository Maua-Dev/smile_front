import 'package:smile_front/app/shared/services/enviroment/enviroment_config.dart';

var csvUrl = Uri.parse(
    "https://support.staffbase.com/hc/en-us/article_attachments/360009197031/username.csv");

var s3AssetsBaseUrl = EnvironmentConfig.S3_BASE_URL;

var previousEditionsBaseUrl = '${s3AssetsBaseUrl}edicoes-anteriores/';

var rectorsBaseUrl = '${s3AssetsBaseUrl}activities/reitor-e-pro-reitor/';

var smileeeLogoUrl = '${s3AssetsBaseUrl}logo_smileee.png';

var smileLogoUrl = '${s3AssetsBaseUrl}logo_smile.png';

var mauaCampusUrl = '${s3AssetsBaseUrl}maua_campus.png';

var mauaCampusBlurUrl = '${s3AssetsBaseUrl}maua_campus_blur.png';

var speakersLogoUrl = '${s3AssetsBaseUrl}activities/palestra-de-alto-impacto/';
