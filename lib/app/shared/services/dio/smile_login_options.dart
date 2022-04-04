import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final String? url = dotenv.env['MSS_USER_BASE_URL'];

final smileLoginOption =
    BaseOptions(baseUrl: url!, connectTimeout: 5000, receiveTimeout: 3000);
