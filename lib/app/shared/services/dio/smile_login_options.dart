import 'package:dio/dio.dart';
import 'package:smile_front/app/shared/services/enviroment/enviroment_config.dart';

final smileLoginOption = BaseOptions(
    baseUrl: EnvironmentConfig.MSS_USER_BASE_URL,
    connectTimeout: 5000,
    receiveTimeout: 3000);
