import 'package:dio/dio.dart';
import 'package:smile_front/app/shared/helpers/environment/environment_config.dart';

final smileLoginOption = BaseOptions(
  baseUrl: EnvironmentConfig.MSS_USER_BASE_URL,
);
