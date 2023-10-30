import 'package:dio/dio.dart';
import 'package:smile_front/app/shared/helpers/environment/environment_config.dart';

final smileOption = BaseOptions(
    baseUrl: EnvironmentConfig.MSS_ACTIVITIES_BASE_URL,
    connectTimeout: 5000,
    receiveTimeout: 3000);
